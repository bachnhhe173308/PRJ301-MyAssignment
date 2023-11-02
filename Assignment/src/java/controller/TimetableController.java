/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import Date.GetDate;
import dal.SessionDBContext;
import dal.TimeSlotDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;
import model.Session;
import model.TimeSlot;
import model.User;

/**
 *
 * @author Admin
 */
public class TimetableController extends AuthorizationController{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        String s_from = request.getParameter("from");
        String s_to = request.getParameter("to");
        ArrayList<Date> dates = new ArrayList<>();
        if(s_from == null)// this week
        {
            dates = (ArrayList<Date>) GetDate.getDatesOfCurrentWeek();
        }
        else
        {
            try {
                dates = (ArrayList<Date>) GetDate.getSQLDatesBetween(s_from,s_to);
            } catch (ParseException ex) {
                Logger.getLogger(TimetableController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        Date from = dates.get(0);
        Date to = dates.get(dates.size()-1);
        
        TimeSlotDBContext timeDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = timeDB.list();
        
        SessionDBContext sesDB = new SessionDBContext();
        ArrayList<Session> sessions = sesDB.getSessions(name, from, to);
        
        request.setAttribute("slots", slots);
        request.setAttribute("dates", dates);
        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("sessions", sessions);
        
        request.getRequestDispatcher("/timetable.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, ArrayList<Role> roles) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, ArrayList<Role> roles) throws ServletException, IOException {
        processRequest(request, response);
    }
    
}
