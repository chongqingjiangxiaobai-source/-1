package com.potato.controller;

import com.alibaba.fastjson.JSON;
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
        // 关键：告诉前端我们返回的是 JSON 格式数据
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();

        String username = req.getParameter("username");
        String pwd = req.getParameter("pwd");

        UserService userService = new UserServiceImpl();
        User u = userService.login(username, pwd);

        if (u == null) {
            // 登录失败，返回 JSON 布尔值 false
            out.println(JSON.toJSONString(false));
        } else {
            // 登录成功，将信息存入 Session
            HttpSession session = req.getSession();
            List<Goods> goods = new UpdateInformation().findGoodsByid(u.getId());
            List<Client> client = new UpdateInformation().findClientByid(u.getId());

            session.setAttribute("u", u);
            session.setAttribute("client", client);
            session.setAttribute("goods", goods);

            // 返回 JSON 布尔值 true
            out.println(JSON.toJSONString(true));
        }
    }
}
