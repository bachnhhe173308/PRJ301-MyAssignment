/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Attendance;
import model.Session;

/**
 *
 * @author Admin
 */
public class CheckAttendanceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int sid = Integer.parseInt(req.getParameter("sid"));
            SessionDBContext sesDB = new SessionDBContext();
            Session ses = sesDB.getSessionsByID(sid);

            AttendanceDBContext attDB = new AttendanceDBContext();
            ArrayList<Attendance> atts = attDB.getAttendancesBySession(sid);
            String name = atts.get(0).getSession().getInstructor().getName();
            req.setAttribute("name", name);
            req.setAttribute("ses", ses);
            req.setAttribute("atts", atts);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        req.getRequestDispatcher("/checkAttendance.jsp").forward(req, resp);
    }

}
