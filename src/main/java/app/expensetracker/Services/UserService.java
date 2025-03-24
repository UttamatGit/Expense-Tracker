package app.expensetracker.Services;

import app.expensetracker.Model.User;
import app.expensetracker.Repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void saveUserToDB(User newUser){
        userRepository.save(newUser);
    }

    // Validate user using email instead of username.
    public boolean validateUser(String email, String password) {
        Optional<User> userOpt = userRepository.findByEmail(email);
        return userOpt.map(user -> user.getPassword().equals(password)).orElse(false);
    }

    public User getUserByEmail(String email) {
        Optional<User> userOpt = userRepository.findByEmail(email);
        return userOpt.orElse(null);
    }

}
