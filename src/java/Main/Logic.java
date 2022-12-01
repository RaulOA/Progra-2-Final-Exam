package Main;

import static java.lang.System.out;
import java.sql.*;

public class Logic {   
    
    public void record_note(String id, int score) {
        try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/final_exam", "root", "ne5ddd90");
                Statement statement = con.createStatement();
                String sql = "update students set student_note =" + score + " where student_id ='" + id + "'";
                statement.executeUpdate(sql);
                if (score < 65) {
                    String sql1 = "update students set student_status ='Reprobate' where student_id ='" + id + "'";
                    statement.executeUpdate(sql1);
                } else if (score >= 65 && score < 70) {
                    String sql2 = "update students set student_status ='Postponed' where student_id ='" + id + "'";
                    statement.executeUpdate(sql2);
                }else if (score >= 70) {
                    String sql3 = "update students set student_status ='Passed' where student_id ='" + id + "'";
                    statement.executeUpdate(sql3);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
    }
    
}
