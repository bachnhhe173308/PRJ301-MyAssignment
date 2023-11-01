/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.AttendanceDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.Attendance;
import model.Student;

/**
 *
 * @author Admin
 */
public class ListStudentAttendanceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String gname = req.getParameter("gname");
        String subname = req.getParameter("subname");
        if (gname != null || subname != null) {
            SessionDBContext sesDB = new SessionDBContext();
            List<Date> dates = sesDB.getDatesByGnameAndSubname(gname, subname);

            AttendanceDBContext attDB = new AttendanceDBContext();
            ArrayList<Attendance> atts = attDB.getAttendanceByGnameAndSubname(gname, subname);
            StudentDBContext stuDB = new StudentDBContext();
            ArrayList<Student> students = stuDB.getStudentByGnameAndSubname(gname, subname);

            List<Double> absentPercentages = new ArrayList<>();

            int totalSessions = dates.size();
            for (Student student : students) {
                int totalAbsent = 0;

                for (Date date : dates) {
                    for (Attendance attendance : atts) {
                        if (attendance.getSession().getDate().equals(date) && attendance.getStudent().getId() == student.getId()) {
                            if (!attendance.getStatus()) {
                                totalAbsent++;
                            }
                        }
                    }
                }

                // Tính phần trăm absent và thêm vào danh sách
                double absentPercentage = (double) totalAbsent / totalSessions * 100;
                absentPercentages.add(absentPercentage);
            }
            req.setAttribute("absentPercentages", absentPercentages);
            req.setAttribute("students", students);
            req.setAttribute("dates", dates);
            req.setAttribute("atts", atts);
            req.getRequestDispatcher("/ListStudentAttendance.jsp").forward(req, resp);
        } else {
            resp.getWriter().println("Missing group name and subject name!");
        }
    }

}
