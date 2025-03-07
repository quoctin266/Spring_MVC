package vn.hoidanit.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.services.UserService;

@Controller
public class AdminController {
    private final UserService userService;

    public AdminController(UserService userService) {
        this.userService = userService;
    }

    // admin home page
    @RequestMapping("/admin")
    public String adminHomePage(Model model) {
        List<User> userList = this.userService.getAllUsersByEmail("dt@gmail.com");
        System.out.println(userList);

        // file path
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String userListPage(Model model) {
        List<User> userList = this.userService.getAllUsers();
        model.addAttribute("userList", userList);

        // file path
        return "admin/user/table-user";
    }

    @RequestMapping("/admin/user/{id}")
    public String userDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        // file path
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/create")
    public String createUserPage(Model model) {
        model.addAttribute("newUser", new User());

        // file path
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.handleSaveUser(user);

        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String userUpdatePage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        // file path
        return "admin/user/update";
    }

    @RequestMapping(value = "/admin/user/update", method = RequestMethod.POST)
    public String updateUser(Model model, @ModelAttribute("user") User user) {
        User currentUser = this.userService.getUserById(user.getId());
        if (currentUser != null) {
            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());

            this.userService.handleSaveUser(currentUser);
        }

        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/delete/{id}")
    public String userDeletePage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        // file path
        return "admin/user/delete";
    }

    @RequestMapping(value = "/admin/user/delete", method = RequestMethod.POST)
    public String deleteUser(Model model, @ModelAttribute("user") User user) {
        this.userService.deleteUserById(user.getId());

        return "redirect:/admin/user";
    }
}
