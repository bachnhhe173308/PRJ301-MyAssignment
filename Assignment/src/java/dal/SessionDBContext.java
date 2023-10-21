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
            String sql = "SELECT ses.sesid,ses.[date],ses.[index],r.roomid,sub.subid,sub.subname,g.gid,g.gname,t.tid,t.[description]\n"
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

    @Override
    public ArrayList<Session> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
