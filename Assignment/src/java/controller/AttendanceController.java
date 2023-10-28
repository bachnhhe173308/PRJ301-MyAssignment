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
import java.io.PrintWriter;
import java.util.ArrayList;
import model.Attendance;
import model.Session;
import model.Student;

/**
 *
 * @author Admin
 */
public class AttendanceController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Session ses = new Session();
        int sid = Integer.parseInt(req.getParameter("sid"));
        int sesid = Integer.parseInt(req.getParameter("sesid"));
        String name = req.getParameter("name");
        SessionDBContext sesDB = new SessionDBContext();
        Session session = sesDB.getSessionsByID(sid);
        String gname = session.getGroup().getName();
        String subname = session.getGroup().getSubject().getName();
        
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
        try ( PrintWriter out = resp.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AttendanceController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Attendance has been completed</h1>");
            out.println("<a href=\"checkAttendance?sid="+sid+"&gname="+gname+"&subname="+subname+"\"><button>Review</button></a>");
            out.println("<br><br>");
            out.println("<a href=\"timetable?name="+name+"\"><button>Back to TimeTable</button></a>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int sid = Integer.parseInt(req.getParameter("sid"));
        SessionDBContext sesDB = new SessionDBContext();
        Session ses = sesDB.getSessionsByID(sid);

        AttendanceDBContext attDB = new AttendanceDBContext();
        ArrayList<Attendance> atts = attDB.getAttendancesBySession(sid);
        req.setAttribute("ses", ses);
        req.setAttribute("atts", atts);
        req.getRequestDispatcher("/attendance.jsp").forward(req, resp);
    }

}
