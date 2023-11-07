/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendance;
import model.Group;
import model.Room;
import model.Session;
import model.Subject;
import model.TimeSlot;

/**
 *
 * @author Admin
 */
public class SessionDBContext extends DBContext<Session> {

    public ArrayList<Session> getSessions(String iname, Date from, Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT ses.sesid,ses.[date],ses.[index], ses.isAtt,r.roomid,sub.subid,sub.subname,g.gid,g.gname,t.tid,t.[description]\n"
                    + "FROM [Session] ses INNER JOIN [Group] g ON ses.gid = g.gid\n"
                    + "INNER JOIN [Subject] sub ON g.subid = sub.subid\n"
                    + "INNER JOIN Room r ON r.roomid = ses.rid\n"
                    + "INNER JOIN TimeSlot t ON ses.tid = t.tid\n"
                    + "INNER JOIN Instructor i on i.iid = ses.iid\n"
                    + "WHERE i.iname = ? AND ses.[date] >= ? AND ses.[date] <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, iname);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIndex(rs.getInt("index"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Room room = new Room();
                room.setId(rs.getString("roomid"));
                session.setRoom(room);

                Subject subject = new Subject();
                subject.setId(rs.getInt("subid"));
                subject.setName(rs.getString("subname"));

                Group group = new Group();
                group.setId(rs.getInt("gid"));
                group.setName(rs.getString("gname"));
                session.setGroup(group);
                group.setSubject(subject);

                TimeSlot ts = new TimeSlot();
                ts.setId(rs.getInt("tid"));
                ts.setDescription(rs.getString("description"));
                session.setSlot(ts);

                sessions.add(session);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    public Session getSessionsByID(int sesid) {
        try {
            String sql = "SELECT  \n"
                    + "	ses.sesid,ses.[date],ses.[index],ses.isAtt,r.roomid,sub.subid,sub.subname,g.gid,g.gname,t.tid,t.[description]\n"
                    + "FROM [Session] ses INNER JOIN [Group] g ON ses.gid = g.gid\n"
                    + "							INNER JOIN [Subject] sub ON g.subid = sub.subid\n"
                    + "							INNER JOIN Room r ON r.roomid = ses.rid\n"
                    + "							INNER JOIN TimeSlot t ON ses.tid = t.tid\n"
                    + "WHERE ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                session.setId(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIndex(rs.getInt("index"));
                session.setIsAtt(rs.getBoolean("isAtt"));
                Room r = new Room();
                r.setId(rs.getString("roomid"));
                session.setRoom(r);

                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));

                Subject sub = new Subject();
                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));
                g.setSubject(sub);
                session.setGroup(g);

                TimeSlot time = new TimeSlot();
                time.setId(rs.getInt("tid"));
                time.setDescription(rs.getString("description"));
                session.setSlot(time);
                return session;
            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addAttendences(Session ses) {
        try {
            connection.setAutoCommit(false);
            //Update isAtt
            String sql_update_isAtt = "UPDATE Session SET isAtt = 1 WHERE sesid = ?";
            PreparedStatement stm_update_isAtt = connection.prepareStatement(sql_update_isAtt);
            stm_update_isAtt.setInt(1, ses.getId());
            stm_update_isAtt.executeUpdate();

            //Remove existing attendences
            String sql_remove_atts = "DELETE Attendance WHERE sesid = ?";
            PreparedStatement stm_remove_atts = connection.prepareStatement(sql_remove_atts);
            stm_remove_atts.setInt(1, ses.getId());
            stm_remove_atts.executeUpdate();

            //Insert attendences 
            for (Attendance att : ses.getAtts()) {
                String sql_insert_att = "INSERT INTO [Attendance]\n"
                        + "           ([sesid]\n"
                        + "           ,[stuid]\n"
                        + "           ,[status]\n"
                        + "           ,[description]\n"
                        + "           ,[att_datetime])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,GETDATE())";
                PreparedStatement stm_insert_att = connection.prepareStatement(sql_insert_att);
                stm_insert_att.setInt(1, ses.getId());
                stm_insert_att.setInt(2, att.getStudent().getId());
                stm_insert_att.setBoolean(3, att.getStatus());
                stm_insert_att.setString(4, att.getDescription());
                stm_insert_att.executeUpdate();
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex1) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public List<Date> getDatesByGnameAndSubname(String gname, String subname) {
        List<Date> dates = new ArrayList<>();
        try {
            String sql = "select ses.[date] \n"
                    + "from Session ses\n"
                    + "join [Group] g on ses.gid = g.gid\n"
                    + "join [Subject] sub on g.subid = sub.subid\n"
                    + "where g.gname=? and sub.subname = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, gname);
            stm.setString(2, subname);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Date date = rs.getDate("date");
                dates.add(date);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return dates;
    }

    public List<Integer> getSessionIdByUsername(String username) {
        List<Integer> numbers = new ArrayList<>();
        try {
            String sql = "select sesid \n"
                    + "from session ses join Instructor i on ses.iid = i.iid \n"
                    + "join [User] u on i.iname = u.username \n"
                    + "where u.username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int number = rs.getInt("sesid");
                numbers.add(number);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numbers;
    }

    @Override
    public ArrayList<Session> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
