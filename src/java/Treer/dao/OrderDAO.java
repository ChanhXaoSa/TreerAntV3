/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.Order;
import Treer.dto.OrderDetail;
import Treer.untils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

/**
 *
 * @author tuank
 */
public class OrderDAO {

    public static ArrayList<Order> getAllOrders(int accid) {
        Connection cn = null;
        Order order = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "select [OrderID], "
                        + "CONVERT(varchar, [OrderDate], 103), "
                        + "CONVERT(varchar, [OrderShip], 103), [AccID], [Status], [DiscountID] from [dbo].[Order]\n"
                        + "where [AccID] = ? ";
                    // +' '+CONVERT(varchar, [OrderDate], 108), +' '+CONVERT(varchar, [OrderShip], 108)
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accid);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt(1);
                        String orderDate = rs.getString(2);
                        String shipDate = rs.getString(3);
                        int status = rs.getInt(5);
                        int accID = rs.getInt(4);
                        String discount = rs.getString(6);

                        order = new Order(orderID, orderDate, shipDate, status, accID, discount);
                        list.add(order);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Order> getAllOrdersWithDate(int accid, String from, String to) {
        Connection cn = null;
        Order order = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "select [OrderID], CONVERT(varchar, [OrderDate], 103)+' '+CONVERT(varchar, [OrderDate], 108), "
                        + "CONVERT(varchar, [OrderShip], 103)+' '+CONVERT(varchar, [OrderShip], 108), [AccID], [Status], [DiscountID] from [dbo].[Order]\n"
                        + "where [AccID] = ? and OrderDate >= ? and OrderDate <= ? ";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accid);
                pst.setString(2, from);
                pst.setString(3, to);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt(1);
                        String orderDate = rs.getString(2);
                        String shipDate = rs.getString(3);
                        int status = rs.getInt(5);
                        int accID = rs.getInt(4);
                        String discount = rs.getString(6);

