/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Role;
import model.User;

/**
 *
 * @author sonnt
 */
public abstract class AuthorizationController extends RequiredAuthenticationController {

    private boolean isAuthorized(User user, String url) {
        UserDBContext context = new UserDBContext();
        ArrayList<Role> roles = context.getRolesByUsernameAndUrl(user.getUsername(), url);
        user.setRoles(roles);
        return !user.getRoles().isEmpty();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        if (isAuthorized(user, request.getServletPath())) {
            doPost(request, response, user, user.getRoles());
        }
        else {
            response.getWriter().println("You do not have permission to access this page!");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        if (isAuthorized(user, request.getServletPath())) {
            doGet(request, response, user, user.getRoles());
        }
        else {
            response.getWriter().println("You do not have permission to access this page!");
        }
    }

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, User user, ArrayList<Role> roles) throws ServletException, IOException;

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, User user, ArrayList<Role> roles) throws ServletException, IOException;

}
