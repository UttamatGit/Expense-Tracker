package app.expensetracker.Controller;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.JsonProcessingException;

import app.expensetracker.Model.User;
import app.expensetracker.Services.ExpenseService;
import app.expensetracker.Services.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;
    @Autowired
    private ExpenseService expenseService;

    @GetMapping("/")
    public String launchHome() {
        return "home";
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "home";
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        HttpSession session,
                        Model model) {
        if (userService.validateUser(email, password)) {
            User user = userService.getUserByEmail(email); // implement this in UserService
            session.setAttribute("loggedInUser", user);
            System.out.println("User Validated from DB");
            System.out.println("Logged in user: " + session.getAttribute("loggedInUser"));
            return "redirect:/dashboard"; // Redirect to dashboard.jsp
        } else {
            System.out.println("Validation failed");
            model.addAttribute("error", "Invalid email or password");
            return "home"; // Show login page with error message
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/"; // Redirect to login page
    }

//    @GetMapping("/dashboard")
//    public String dashboard(HttpSession session, Model model) {
//        // Check if the user is logged in
//        if (session.getAttribute("loggedInUser") == null) {
//            return "redirect:/";
//        }
//
//        // Fetching analytics data
//        double totalExpenses = expenseService.getTotalExpenses();
//        double monthlyExpenses = expenseService.getMonthlyExpenses();
//        String topCategory = expenseService.getTopCategory();
//
//        // Fetch category-wise expenses for the Pie Chart
//        Map<String, Double> categoryExpenses = expenseService.getCategoryWiseExpenses();
//
//        // Fetch monthly expenses for the Bar Chart
//        List<Double> monthlyExpenseList = expenseService.getMonthlyExpensesBreakdown();
//
//        // Passing data to JSP
//        model.addAttribute("totalExpenses", totalExpenses);
//        model.addAttribute("monthlyExpenses", monthlyExpenses);
//        model.addAttribute("topCategory", topCategory);
//        model.addAttribute("categoryExpenses", categoryExpenses);
//        model.addAttribute("monthlyExpenseList", monthlyExpenseList);
//
//        return "dashboard"; // This maps to dashboard.jsp
//    }




    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        // Get the logged-in user
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/";
        }

        // Fetching user-specific analytics data
        double totalExpenses = expenseService.getTotalExpenses(user);
        double monthlyExpenses = expenseService.getMonthlyExpenses(user);
        String topCategory = expenseService.getTopCategory(user);

        // Fetch category-wise expenses for the Pie Chart
        Map<String, Double> categoryExpenses = expenseService.getCategoryWiseExpenses(user);

        // Fetch monthly expenses for the Bar Chart
        List<Double> monthlyExpenseList = expenseService.getMonthlyExpensesBreakdown(user);

        // Convert Maps and Lists to JSON for use in JavaScript
        ObjectMapper mapper = new ObjectMapper();
        try {
            String categoryExpensesJson = mapper.writeValueAsString(categoryExpenses);
            String monthlyExpenseListJson = mapper.writeValueAsString(monthlyExpenseList);

            model.addAttribute("categoryExpensesJson", categoryExpensesJson);
            model.addAttribute("monthlyExpenseListJson", monthlyExpenseListJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace(); // Or log it properly
        }

        // Pass other attributes as normal
        model.addAttribute("totalExpenses", totalExpenses);
        model.addAttribute("monthlyExpenses", monthlyExpenses);
        model.addAttribute("topCategory", topCategory);

        return "dashboard";
    }



}
