package app.expensetracker.Services;

import app.expensetracker.Model.Expense;
import app.expensetracker.Model.User;
import app.expensetracker.Repos.ExpenseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ExpenseService implements app.expensetracker.Repos.ExpenseService {

    @Autowired
    private ExpenseRepository expenseRepository;

    public Expense saveExpense(Expense expense) {
        return expenseRepository.save(expense);
    }

    public List<Expense> getAllExpenses() {
        return expenseRepository.findAll();
    }

    public List<Expense> getExpensesByUser(User user) {
        return expenseRepository.findByUser(user);
    }

    // Add this method to fetch an Expense by its id
    public Expense getExpenseById(int id) {
        return expenseRepository.findById((long) id).orElse(null);
    }

    // Add this method to delete an Expense by its id
    public void deleteExpenseById(int id) {
        expenseRepository.deleteById((long) id);
    }

    public List<Expense> filterExpenses(User user, LocalDate date, String year, String category) {
        Specification<Expense> spec = Specification.where(expenseBelongsToUser(user));

        if (date != null) {
            spec = spec.and(expenseHasDate(date));
        }
        if (year != null && !year.trim().isEmpty()) {
            int yr = Integer.parseInt(year);
            LocalDate start = LocalDate.of(yr, 1, 1);
            LocalDate end = LocalDate.of(yr, 12, 31);
            spec = spec.and(expenseBetweenDates(start, end));
        }
        if (category != null && !category.trim().isEmpty()) {
            spec = spec.and(expenseHasCategory(category));
        }

        List<Expense> result = expenseRepository.findAll(spec);
        System.out.println("Filtered expenses count: " + result.size());
        return result;
    }

    // Specifications for filtering
    private Specification<Expense> expenseBelongsToUser(User user) {
        return (root, query, cb) -> cb.equal(root.get("user"), user);
    }

    private Specification<Expense> expenseHasDate(LocalDate date) {
        return (root, query, cb) -> cb.equal(root.get("date"), date);
    }

    private Specification<Expense> expenseBetweenDates(LocalDate start, LocalDate end) {
        return (root, query, cb) -> cb.between(root.get("date"), start, end);
    }

    private Specification<Expense> expenseHasCategory(String category) {
        return (root, query, cb) -> cb.equal(root.get("category"), category);
    }

    public List<Expense> getExpensesByUserSorted(User user, Sort sort) {
        return expenseRepository.findByUser(user, sort);
    }

    // ✅ Corrected to ensure user-specific total expenses
    public double getTotalExpenses(User user) {
        return expenseRepository.getTotalExpensesByUser(user.getId());
    }

    // ✅ Corrected to ensure user-specific monthly expenses
    public double getMonthlyExpenses(User user) {
        return expenseRepository.getMonthlyExpensesForUser(user.getId());
    }

    // ✅ Corrected to return user-specific top category
    public String getTopCategory(User user) {
        List<String> categories = expenseRepository.getTopCategoryForUser(user.getId());
        return categories.isEmpty() ? "N/A" : categories.get(0);
    }

    // ✅ Corrected to return user-specific category-wise expenses
    public Map<String, Double> getCategoryWiseExpenses(User user) {
        Map<String, Double> categoryExpenses = new HashMap<>();
        for (String category : List.of("Food", "Transport", "Bills", "Entertainment", "Others")) {
            Double amount = expenseRepository.getExpenseByCategoryAndUser(category, user.getId());
            categoryExpenses.put(category, amount != null ? amount : 0.0);
        }
        return categoryExpenses;
    }

    // ✅ Corrected to return user-specific monthly expense breakdown
    public List<Double> getMonthlyExpensesBreakdown(User user) {
        List<Double> monthlyExpenses = new ArrayList<>();
        for (int i = 1; i <= 12; i++) {
            Double expense = expenseRepository.getExpenseByMonthAndUser(i, user.getId());
            monthlyExpenses.add(expense != null ? expense : 0.0);
        }
        return monthlyExpenses;
    }
}
