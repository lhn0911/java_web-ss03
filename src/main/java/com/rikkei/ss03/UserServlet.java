package com.rikkei.ss03;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserServlet", value = "/UserServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            UserManager.removeUser(id);
        }

        request.setAttribute("users", UserManager.getUsers());
        request.getRequestDispatcher("listUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        User user = new User(0, name, email);
        UserManager.addUser(user);

        request.setAttribute("message", "Thêm người dùng thành công!");
        request.setAttribute("users", UserManager.getUsers());

        request.getRequestDispatcher("listUser.jsp").forward(request, response);
    }
}