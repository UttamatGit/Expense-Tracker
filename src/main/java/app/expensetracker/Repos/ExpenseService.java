package app.expensetracker.Repos;

import app.expensetracker.Model.User;

import java.util.List;
import java.util.Map;

public interface ExpenseService {
    double getTotalExpenses(User user);
    double getMonthlyExpenses(User user);
    String getTopCategory(User user);
    Map<String, Double> getCategoryWiseExpenses(User user);
    List<Double> getMonthlyExpensesBreakdown(User user);
}
