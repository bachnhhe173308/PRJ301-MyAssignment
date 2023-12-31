/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author sonnt
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Truyền false để không tạo phiên mới nếu phiên chưa tồn tại

        if (session == null) {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
        else {
            request.getRequestDispatcher("/home.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User param = new User();
        param.setUsername(username);
        param.setPassword(password);
        UserDBContext db = new UserDBContext();
        User loggedUser = db.get(param);
        if (loggedUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("account", loggedUser);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Username or password invalid!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

}
