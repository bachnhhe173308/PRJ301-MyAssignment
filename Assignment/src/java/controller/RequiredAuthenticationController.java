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
import model.User;

/**
 *
 * @author sonnt
 */
public abstract class RequiredAuthenticationController extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        User account = (User) request.getSession().getAttribute("account");
        if (account != null) {
            return true;
        } else {
            String user = null;
            String pass = null;
            if (user != null && pass != null) {
                UserDBContext db = new UserDBContext();
                User param = new User();
                param.setUsername(user);
                param.setPassword(pass);
                account = db.get(param);
                return account != null;
            } else {
                return false;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            doGet(request, response, (User) request.getSession().getAttribute("account"));
        } else {
            response.getWriter().println("You do not have permission to access this page!");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            //do business overrided in the sub class
            doPost(request, response, (User) request.getSession().getAttribute("account"));
        } else {
            response.getWriter().println("You do not have permission to access this page!");
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException;

}
