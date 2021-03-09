package com.larry.controller;

import com.larry.pojo.User;
import com.larry.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;

/**
 * @author larry
 * @create 2021-03-02 15:58
 */
@Controller
public class LoginController {
    @Autowired
    @Qualifier("userServiceImpl")
    private UserServiceImpl userServiceImpl;
    /* 跳转到login页面 */
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    /* 跳转到login页面 */
    @RequestMapping("/handlelogin")
    public String handlelogin(User user, Model model, HttpSession session) {
        User user1 = userServiceImpl.checkLogin(user);
        System.out.println(user1);
        if(user1 != null){ // 用户登录成功
            session.setAttribute("user", user1);
            return "redirect:/home";
        } else {
            model.addAttribute("username", user.getUsername());
            model.addAttribute("password", user.getPassword());
            model.addAttribute("msg", "对不起，您输入的用户名或密码有误");
            return "login";
        }
    }

    /* 退出登录 */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/login";
    }
}
