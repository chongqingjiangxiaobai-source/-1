package com.potato.controller;

import com.potato.entity.Client;
import com.potato.entity.Goods;
import com.potato.entity.User;
import com.potato.service.*;
import com.potato.util.UpdateInformation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 修复1：将响应头改为 HTML 格式，以便浏览器能执行后面我们写的 script 弹窗代码
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();

        String username = req.getParameter("username");
        String pwd = req.getParameter("pwd");

        UserService userService = new UserServiceImpl();
        User u = userService.login(username, pwd);

        if (u == null) {
            // 修复2：登录失败时，不再打印干巴巴的 false，而是弹窗提示并让页面留在登录页
            out.print("<script>alert('账号或密码错误，请重新输入！'); window.location.href='login.html';</script>");
        } else {
            List<Goods> goods = new UpdateInformation().findGoodsByid(u.getId());
            HttpSession session = req.getSession();

            List<Client> client = new UpdateInformation().findClientByid(u.getId());
            session.setAttribute("u", u);
            session.setAttribute("client", client);
            session.setAttribute("goods", goods);

            // 修复3：登录成功时，不再打印 true，而是使用 Servlet 原生的重定向，直接跳转到系统主页
            resp.sendRedirect("home_page.jsp");
        }
    }
}
