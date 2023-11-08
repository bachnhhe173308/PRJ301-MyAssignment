/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.GnameSubnamePair;
import model.User;

/**
 *
 * @author sonnt
 */
public class UserDBContext extends DBContext<User> {

    public User get(User model) {
        try {
            String sql = "SELECT username,displayname FROM [User]\n"
                    + "WHERE username = ? AND [password] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getUsername());
            stm.setString(2, model.getPassword());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUsername(model.getUsername());
                user.setDisplayname(rs.getString("displayname"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<GnameSubnamePair> getGnameAndSubnameByUser(String user) {
        List<GnameSubnamePair> paramDB = new ArrayList<>();
        try {
            String sql = "select gname, subname from [User] u join Instructor i on u.username = i.iname \n"
                    + "join [Group] g on i.iid = g.sup_iis \n"
                    + "join [Subject] s on g.subid = s.subid \n"
                    + "where username=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                GnameSubnamePair gs = new GnameSubnamePair();
                String gname = rs.getString("gname");
                String subname = rs.getString("subname");
                gs.setGname(gname);
                gs.setSubname(subname);
                paramDB.add(gs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return paramDB;
    }

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