                        order = new Order(orderID, orderDate, shipDate, status, accID, discount);
                        list.add(order);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Order> getOrderWithStatus(int accid, int status) {
        Connection cn = null;
        Order order = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "select [OrderID], CONVERT(varchar, [OrderDate], 103)+' '+CONVERT(varchar, [OrderDate], 108), "
                        + "CONVERT(varchar, [OrderShip], 103)+' '+CONVERT(varchar, [OrderShip], 108), [AccID], [Status], [DiscountID] from [dbo].[Order]\n"
                        + "where [AccID] = ? and [Status]= ?";

                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setInt(1, accid);
                pst.setInt(2, status);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt(1);
                        String orderDate = rs.getString(2);
                        String shipDate = rs.getString(3);
                        int Status = rs.getInt(5);
                        int accID = rs.getInt(4);
                        String discount = rs.getString(6);

                        order = new Order(orderID, orderDate, shipDate, Status, accID, discount);
                        list.add(order);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Order> getOrderWithStatusAndDate(int accid, int status, String from, String to) {
        Connection cn = null;
        Order order = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "select [OrderID], CONVERT(varchar, [OrderDate], 103)+' '+CONVERT(varchar, [OrderDate], 108), "
                        + "CONVERT(varchar, [OrderShip], 103)+' '+CONVERT(varchar, [OrderShip], 108), [AccID], [Status], [DiscountID] from [dbo].[Order]\n"
                        + "where [AccID] = ? and [Status]= ? and OrderDate >= ? and OrderDate <= ? ";

                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setInt(1, accid);
                pst.setInt(2, status);
                pst.setString(3, from);
                pst.setString(4, to);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int orderID = rs.getInt(1);
                        String orderDate = rs.getString(2);
                        String shipDate = rs.getString(3);
                        int Status = rs.getInt(5);
                        int accID = rs.getInt(4);
                        String discount = rs.getString(6);

                        order = new Order(orderID, orderDate, shipDate, Status, accID, discount);
                        list.add(order);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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

                        order = new Order(orderid, OrderDate, OrderDate, status, accID, sql1);
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

    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {

        Connection cn = null;
        ArrayList<OrderDetail> list = new ArrayList<>();

        try {
            cn = DBUtils.makeConnection();

            if (cn != null) {
                String sql = "SELECT [DetailID], [OrderID], [PlantID], [NamePlant], [price], [Quantity]\n"
                        + "from [dbo].[OrderDetail], [dbo].[Plant]\n"
                        + "where [OrderID]= ? and  [dbo].[OrderDetail].PlantID =[dbo].[Plant].PID";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int detailID = rs.getInt(1);
                        int PlantID = rs.getInt(3);
                        String PlantName = rs.getString(4);
                        int price = rs.getInt(5);
                        int sale = PlantDAO.getSaleByID(PlantID);
                        price = price - price*sale/100;
                        String imgPath = PlantDAO.getPlantImgByID(PlantID);
                        int quantity = rs.getInt(6);
                        OrderDetail orderdetail = new OrderDetail(detailID, orderID, PlantID, price, quantity, PlantName, imgPath);
                        list.add(orderdetail);
                    }
                }
            }
        } catch (Exception e) {

        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

//    public static ArrayList<Order> searchOrders(String orderID) {
//        Connection cn = null;
//        PreparedStatement pst;
//        Order ord = null;
//        String sql;
//
//        ArrayList<Order> list = new ArrayList<>();
//        try {
//            cn = DBUtils.makeConnection();
//            if (cn != null) {
//
//                sql = "select o.OrderID,o.OrdDate,o.shipdate,o.status,o.AccID\n"
//                        + "from dbo.Orders o\n"
//                        + "join dbo.Accounts a on o.AccID=a.accID\n"
//                        + "where o.OrderID like ?";
//                pst = cn.prepareStatement(sql);
//                pst.setString(1, "%" + orderID + "%");
//
//                ResultSet rs = pst.executeQuery();
//
//                if (rs != null) {
//                    while (rs.next()) {
//                        int order_ID = rs.getInt("OrderID");
//                        String orderDate = rs.getString("OrdDate");
//                        String shipDate = rs.getString("shipdate");
//                        int status = rs.getInt("status");
//                        int accID = rs.getInt("accID");
//                        ord = new Order(order_ID, status, accID, orderDate, shipDate);
//                        list.add(ord);
//                    }
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            // bước 4: đóng connection
//            if (cn != null) {
//                try {
//                    cn.close();
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//        return list;
//    }
    public static boolean cancelOrder(int orderid) throws SQLException {
        Connection con = null;
        PreparedStatement pst = null;
        int rs = -1;
        boolean check = false;

        try {

            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "update [dbo].[Order] set [Status] = 3 where [OrderID] = ?";
                pst = con.prepareStatement(sql);
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

    public static boolean updateShipDate(int orderid) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [dbo].[Order] set OrderShip = ? where [OrderID] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                String date = null;
                Date d = new Date(System.currentTimeMillis());
                date = d.toString();
                pst.setString(1, date);
                pst.setInt(2, orderid);
                pst.executeUpdate();
                pst.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return true;
    }
    
    public static boolean insertOrder(int AccID, HashMap<String, Integer> cart, String CusAddress, String CusPhone, String CustomerName, String PaymentMethod, int totalmoney) throws SQLException, Exception {
        Connection cn = DBUtils.makeConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        int OrderID = -1;
        int stock = -1;
        try {
            cn.setAutoCommit(false);
            // Các câu lệnh SQL thực hiện trong transaction ở đây
            // Insert into Order and get OrderID
            Date d = new Date(System.currentTimeMillis());

            String sql1 = "INSERT INTO [Order] (OrderDate, AccID, Status, CusAddress, CusPhone, CustomerName, PaymentMethod, TotalMoney)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stm = cn.prepareStatement(sql1);
            stm.setDate(1, d);
            stm.setInt(2, AccID);
            stm.setInt(3, 1);
            stm.setString(4, CusAddress);
            stm.setString(5, CusPhone);
            stm.setString(6, CustomerName);
            stm.setString(7, PaymentMethod);
            stm.setInt(8, totalmoney);
            stm.executeUpdate();

            // Get OrderID
            String sql2 = "select top 1 OrderID from  [dbo].[Order] order by OrderID desc";
            stm = cn.prepareStatement(sql2);
            rs = stm.executeQuery();

            if (rs != null && rs.next()) {
                OrderID = rs.getInt("OrderID");
}

            // Insert into OrderDetail and update Plant 
            Set<String> pids = cart.keySet();
            for (String pid : pids) {
//                int quantity = cart.get(pid);
//                String sql3 = "SELECT stock FROM Plant WHERE PID = ?";
//                stm = cn.prepareStatement(sql3);
//                stm.setInt(1, Integer.parseInt(pid.trim()));
//                rs = stm.executeQuery();
//                if (rs != null && rs.next()) {
//                    stock = rs.getInt("stock");
//                }

                String sql4 = "INSERT INTO OrderDetail (OrderID, PlantID, Quantity) VALUES (?, ?, ?)";
                stm = cn.prepareStatement(sql4);
                stm.setInt(1, OrderID);
                stm.setInt(2, Integer.parseInt(pid.trim()));
                stm.setInt(3, cart.get(pid));
                stm.executeUpdate();

                String sql5 = "UPDATE Plant SET stock = stock - ?, sold = sold + ? WHERE PID = ?";
                stm = cn.prepareStatement(sql5);
                stm.setInt(1, cart.get(pid));
                stm.setInt(2, cart.get(pid));
                stm.setInt(3, Integer.parseInt(pid.trim()));
                stm.executeUpdate();

            }

            // Delete Order if OrderDetail is empty
            String sql16 = "DELETE FROM [Order] WHERE OrderID = ? AND "
                    + "(SELECT COUNT(*) FROM OrderDetail WHERE OrderID = ?) = 0";
            stm = cn.prepareStatement(sql16);
            stm.setInt(1, OrderID);
            stm.setInt(2, OrderID);
            stm.executeUpdate();

            cn.commit(); // xác nhận transaction

            return true;
        } catch (SQLException ex) {
            cn.rollback(); // hủy bỏ transaction nếu xảy ra lỗi
            return false;
        } finally {
            cn.setAutoCommit(true); // Khôi phục chế độ tự động commit mặc định
            cn.close(); // đóng kết nối sau khi sử dụng
        }
    }

    public static boolean updateOrderInfor(int AccID, String CusAddress, String CusPhone, String CustomerName) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update [dbo].[Order] set CustomerName=?, CusPhone=?, CusAddress=? where AccID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, CustomerName);
                pst.setString(2, CusPhone);
                pst.setString(3, CusAddress);
                pst.setInt(4, AccID);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return true;
    }
    public static boolean insertAuctionOrder(int AccID, HashMap<String, Integer> cart, String CusAddress, String CusPhone, String CustomerName, String PaymentMethod, int totalmoney) throws SQLException, Exception {
        Connection cn = DBUtils.makeConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        int OrderID = -1;
        int stock = -1;
        try {
            cn.setAutoCommit(false);
            // Các câu lệnh SQL thực hiện trong transaction ở đây
            // Insert into Order and get OrderID
            Date d = new Date(System.currentTimeMillis());

            String sql1 = "INSERT INTO [Order] (OrderDate, AccID, Status, CusAddress, CusPhone, CustomerName, PaymentMethod, TotalMoney)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            stm = cn.prepareStatement(sql1);
            stm.setDate(1, d);
            stm.setInt(2, AccID);
            stm.setInt(3, 1);
            stm.setString(4, CusAddress);
            stm.setString(5, CusPhone);
            stm.setString(6, CustomerName);
            stm.setString(7, PaymentMethod);
            stm.setInt(8, totalmoney);
            stm.executeUpdate();

            // Get OrderID
            String sql2 = "select top 1 OrderID from  [dbo].[Order] order by OrderID desc";
            stm = cn.prepareStatement(sql2);
            rs = stm.executeQuery();

            if (rs != null && rs.next()) {
                OrderID = rs.getInt("OrderID");
}

            // Insert into OrderDetail and update Plant 
            Set<String> pids = cart.keySet();
            for (String pid : pids) {
//                int quantity = cart.get(pid);
//                String sql3 = "SELECT stock FROM Plant WHERE PID = ?";
//                stm = cn.prepareStatement(sql3);
//                stm.setInt(1, Integer.parseInt(pid.trim()));
//                rs = stm.executeQuery();
//                if (rs != null && rs.next()) {
//                    stock = rs.getInt("stock");
//                }

                String sql4 = "INSERT INTO OrderDetail (OrderID, PlantID, Quantity) VALUES (?, ?, ?)";
                stm = cn.prepareStatement(sql4);
                stm.setInt(1, OrderID);
                stm.setInt(2, Integer.parseInt(pid.trim()));
                stm.setInt(3, cart.get(pid));
                stm.executeUpdate();

                String sql5 = "UPDATE Plant SET stock = stock - ?, sold = sold + ? WHERE PID = ?";
                stm = cn.prepareStatement(sql5);
                stm.setInt(1, cart.get(pid));
                stm.setInt(2, cart.get(pid));
                stm.setInt(3, Integer.parseInt(pid.trim()));
                stm.executeUpdate();

            }

            // Delete Order if OrderDetail is empty
            String sql16 = "DELETE FROM [Order] WHERE OrderID = ? AND "
                    + "(SELECT COUNT(*) FROM OrderDetail WHERE OrderID = ?) = 0";
            stm = cn.prepareStatement(sql16);
            stm.setInt(1, OrderID);
            stm.setInt(2, OrderID);
            stm.executeUpdate();

            cn.commit(); // xác nhận transaction

            return true;
        } catch (SQLException ex) {
            cn.rollback(); // hủy bỏ transaction nếu xảy ra lỗi
            return false;
        } finally {
            cn.setAutoCommit(true); // Khôi phục chế độ tự động commit mặc định
            cn.close(); // đóng kết nối sau khi sử dụng
        }
    }
}
