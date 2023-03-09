/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.untils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author tuank
 */
public class DBUtils {
    public static Connection makeConnection() throws Exception{
        Connection cn=null;
        String IP="localhost";
        String instanceName="DESKTOP-BH3VIDG";
        String port="1433";
        String uid="sa";
        String pwd="12345";
        String db="Treer";
        String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url="jdbc:sqlserver://" +IP+"\\"+ instanceName+":"+port
                 +";databasename="+db+";user="+uid+";password="+pwd;
        Class.forName(driver);
        cn=DriverManager.getConnection(url);
        return cn;
    }
    
    public static void main(String[] args) {
      Connection conn = null;
      try {
         // Kết nối database
         String url = "jdbc:mysql://localhost/mydatabase";
         String user = "root";
         String password = "password";
         conn = DriverManager.getConnection(url, user, password);
         System.out.println("Kết nối thành công!");

         // Kiểm tra kết nối
         if (conn.isValid(10)) {
            System.out.println("Kết nối đến cơ sở dữ liệu vẫn còn hoạt động.");
         } else {
            System.out.println("Kết nối đến cơ sở dữ liệu đã bị đóng.");
         }

         // Thực hiện truy vấn
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT * FROM mytable");
         while (rs.next()) {
            System.out.println(rs.getString("column1") + "\t" + rs.getString("column2"));
         }

         // Đóng kết nối
         rs.close();
         stmt.close();
         conn.close();
      } catch (SQLException e) {
         System.out.println("Không thể kết nối đến database!");
         e.printStackTrace();
      }
   }
}
