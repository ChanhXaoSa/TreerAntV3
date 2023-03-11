/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Triệu
 */
public class CusServiceDAO {
    public static boolean insertCustomerService(String CustEmail, String CustName, String Title, String Content) throws Exception {
        int rs = 0;
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            String sql = "INSERT INTO [dbo].[CustomerService] (CustEmail, CustName, Title, Content) VALUES (?, ?, ?, ?);";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, CustName);
            pst.setString(2, CustEmail);
            pst.setString(3, Title);
            pst.setString(4, Content);
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
}
        return true;
    }
}
