package app.expensetracker.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectController {

    @GetMapping("/backLog")
    public String backToLogin(){
        System.out.println("Back to loginPage i.e indexPage");
        return "redirect:/";
    }
}
