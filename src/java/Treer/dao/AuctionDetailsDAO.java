/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.AuctionDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Triệu
 */
public class AuctionDetailsDAO {

    public static ArrayList<AuctionDetail> getAllAutionDetails() throws Exception {
        ArrayList<AuctionDetail> result = new ArrayList<>();
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select AuctionDetailID,AuctionID,AccountID,Bidprice, \n"
                        + "CONVERT(varchar, Bidtime, 105) + ' ' + CONVERT(varchar, Bidtime, 108) as Bidtime\n"
                        + "from dbo.AuctionDetails order by AuctionDetailID desc";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionDetailID = table.getInt("AuctionDetailID");
                        int AuctionID = table.getInt("AuctionID");
                        int AccountID = table.getInt("AccountID");
                        int Bidprice = table.getInt("Bidprice");
                        String Bidtime = table.getString("Bidtime");
                        AuctionDetail auc = new AuctionDetail(AuctionDetailID, AuctionID, AccountID, Bidprice, Bidtime);
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

    public static ArrayList<AuctionDetail> getAllAutionDetailsByID(int id) throws Exception {
        ArrayList<AuctionDetail> result = new ArrayList<>();
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select AuctionDetailID,AuctionID,AccountID,Bidprice,\n"
                        + "                        CONVERT(varchar, Bidtime, 105) + ' ' + CONVERT(varchar, Bidtime, 108) as Bidtime\n"
                        + "						from dbo.AuctionDetails\n"
                        + "						where AuctionID = ? \n"
                        + "                        order by AuctionDetailID desc";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet table = pst.executeQuery();
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionDetailID = table.getInt("AuctionDetailID");
                        int AuctionID = table.getInt("AuctionID");
                        int AccountID = table.getInt("AccountID");
                        int Bidprice = table.getInt("Bidprice");
                        String Bidtime = table.getString("Bidtime");
                        AuctionDetail auc = new AuctionDetail(AuctionDetailID, AuctionID, AccountID, Bidprice, Bidtime);
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

    public static ArrayList<AuctionDetail> getMaxAutionDetailsByID(int id) throws Exception {
        ArrayList<AuctionDetail> result = new ArrayList<>();
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select TOP 1 AuctionDetailID,AuctionID,AccountID,Bidprice,\n"
                        + "                        CONVERT(varchar, Bidtime, 105) + ' ' + CONVERT(varchar, Bidtime, 108) as Bidtime\n"
                        + "						from dbo.AuctionDetails\n"
                        + "						where AuctionID = ? \n"
                        + "                        order by AuctionDetailID desc";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet table = pst.executeQuery();
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int AuctionDetailID = table.getInt("AuctionDetailID");
                        int AuctionID = table.getInt("AuctionID");
                        int AccountID = table.getInt("AccountID");
                        int Bidprice = table.getInt("Bidprice");
                        String Bidtime = table.getString("Bidtime");
                        AuctionDetail auc = new AuctionDetail(AuctionDetailID, AuctionID, AccountID, Bidprice, Bidtime);
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

    public static boolean insertAuctionDetail(int auctionId, int accID, int bidPrice) {
        int rs = 0;
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            String sql = "DECLARE @newBidPrice INT;\n"
                    + "SET @newBidPrice = ?;\n"
                    + "\n"
                    + "DECLARE @maxBidPrice INT;\n"
                    + "SELECT @maxBidPrice = MAX(Bidprice) FROM dbo.AuctionDetails\n"
                    + "WHERE AuctionID=?;\n"
                    + "IF (@maxBidPrice is null)\n"
                    + "                    BEGIN\n"
                    + "                        set @maxBidPrice = 0;\n"
                    + "                    END\n"
                    + "IF @newBidPrice > @maxBidPrice\n"
                    + "BEGIN\n"
                    + "    INSERT INTO dbo.AuctionDetails (AuctionID, AccountID, Bidprice, Bidtime)\n"
                    + "    VALUES (?, ?, @newBidPrice, CURRENT_TIMESTAMP);\n"
                    + "END";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, bidPrice);
            pst.setInt(2, auctionId);
            pst.setInt(3, auctionId);
            pst.setInt(4, accID);
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
}
