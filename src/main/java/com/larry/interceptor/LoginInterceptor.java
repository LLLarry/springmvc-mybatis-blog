package com.larry.interceptor;

import com.larry.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author larry
 * @create 2021-03-02 16:10
 */
public class LoginInterceptor implements HandlerInterceptor {
    /* 执行前 */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        /*
        * return true ： 执行下个拦截器
        * return false： 阻止执行下个拦截器
        *  */

        /* 执行步骤：
        * 1、判断是不是登录路径，如果是，则放行，如果不是则判断用户是否登录，
        * 2、判断用户是否登录，已登录 跳转到 /book/allbooks 否则跳转到登录页
        *  */
        HttpSession session = request.getSession();
        String requestURI = request.getRequestURI();
//        System.out.println("requestURI=="+requestURI);
        User user = (User) session.getAttribute("user");
//        System.out.println("username==>"+username);
        if (requestURI.equalsIgnoreCase("/")
                || requestURI.contains("/login")
                || requestURI.contains("/handlelogin")
                || requestURI.contains("/library")
        ) {
            return true;
        } else if (user != null) {
            return true;
        }
        /* 重定向到登录页 */
        response.sendRedirect("/login");
        return false;
    }

    /* 执行后 */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    /* 清理 */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
