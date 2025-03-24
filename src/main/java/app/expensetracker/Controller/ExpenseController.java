package app.expensetracker.Controller;

import app.expensetracker.Model.Expense;
import app.expensetracker.Model.User;
import app.expensetracker.Services.ExpenseService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.List;

@Controller
public class ExpenseController {

    @Autowired
    private ExpenseService expenseService;

    // Show the Add Expense form
    @RequestMapping("addExpenses")
    public ModelAndView addExpenseForm() {
        return new ModelAndView("addExp"); // This should map to addExp.jsp
    }

    // Handle form submission for adding expenses
    @PostMapping("/saveExpense")
    public String saveExpense(
            @RequestParam("expenseName") String expenseName,
            @RequestParam("amount") double amount,
            @RequestParam("category") String category,
            @RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date,
            @RequestParam("notes") String notes,
            HttpSession session,
            Model model) {

        // Retrieve logged-in user from session
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        System.out.println("Logged in user: " + session.getAttribute("loggedInUser"));

        if (loggedInUser == null) {
            return "redirect:/login"; // Redirect to login page if user is not logged in
        }

        // Create and save the expense
        Expense expense = new Expense();
        expense.setExpenseName(expenseName);
        expense.setAmount(amount);
        expense.setCategory(category);
        expense.setDate(date);
        expense.setNotes(notes);
        expense.setUser(loggedInUser);

        expenseService.saveExpense(expense);

        // Redirect to dashboard or expense list after successful save
        return "redirect:/viewExp";
    }

    // Show the Update Expense form with expense data
    @RequestMapping("updateExpenses")
    public ModelAndView updateExpenseForm(@RequestParam("id") int id) {
        ModelAndView mv = new ModelAndView("updateExpense");
        Expense expense = expenseService.getExpenseById(id); // Fetch expense from DB
        mv.addObject("expense", expense); // Pass it to JSP
        return mv;
    }

    @PostMapping("processUpdateExpense")
    public String processUpdateExpense(@RequestParam("id") int id,
                                       @RequestParam("expenseName") String expenseName,
                                       @RequestParam("amount") double amount,
                                       @RequestParam("category") String category,
                                       @RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate date,
                                       @RequestParam("notes") String notes,
                                       RedirectAttributes redirectAttributes) {
        Expense expense = expenseService.getExpenseById(id);
        if (expense != null) {
            expense.setExpenseName(expenseName);
            expense.setAmount(amount);
            expense.setCategory(category);
            expense.setDate(date);
            expense.setNotes(notes);
            expenseService.saveExpense(expense); // Save the updated expense
            redirectAttributes.addFlashAttribute("message", "Expense updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Expense not found!");
        }
        return "redirect:/viewExp";
    }




    // Handle Delete Expense
    @RequestMapping("deleteExpenses")
    public String deleteExpense(@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
        expenseService.deleteExpenseById(id); // Delete from DB
        redirectAttributes.addFlashAttribute("message", "Expense deleted successfully!");
        return "redirect:/viewExp"; // Redirect to expense list
    }



    // Display filter form
    @RequestMapping("viewExpFilter")
    public ModelAndView showFilterForm() {
        return new ModelAndView("viewByFilter"); // Maps to viewByFilter.jsp
    }

    // Process filter form submission
    @PostMapping("viewExpFilter")
    public ModelAndView filterExpenses(
            @RequestParam(value = "date", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date,
            @RequestParam(value = "year", required = false) String year,
            @RequestParam(value = "category", required = false) String category,
            HttpSession session) {

        ModelAndView mv = new ModelAndView("viewByFilter");
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            mv.setViewName("redirect:/login");
            return mv;
        }

        List<Expense> filteredExpenses = expenseService.filterExpenses(loggedInUser, date, year, category);
        mv.addObject("filteredExpenses", filteredExpenses);
        // Also pass back the filter parameters to pre-fill the form
        mv.addObject("selectedDate", date);
        mv.addObject("selectedYear", year);
        mv.addObject("selectedCategory", category);
        System.out.println("Filtered expenses: " + filteredExpenses);
        return mv;
    }


    // Show all Expenses with optional sorting
    @RequestMapping("viewExp")
    public ModelAndView viewExpenses(
            HttpSession httpSession,
            @RequestParam(value = "sortField", required = false, defaultValue = "date") String sortField,
            @RequestParam(value = "sortDir", required = false, defaultValue = "asc") String sortDir) {

        ModelAndView mv = new ModelAndView("viewExpenses");

        // Retrieve logged-in user from session
        User loggedInUser = (User) httpSession.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            mv.setViewName("redirect:/login");
            return mv;
        }

        // Build Sort object
        Sort sort = Sort.by(sortField);
        sort = "desc".equalsIgnoreCase(sortDir) ? sort.descending() : sort.ascending();

        // Fetch expenses sorted accordingly
        List<Expense> expenses = expenseService.getExpensesByUserSorted(loggedInUser, sort);
        mv.addObject("expenses", expenses);

        double total = expenses.stream().mapToDouble(Expense::getAmount).sum();
        int count = expenses.size();

        mv.addObject("totalExpense", total);
        mv.addObject("expenseCount", count);

        // Pass sort parameters to the view (for use in links, etc.)
        mv.addObject("sortField", sortField);
        mv.addObject("sortDir", sortDir);

        return mv;
    }

}
