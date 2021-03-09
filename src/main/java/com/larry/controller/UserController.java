package com.larry.controller;

import com.larry.pojo.User;
import com.larry.service.UserServiceImpl;
import com.larry.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author larry
 * @create 2021-03-05 13:45
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserServiceImpl userServiceImpl;

    /**
     * 返回用户列表页
     * @return
     */
    @RequestMapping("/listpage")
    public String listpage() {
        return "userList";
    }

    /**
     * 获取用户列表信息
     * @param id
     * @param username
     * @param avatar
     * @param email
     * @param sortTime
     * @param sortCount
     * @param limit
     * @param page
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public  Map<String, Object> list(String id, String username, String avatar, String email, String sortTime, String sortCount,String limit, String page) {
        List<Map<String, Object>> users = userServiceImpl.queryUser(id,username,avatar,email, sortTime, sortCount,limit, page);
        int count = userServiceImpl.queryUserCount();
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "请求成功");
        map.put("data", users);
        map.put("count", count);
        return map;
    }

    @RequestMapping("/edit/{uid}")
    public String edit(@PathVariable("uid") int uid, Model model) {
        User user = userServiceImpl.queryUserById(uid);
        model.addAttribute("user",user);
        return "userEdit";
    }

    @RequestMapping("/update")
    @ResponseBody
    public  Map<String, Object> list(User user) {
        System.out.println(user);
        Map<String, Object> map = new HashMap<>();
        int i = userServiceImpl.updateUserById(user);
        if (i >= 1) {
            map.put("code", 200);
            map.put("msg", "更新成功");
        } else {
            map.put("code", 401);
            map.put("msg", "更新失败");
        }
        return map;
    }
}
