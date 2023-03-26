/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.Auction;
import Treer.untils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Triệu
 */
public class AuctionDAO {

    // HÀM XỬ LÝ CỦA ADMIN
    // LẤY TOÀN BỘ DANH SÁCH ĐẤU GIÁ
    public static ArrayList<Auction> getAllAuctions() throws Exception {
        ArrayList<Auction> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select AuctionID,\n"
                        + "		CONVERT(varchar, Starttime, 105) + ' ' + CONVERT(varchar, Starttime, 108) as Starttime,\n"
                        + "			CONVERT(varchar, Endtime, 105) + ' ' + CONVERT(varchar, Endtime, 108) as Endtime,\n"
                        + "			PlantID,Starting_price,End_price,Status,bid from dbo.Auction\n"
                        + "order by Status desc";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt("AuctionID");
                        String Starttime = table.getString("Starttime");
                        String Endtime = table.getString("Endtime");
                        int PlantID = table.getInt("PlantID");
                        int Starting_price = table.getInt("Starting_price");
                        int End_price = table.getInt("End_price");
                        int status = table.getInt("Status");
                        int bid = table.getInt("bid");
                        Auction auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                        result.add(auc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    public static ArrayList<Auction> getAllAuctionsByAdmin() throws Exception {
        ArrayList<Auction> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select AuctionID,\n"
                        + "		CONVERT(varchar, Starttime, 105) + ' ' + CONVERT(varchar, Starttime, 108) as Starttime,\n"
                        + "			CONVERT(varchar, Endtime, 105) + ' ' + CONVERT(varchar, Endtime, 108) as Endtime,\n"
                        + "			PlantID,Starting_price,End_price,Status,bid from dbo.Auction\n"
                        + "order by AuctionID desc";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt("AuctionID");
                        String Starttime = table.getString("Starttime");
                        String Endtime = table.getString("Endtime");
                        int PlantID = table.getInt("PlantID");
                        int Starting_price = table.getInt("Starting_price");
                        int End_price = table.getInt("End_price");
                        int status = table.getInt("Status");
                        int bid = table.getInt("bid");
                        Auction auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                        result.add(auc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    // LẤY TOÀN BỘ DANH SÁCH ĐẤU GIÁ THEO NGÀY THÁNG
    public static ArrayList<Auction> getAllAuctionsWithDate(String from, String to) throws Exception {
        ArrayList<Auction> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select AuctionID,\n"
                        + "		CONVERT(varchar, Starttime, 105) + ' ' + CONVERT(varchar, Starttime, 108) as Starttime,\n"
                        + "			CONVERT(varchar, Endtime, 105) + ' ' + CONVERT(varchar, Endtime, 108) as Endtime,\n"
                        + "			PlantID,Starting_price,End_price,Status,bid from dbo.Auction where Starttime >= ? and Endtime <= ?  \n"
                        + "order by Status desc";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, from);
                pst.setString(2, to);
                ResultSet table = pst.executeQuery();
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt("AuctionID");
                        String Starttime = table.getString("Starttime");
                        String Endtime = table.getString("Endtime");
                        int PlantID = table.getInt("PlantID");
                        int Starting_price = table.getInt("Starting_price");
                        int End_price = table.getInt("End_price");
                        int status = table.getInt("Status");
                        int bid = table.getInt("bid");
                        Auction auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                        result.add(auc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    
    // LẤY DANH SÁCH ĐẤU GIÁ DỰA TRÊN STATUS
    public static ArrayList<Auction> getAllAuctionsWithStatusForAdmin(int status) throws Exception {

        ArrayList<Auction> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select AuctionID, CONVERT(varchar, Starttime, 105) + ' ' + CONVERT(varchar, Starttime, 108) as Starttime, CONVERT(varchar, Endtime, 105) + ' ' + CONVERT(varchar, Endtime, 108) as Endtime, PlantID,Starting_price,End_price,Status,bid from dbo.Auction where Status = ? order by AuctionID desc ";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);

                ResultSet table = pst.executeQuery();
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt(1);
                        String Starttime = table.getString(2);
                        String Endtime = table.getString(3);
                        int PlantID = table.getInt(4);
                        int Starting_price = table.getInt(5);
                        int End_price = table.getInt(6);
                        status = table.getInt(7);
                        int bid = table.getInt(8);
                        Auction auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                        result.add(auc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    // LẤY TOÀN BỘ DANH SÁCH ĐẤU GIÁ THEO NGÀY THÁNG VÀ STATUS
    public static ArrayList<Auction> getAllAuctionsWithDateAndStatus(String from, String to, int status) throws Exception {
        ArrayList<Auction> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select AuctionID,\n"
                        + "		CONVERT(varchar, Starttime, 105) + ' ' + CONVERT(varchar, Starttime, 108) as Starttime,\n"
                        + "			CONVERT(varchar, Endtime, 105) + ' ' + CONVERT(varchar, Endtime, 108) as Endtime,\n"
                        + "			PlantID,Starting_price,End_price,Status,bid from dbo.Auction where Starttime >= ? and Endtime <= ? and Status = ? \n"
                        + "order by Status desc";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, from);
                pst.setString(2, to);
                pst.setInt(3, status);
                ResultSet table = pst.executeQuery();
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt("AuctionID");
                        String Starttime = table.getString("Starttime");
                        String Endtime = table.getString("Endtime");
                        int PlantID = table.getInt("PlantID");
                        int Starting_price = table.getInt("Starting_price");
                        int End_price = table.getInt("End_price");
                        status = table.getInt("Status");
                        int bid = table.getInt("bid");
                        Auction auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                        result.add(auc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    
    public static ArrayList<Auction> getAllProcessingAuctions() throws Exception {
        ArrayList<Auction> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select AuctionID,\n"
                        + "		CONVERT(varchar, Starttime, 105) + ' ' + CONVERT(varchar, Starttime, 108) as Starttime,\n"
                        + "			CONVERT(varchar, Endtime, 105) + ' ' + CONVERT(varchar, Endtime, 108) as Endtime,\n"
                        + "			PlantID,Starting_price,End_price,Status,bid from dbo.Auction where Status=1\n"
                        + "order by Status desc";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt("AuctionID");
                        String Starttime = table.getString("Starttime");
                        String Endtime = table.getString("Endtime");
                        int PlantID = table.getInt("PlantID");
                        int Starting_price = table.getInt("Starting_price");
                        int End_price = table.getInt("End_price");
                        int status = table.getInt("Status");
                        int bid = table.getInt("bid");
                        Auction auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                        result.add(auc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public static ArrayList<Auction> getAllEndedAuctions() throws Exception {
        ArrayList<Auction> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select AuctionID,\n"
                        + "		CONVERT(varchar, Starttime, 105) + ' ' + CONVERT(varchar, Starttime, 108) as Starttime,\n"
                        + "			CONVERT(varchar, Endtime, 105) + ' ' + CONVERT(varchar, Endtime, 108) as Endtime,\n"
                        + "			PlantID,Starting_price,End_price,Status,bid from dbo.Auction where Status=0\n"
                        + "order by Status desc";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt("AuctionID");
                        String Starttime = table.getString("Starttime");
                        String Endtime = table.getString("Endtime");
                        int PlantID = table.getInt("PlantID");
                        int Starting_price = table.getInt("Starting_price");
                        int End_price = table.getInt("End_price");
                        int status = table.getInt("Status");
                        int bid = table.getInt("bid");
                        Auction auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                        result.add(auc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public static ArrayList<Auction> getAllJoinedAuctions(int accID) throws Exception {
        ArrayList<Auction> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select distinct a.AuctionID,\n"
                        + "CONVERT(varchar, Starttime, 105) + ' ' + CONVERT(varchar, Starttime, 108) as Starttime,\n"
                        + "CONVERT(varchar, Endtime, 105) + ' ' + CONVERT(varchar, Endtime, 108) as Endtime,\n"
                        + "PlantID,Starting_price,End_price,Status,bid,ad.AccountID from dbo.Auction a \n"
                        + "full join dbo.AuctionDetails ad on a.AuctionID=ad.AuctionID\n"
                        + "where ad.AccountID = ?\n"
                        + "order by Status desc";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accID);
                ResultSet table = pst.executeQuery();
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt("AuctionID");
                        String Starttime = table.getString("Starttime");
                        String Endtime = table.getString("Endtime");
                        int PlantID = table.getInt("PlantID");
                        int Starting_price = table.getInt("Starting_price");
                        int End_price = table.getInt("End_price");
                        int status = table.getInt("Status");
                        int bid = table.getInt("bid");
                        Auction auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                        result.add(auc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public static boolean setEndPrice(int price, int AuctionID) {
        int rs = 0;
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            String sql = "update dbo.Auction set End_price=? \n"
                    + "where AuctionID=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, price);
            pst.setInt(2, AuctionID);
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
//    update dbo.Auction set Status=0 where Endtime < CURRENT_TIMESTAMP;

    public static boolean EndAuctionbyEndTime(int AuctionID) {
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            String sql = "update dbo.Auction set Status=0 "
                    + "where Endtime < CURRENT_TIMESTAMP and AuctionID=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, AuctionID);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    // ĐỔI TRẠNG THÁI CỦA BUỔI ĐẤU GIÁ ĐÓ BẬT HOẶC TẮT
    public static boolean updateStatusAuction(int status, int aucID) {
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            String sql = "update dbo.Auction set Status=? where AuctionID=? and Endtime>CURRENT_TIMESTAMP";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setInt(2, aucID);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static Auction getAuctionbyID(int aucID) throws Exception {
        Auction auc = new Auction();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select AuctionID,Starttime,Endtime,PlantID,Starting_price,End_price,Status,bid from dbo.Auction where AuctionID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, aucID);
                ResultSet table = pst.executeQuery();
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt("AuctionID");
                        String Starttime = table.getString("Starttime");
                        String Endtime = table.getString("Endtime");
                        int PlantID = table.getInt("PlantID");
                        int Starting_price = table.getInt("Starting_price");
                        int End_price = table.getInt("End_price");
                        int status = table.getInt("Status");
                        int bid = table.getInt("bid");
                        auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return auc;
    }

    public static boolean createAuction(String aucDate, int aucPlantID, int aucStartedPrice, int aucBID) {
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            String sql = "INSERT INTO dbo.Auction\n"
                    + "           (Starttime,Endtime,PlantID,Starting_price,End_price,Status,bid)\n"
                    + "     VALUES\n"
                    + "           (CURRENT_TIMESTAMP,?,?,?,?,0,?)";
            PreparedStatement pst = cn.prepareStatement(sql);

            pst.setString(1, aucDate);
            pst.setInt(2, aucPlantID);
            pst.setInt(3, aucStartedPrice);
            pst.setInt(4, aucStartedPrice);
            pst.setInt(5, aucBID);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static boolean checkAuctionTimeEnd(int aucID) throws Exception {
        boolean check = false;
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "Select IIF (Endtime<CURRENT_TIMESTAMP and Status=1, 'true', 'false') as EndAuctime\n"
                        + "from dbo.Auction where AuctionID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, aucID);
                ResultSet table = pst.executeQuery();
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        check = Boolean.parseBoolean(table.getString("EndAuctime"));
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return check;
    }

    // lấy tên cây dựa trên ID
    public static String getNamePlantWithID(int plantAuctionID) {
        Connection cn = null;
        String plantName = "";
        try {
            cn = DBUtils.makeConnection();

            String sql = "select [PlantAuctionName]  from [dbo].[AuctionPlant] where [PlantAuctionID] = ?";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, plantAuctionID);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        plantName = rs.getString("PlantAuctionName");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plantName;
    }
    
    // HÀM CHO USER
    // LẤY TOÀN BỘ DANH SÁCH ĐẤU GIÁ DỰA THEO ACCID
    public static ArrayList<Auction> getAllAuctionsWithAccID(int accid) throws Exception {
        ArrayList<Auction> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "SELECT a.AuctionID, CONVERT(varchar, a.Starttime, 105) + ' ' + CONVERT(varchar, a.Starttime, 108) as Starttime, CONVERT(varchar, a.Endtime, 105) + ' ' + CONVERT(varchar, a.Endtime, 108) as Endtime, a.PlantID, a.Starting_price, a.End_price, a.Status, a.bid\n"
                        + "FROM dbo.Auction a\n"
                        + "JOIN [dbo].[AuctionDetails] au ON a.AuctionID = au.AuctionID\n"
                        + "WHERE au.AccountID = ? \n"
                        + "GROUP BY a.AuctionID, a.Starttime, a.Endtime, a.PlantID, a.Starting_price, a.End_price, a.Status, a.bid";

//                sql = "select distinct a.AuctionID, CONVERT(varchar, Starttime, 105) + ' ' + CONVERT(varchar, Starttime, 108) as Starttime,\n"
//                        + " CONVERT(varchar, Endtime, 105) + ' ' + CONVERT(varchar, Endtime, 108) as Endtime,\n"
//                        + " PlantID,Starting_price,End_price,Status,bid,ad.AccountID from dbo.Auction a \n"
//                        + " full join dbo.AuctionDetails ad on a.AuctionID=ad.AuctionID where ad.AccountID = ? order by Status desc";
                
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accid);
                ResultSet table = pst.executeQuery();
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt(1);
                        String Starttime = table.getString(2);
                        String Endtime = table.getString(3);
                        int PlantID = table.getInt(4);
                        int Starting_price = table.getInt(5);
                        int End_price = table.getInt(6);
                        int status = table.getInt(7);
                        int bid = table.getInt(8);
                        Auction auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                        result.add(auc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    // LẤY TOÀN BỘ DANH SÁCH ĐẤU GIÁ THEO NGÀY THÁNG
    public static ArrayList<Auction> getAllAuctionsWithDateForUser(String from, String to, int accid) throws Exception {
        ArrayList<Auction> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "SELECT a.AuctionID, CONVERT(varchar, a.Starttime, 105) + ' ' + CONVERT(varchar, a.Starttime, 108) as Starttime, CONVERT(varchar, a.Endtime, 105) + ' ' + CONVERT(varchar, a.Endtime, 108) as Endtime, a.PlantID, a.Starting_price, a.End_price, a.Status, a.bid\n"
                        + "FROM dbo.Auction a\n"
                        + "JOIN [dbo].[AuctionDetails] au ON a.AuctionID = au.AuctionID\n"
                        + "WHERE au.AccountID = ? and a.Starttime >= ? and a.Endtime <= ? \n"
                        + "GROUP BY a.AuctionID, a.Starttime, a.Endtime, a.PlantID, a.Starting_price, a.End_price, a.Status, a.bid";
                
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accid);
                pst.setString(2, from);
                pst.setString(3, to);
                ResultSet table = pst.executeQuery();
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt("AuctionID");
                        String Starttime = table.getString("Starttime");
                        String Endtime = table.getString("Endtime");
                        int PlantID = table.getInt("PlantID");
                        int Starting_price = table.getInt("Starting_price");
                        int End_price = table.getInt("End_price");
                        int status = table.getInt("Status");
                        int bid = table.getInt("bid");
                        Auction auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                        result.add(auc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    
    // LẤY DANH SÁCH ĐẤU GIÁ DỰA TRÊN STATUS
    public static ArrayList<Auction> getAllAuctionsWithStatusForUser(int accid, int status) throws Exception {

        ArrayList<Auction> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "SELECT a.AuctionID, CONVERT(varchar, a.Starttime, 105) + ' ' + CONVERT(varchar, a.Starttime, 108) as Starttime, CONVERT(varchar, a.Endtime, 105) + ' ' + CONVERT(varchar, a.Endtime, 108) as Endtime, a.PlantID, a.Starting_price, a.End_price, a.Status, a.bid\n"
                        + "FROM dbo.Auction a\n"
                        + "JOIN [dbo].[AuctionDetails] au ON a.AuctionID = au.AuctionID\n"
                        + "WHERE au.AccountID = ? and a.Status = ? \n"
                        + "GROUP BY a.AuctionID, a.Starttime, a.Endtime, a.PlantID, a.Starting_price, a.End_price, a.Status, a.bid";
                
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accid);
                pst.setInt(2, status);

                ResultSet table = pst.executeQuery();
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt(1);
                        String Starttime = table.getString(2);
                        String Endtime = table.getString(3);
                        int PlantID = table.getInt(4);
                        int Starting_price = table.getInt(5);
                        int End_price = table.getInt(6);
                        status = table.getInt(7);
                        int bid = table.getInt(8);
                        Auction auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                        result.add(auc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    // LẤY TOÀN BỘ DANH SÁCH ĐẤU GIÁ THEO NGÀY THÁNG VÀ STATUS
    public static ArrayList<Auction> getAllAuctionsWithDateAndStatusForUser(int accid, String from, String to, int status) throws Exception {
        ArrayList<Auction> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "SELECT a.AuctionID, CONVERT(varchar, a.Starttime, 105) + ' ' + CONVERT(varchar, a.Starttime, 108) as Starttime, CONVERT(varchar, a.Endtime, 105) + ' ' + CONVERT(varchar, a.Endtime, 108) as Endtime, a.PlantID, a.Starting_price, a.End_price, a.Status, a.bid\n"
                        + "FROM dbo.Auction a\n"
                        + "JOIN [dbo].[AuctionDetails] au ON a.AuctionID = au.AuctionID\n"
                        + "WHERE au.AccountID = ? and a.Status = ? and a.Starttime >= ? and a.Endtime <= ? \n"
                        + "GROUP BY a.AuctionID, a.Starttime, a.Endtime, a.PlantID, a.Starting_price, a.End_price, a.Status, a.bid";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accid);
                pst.setInt(2, status);
                pst.setString(3, from);
                pst.setString(4, to);
                
                ResultSet table = pst.executeQuery();
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionID = table.getInt("AuctionID");
                        String Starttime = table.getString("Starttime");
                        String Endtime = table.getString("Endtime");
                        int PlantID = table.getInt("PlantID");
                        int Starting_price = table.getInt("Starting_price");
                        int End_price = table.getInt("End_price");
                        status = table.getInt("Status");
                        int bid = table.getInt("bid");
                        Auction auc = new Auction(AuctionID, Starttime, Endtime, PlantID, Starting_price, bid, End_price, status);
                        result.add(auc);
                    }
                }
                // b4 close connection
                cn.close();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static int getTimeAutionByID(int aucID) {
        Connection cn = null;
        int timeSec = 0;
        try {
            cn = DBUtils.makeConnection();

            String sql = "SELECT DATEDIFF (SECOND, GETDATE(), [Endtime]) as diff FROM [dbo].[Auction] where AuctionID=?;";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, aucID);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        timeSec = rs.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return timeSec;
    }
}
