/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendance;
import model.Group;
import model.Instructor;
import model.Session;
import model.Student;
import model.Subject;

/**
 *
 * @author Admin
 */
public class AttendanceDBContext extends DBContext<Attendance> {

    public ArrayList<Attendance> getAttendancesBySession(int sesid) {
        ArrayList<Attendance> attendances = new ArrayList<>();
        try {
            String sql = "SELECT s.stuid,s.stuname,sub.subname, s.img, ISNULL(a.status,0) as [status], ISNULL(a.description,'') as [description], ISNULL(a.att_datetime,GETDATE()) as att_datetime, i.iname\n"
                    + "FROM [Session] ses INNER JOIN [Group] g ON g.gid = ses.gid\n"
                    + "INNER JOIN Group_Student gs ON g.gid = gs.gid\n"
                    + "INNER JOIN Student s ON s.stuid = gs.stuid\n"
                    + "INNER JOIN Subject sub on g.subid = sub.subid\n"
                    + "INNER JOIN Instructor i on ses.iid = i.iid\n"
                    + "LEFT JOIN Attendance a ON a.sesid = ses.sesid AND s.stuid = a.stuid\n"
                    + "WHERE ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sesid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();

                Student stu = new Student();
                stu.setId(rs.getInt("stuid"));
                stu.setName(rs.getString("stuname"));
                stu.setImg(rs.getString("img"));
                att.setStudent(stu);

                Subject sub = new Subject();
                sub.setName(rs.getString("subname"));
                Group g = new Group();
                g.setSubject(sub);
                Session ses = new Session();
                ses.setId(sesid);
                ses.setGroup(g);
                Instructor i = new Instructor();
                i.setName(rs.getString("iname"));
                ses.setInstructor(i);
                att.setSession(ses);
                att.setStatus(rs.getBoolean("status"));
                att.setDescription(rs.getString("description"));
                att.setAtt_datetime(rs.getTimestamp("att_datetime"));
                attendances.add(att);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeSlotDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return attendances;
    }

    public ArrayList<Attendance> getAttendanceByGnameAndSubname(String gname, String subname) {
        ArrayList<Attendance> atts = new ArrayList<>();
        try {
            String sql = "select ses.sesid, stu.stuid, stu.stuname, a.[status], ses.[date] \n"
                    + "from Attendance a full join Session ses on ses.sesid = a.sesid\n"
                    + "full join Student stu on a.stuid = stu.stuid\n"
                    + " join [Group] g on ses.gid = g.gid\n"
                    + " join [Subject] sub on g.subid = sub.subid\n"
                    + "where g.gname=? and sub.subname = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, gname);
            stm.setString(2, subname);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                Session ses = new Session();
                ses.setId(rs.getInt("sesid"));
                ses.setDate(rs.getDate("date"));
                att.setSession(ses);
                Student stu = new Student();
                stu.setId(rs.getInt("stuid"));
                stu.setName(rs.getString("stuname"));
                att.setStudent(stu);
                if (rs.getObject("status") == null) {
                    att.setStatus(null);
                } else {
                    att.setStatus(rs.getBoolean("status"));
                }
                atts.add(att);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return atts;
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
