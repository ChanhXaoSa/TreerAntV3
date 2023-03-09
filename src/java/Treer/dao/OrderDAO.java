/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.Order;
import Treer.untils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author tuank
 */
public class OrderDAO {
    public static ArrayList<Order> getOrders(String email) {
        Connection cn = null;
        Order order = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "select o.OrderID,o.OrdDate,o.shipdate,o.status,o.AccID\n"
                        + "from dbo.Orders o\n"
                        + "join dbo.Accounts a on o.AccID=a.accID\n"
                        + "where a.email= ? COLLATE Latin1_general_CS_AS";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("accID");

                        order = new Order(orderID, orderDate, orderDate, status, accID, "");
                        list.add(order);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // bước 4: đóng connection
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static ArrayList<Order> getAllOrders(String email) {
        Connection cn = null;
        Order order = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "select o.OrderID,o.OrdDate,o.shipdate,o.status,o.AccID \n"
                        + "from dbo.Orders o join dbo.Accounts a on o.AccID=a.accID\n"
                        + "where a.email like ? COLLATE Latin1_general_CS_AS";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + email + "%");
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt("OrderID");
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("accID");

                        order = new Order(orderID, orderDate, shipDate, status, accID, "");
                        list.add(order);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // bước 4: đóng connection
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
    
    public static ArrayList<Order> UpdateRoleOrder(int orderid, int status) throws Exception {
        // bước 1: make connection
        Connection cn = null;
        Order order = null;

        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();

            // bước 2: viết các câu query và execute nó
            if (cn != null) {
                String sql1 = "UPDATE Orders \n"
                        + "SET status = ?\n"
                        + "WHERE OrderID = ?;";

                PreparedStatement pst = cn.prepareStatement(sql1);

                pst.setInt(1, status);
                pst.setInt(2, orderid);

                ResultSet table = pst.executeQuery();
                // bước 3: xử lý đáp án
                if (table != null) {
                    while (table.next()) {

                        //int accid=table.getInt("accID");
                        String OrderDate = table.getString("OrdDate");
                        String ShipDate = table.getString("shipdate");
                        status = table.getInt("status");
                        int accID = table.getInt("AccID");

                        order = new Order(orderid, OrderDate, ShipDate, status, accID, "");
                        list.add(order);
                    }
                }
                // bước 4: đóng connection
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {
//
//        Connection cn = null;
//        ArrayList<OrderDetail> list = new ArrayList<>();
//
//        try {
//            cn = DBUtils.makeConnection();
//
//            if (cn != null) {
//                String sql = "select[DetailId],[OrderID],[PID],[PName],[price],[imgPath],[quantity]\n"
//                        + "from [dbo].[OrderDetails],[dbo].[Plants]\n"
//                        + "where OrderID=? and OrderDetails.FID=Plants.PID";
//
//                PreparedStatement pst = cn.prepareStatement(sql);
//                pst.setInt(1, orderID);
//                ResultSet rs = pst.executeQuery();
//
//                if (rs != null) {
//                    while (rs.next()) {
//                        int detailID = rs.getInt("DetailId");
//                        int PlantID = rs.getInt("PID");
//                        String PlantName = rs.getString("PName");
//                        int price = rs.getInt("price");
//                        String imgPath = rs.getString("imgPath");
//                        int quantity = rs.getInt("quantity");
//                        OrderDetail orderdetail = new OrderDetail(detailID, orderID, PlantID, price, quantity, PlantName, imgPath);
//                        list.add(orderdetail);
//                    }
//                }
//            }
//        } catch (Exception e) {
//
//        } finally {
//            try {
//                if (cn != null) {
//                    cn.close();
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return list;
//    }

    public static ArrayList<Order> searchOrders(String orderID) {
        Connection cn = null;
        PreparedStatement pst;
        Order ord = null;
        String sql;

        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {

                sql = "select o.OrderID,o.OrdDate,o.shipdate,o.status,o.AccID\n"
                        + "from dbo.Orders o\n"
                        + "join dbo.Accounts a on o.AccID=a.accID\n"
                        + "where o.OrderID like ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + orderID + "%");

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int order_ID = rs.getInt("OrderID");
                        String orderDate = rs.getString("OrdDate");
                        String shipDate = rs.getString("shipdate");
                        int status = rs.getInt("status");
                        int accID = rs.getInt("accID");
                        ord = new Order(order_ID, orderDate, shipDate, status, accID, "");
                        list.add(ord);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // bước 4: đóng connection
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
    
    public static boolean cancelOrder(int orderid) throws SQLException {
        Connection con = null;
        PreparedStatement pst = null;
        int rs = -1;
        boolean check = false;

        try {

            con = DBUtils.makeConnection();
            if (con != null) {
                String url = "UPDATE [dbo].[Orders]\n"
                        + "SET [status] = 3 \n"
                        + "WHERE [OrderID]= ?";
                pst = con.prepareStatement(url);
                pst.setInt(1, orderid);
                rs = pst.executeUpdate();
                if (rs != -1 && rs != 0) {
                    check = true;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
}
