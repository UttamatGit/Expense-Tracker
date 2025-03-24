package app.expensetracker.Controller;

import app.expensetracker.Model.User;
import app.expensetracker.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegController {

    @GetMapping("/registration")
    public String goForReg(){
        return "signup";
    }



    @Autowired
    private UserService userService;

    @PostMapping("/GetRegistered")
    public ModelAndView registrationNewUser(@ModelAttribute User user){
        userService.saveUserToDB(user);
        System.out.println(user.getEmail());
        System.out.println(user.getFullName());

        ModelAndView mv = new ModelAndView("dashboard");
        mv.addObject("msg",user.getFullName()+" Welcome to Expense Tracker ");
        return mv;
    }
}
