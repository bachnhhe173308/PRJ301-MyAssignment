/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Student;

/**
 *
 * @author Admin
 */
public class StudentDBContext extends DBContext<Student> {

    public ArrayList<Student> getStudentByGnameAndSubname(String gname, String subname) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "select stu.stuid, stu.stuname from Student stu join Group_Student gs on stu.stuid = gs.stuid\n"
                    + "join [Group] g on gs.gid = g.gid join [Subject] sub on g.subid = sub.subid\n"
                    + "where g.gname=? and sub.subname = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, gname);
            stm.setString(2, subname);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("stuid"));
                s.setName(rs.getString("stuname"));
                students.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return students;
    }
    
    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
