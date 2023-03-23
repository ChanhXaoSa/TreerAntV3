/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.CusService;
import Treer.untils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Triệu
 */
public class CusServiceDAO {

    public static boolean insertCustomerService(String CustEmail, String CustName, String Title, String Content) throws Exception {
        int rs = 0;
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            String sql = "INSERT INTO [dbo].[CustomerService] ([CustEmail], [CusName], [Title], [Content], [Date_receive], [Status])\n"
                    + "VALUES (?, ?, ?, ?, GETDATE(), ?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, CustEmail);
            pst.setString(2, CustName);
            pst.setString(3, Title);
            pst.setString(4, Content);
            pst.setInt(5, 0);
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static ArrayList<CusService> getAllCusService(String keyword, String searchby) {

        Connection cn = null;
        CusService cusService = null;
        ArrayList<CusService> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT * FROM CustomerService";

                if (searchby.equalsIgnoreCase("Email")) {
                    sql = sql + " WHERE CustEmail like ?";
                } else if (searchby.equalsIgnoreCase("Title")) {
                    sql = sql + " WHERE Title like ?";
                } else if (searchby.equalsIgnoreCase("Date")) {
                    sql = sql + " WHERE Date_receive like ?";
                } else {
                    sql = sql + " WHERE Status like ?";
                }

                sql = sql + " ORDER BY Date_receive DESC";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int CustSerID = rs.getInt("CustSerID");
                        String CustEmail = rs.getString("CustEmail");
                        String CusName = rs.getString("CusName");
                        String Title = rs.getString("Title");
                        String Content = rs.getString("Content");
                        String Date_receive = rs.getString("Date_receive");
                        String Date_response = rs.getString("Date_response");
                        String ReplyContent = rs.getString("ReplyContent");
                        int Status = rs.getInt("Status");

                        cusService = new CusService(CustSerID, CustEmail, CusName, Title, Content, Date_receive, Date_response, ReplyContent, Status);
                        list.add(cusService);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public static ArrayList<CusService> getCustomerServiceWithStatus(int status) {
        Connection cn = null;
        CusService cusService = null;
        ArrayList<CusService> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT * FROM CustomerService WHERE Status = 1 ORDER BY Date_receive DESC";
                PreparedStatement pst = cn.prepareStatement(sql);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int CustSerID = rs.getInt("CustSerID");
                        String CustEmail = rs.getString("CustEmail");
                        String CusName = rs.getString("CusName");
                        String Title = rs.getString("Title");
                        String Content = rs.getString("CusName");
                        String Date_receive = rs.getString("Date_receive");
                        String Date_response = rs.getString("Date_response");
                        String ReplyContent = rs.getString("ReplyContent");
                        int Status = rs.getInt("Status");

                        cusService = new CusService(CustSerID, CustEmail, CusName, Title, Content, Date_receive, Date_response, ReplyContent, Status);
                        list.add(cusService);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updateCustomerService(int CustSerID, String ReplyContent) {
        int rs = 0;
        Date d = new Date(System.currentTimeMillis());
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            String sql = "UPDATE CustomerService SET ReplyContent = ?, Date_response = GETDATE(), Status = 1 WHERE CustSerID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, ReplyContent);
            pst.setInt(2, CustSerID);
            rs = pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static CusService getCusServiceByCustSerID(int CustSerID) {

        CusService cusService = new CusService();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT * FROM CustomerService WHERE CustSerID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, CustSerID);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        CustSerID = rs.getInt("CustSerID");
                        String CustEmail = rs.getString("CustEmail");
                        String CusName = rs.getString("CusName");
                        String Title = rs.getString("Title");
                        String Content = rs.getString("CusName");
                        String Date_receive = rs.getString("Date_receive");
                        String Date_response = rs.getString("Date_response");
                        String ReplyContent = rs.getString("ReplyContent");
                        int Status = rs.getInt("Status");

                        cusService = new CusService(CustSerID, CustEmail, CusName, Title, Content, Date_receive, Date_response, ReplyContent, Status);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cusService;

    }
}
