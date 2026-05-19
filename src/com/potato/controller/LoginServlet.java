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

/**
 * @Author potato
 * @Description 登录之后页面渲染
 * @Date 2022-12-04 13:42
 */

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置响应内容类型为JSON
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();

        // 获得请求参数
        String username = req.getParameter("username");
        String pwd = req.getParameter("pwd");

        // 访问用户业务层
        UserService userService = new UserServiceImpl();
        User u = userService.login(username, pwd);

        if (u == null) {
            out.println(JSON.toJSONString(false));
        } else {
            // 登录成功后，使用同一个u对象存入session，避免重复查询
            HttpSession session = req.getSession();
            session.setAttribute("u", u);

            // 根据用户id获取关联的货物对象和客户对象
            List<Goods> goods = new UpdateInformation().findGoodsByid(u.getId());
            List<Client> client = new UpdateInformation().findClientByid(u.getId());
            session.setAttribute("client", client);
            session.setAttribute("goods", goods);

            out.println(JSON.toJSONString(true));
        }
    }
}
