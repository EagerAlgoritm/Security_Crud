package spring_crud.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import spring_crud.model.User;
import spring_crud.service.UserService;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String welcomePage() {
        return "Welcome";
    }

    @RequestMapping("/access_denied")
    public String accessPage() {
        return "Denied";
    }

    @GetMapping(value = "/user")
    public String getUserPage(Model model) {
        UserDetails user = (UserDetails) SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getPrincipal();
        model.addAttribute("user", userService.getUserByName(user.getUsername()));
        return "User";
    }


    @RequestMapping("/admin/getAll")
    public String showAllUsers(Model model) {
        List<User> userList = userService.GetAllUsers();
        model.addAttribute("userList", userList);

        return "All-Users";
    }

    @RequestMapping("/admin/addNewUser")
    public String addNewUser(Model model) {

        User user = new User();
        model.addAttribute("User", user);

        return "User-Info";
    }

    @RequestMapping("/admin/saveUser")
    public String saveUser(@ModelAttribute("User") User user) {

        userService.saveUser(user);

        return "redirect:/admin/getAll";
    }

    @RequestMapping("/admin/updateInfo")
    public String updateUser(@RequestParam("userId") int id, Model model) {

        User user = userService.getUser(id);
        model.addAttribute("User", user);

        return "User-Info";
    }

    @RequestMapping("/admin/deleteUser")
    public String deleteUser(@RequestParam("userId") int id) {

        userService.deleteUser(id);

        return "redirect:/admin/getAll";
    }
}
