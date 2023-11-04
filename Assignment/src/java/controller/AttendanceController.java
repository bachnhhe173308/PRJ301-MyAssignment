/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.Attendance;
import model.Role;
import model.Session;
import model.Student;
import model.User;

/**
 *
 * @author Admin
 */
public class AttendanceController extends AuthorizationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user, ArrayList<Role> roles) throws ServletException, IOException {
        try {
            int sid = Integer.parseInt(req.getParameter("sid"));
            SessionDBContext sesDB = new SessionDBContext();
            Session ses = sesDB.getSessionsByID(sid);

            AttendanceDBContext attDB = new AttendanceDBContext();
            ArrayList<Attendance> atts = attDB.getAttendancesBySession(sid);
            req.setAttribute("ses", ses);
            req.setAttribute("atts", atts);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        Session ses = new Session();
        int sid = Integer.parseInt(req.getParameter("sid"));
        int sesid = Integer.parseInt(req.getParameter("sesid"));
        SessionDBContext sesDB = new SessionDBContext();
        Session session = sesDB.getSessionsByID(sid);
        String gname = session.getGroup().getName();
        String subname = session.getGroup().getSubject().getName();
        req.setAttribute("gname", gname);
        req.setAttribute("subname", subname);
        ses.setId(sesid);
        
        String[] stuids = req.getParameterValues("stuid");
        for (String stuid : stuids) {
            Attendance a = new Attendance();
            a.setSession(ses);
            Student stu = new Student();
            stu.setId(Integer.parseInt(stuid));
            a.setStudent(stu);
            a.setStatus(req.getParameter("status" + stuid).equals("present"));
            a.setDescription(req.getParameter("description" + stuid));
            ses.getAtts().add(a);
        }
        sesDB.addAttendences(ses);
        req.getRequestDispatcher("/checkAttendance.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user, ArrayList<Role> roles) throws ServletException, IOException {
        try {
            int sid = Integer.parseInt(req.getParameter("sid"));
            SessionDBContext sesDB = new SessionDBContext();
            Session ses = sesDB.getSessionsByID(sid);

            AttendanceDBContext attDB = new AttendanceDBContext();
            ArrayList<Attendance> atts = attDB.getAttendancesBySession(sid);
            req.setAttribute("ses", ses);
            req.setAttribute("atts", atts);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        req.getRequestDispatcher("/attendance.jsp").forward(req, resp);
    }

}
