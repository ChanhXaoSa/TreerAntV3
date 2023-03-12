/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.AuctionWinner;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Triệu
 */
public class AuctionWinnerDAO {

    public static ArrayList<AuctionWinner> getAllAuctionWinners() throws Exception {
        ArrayList<AuctionWinner> result = new ArrayList<>();
        try {
            //b1 make connecton
            Connection cn = Treer.untils.DBUtils.makeConnection();
            //b2 viet sql and exec
            if (cn != null) {
                String sql = "select WinnerID,PlantID,AccountID,AuctionID from dbo.AuctionWinner";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                //b3 xu li dap an
                if (table != null) {
                    while (table.next()) {
                        int WinnerID = table.getInt("WinnerID");
                        int PlantID = table.getInt("PlantID");
                        int AccountID = table.getInt("AccountID");
                        int AuctionID = table.getInt("AuctionID");
                        AuctionWinner auw = new AuctionWinner(WinnerID, AuctionID, PlantID, AccountID);
                        result.add(auw);
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

    public static boolean insertWinner(int PlantID, int AccountID, int AuctionID) throws Exception {
        int rs = 0;
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            String sql = "insert into dbo.AuctionWinner(PlantID,AccountID,AuctionID)\n"
                    + "values(?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, PlantID);
            pst.setInt(2, AccountID);
            pst.setInt(3, AuctionID);
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static AuctionWinner getAuctionWinnerByAuctionID(int AuctionID) throws Exception {
        AuctionWinner auw = null;
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select WinnerID,PlantID,AccountID,AuctionID from dbo.AuctionWinner\n"
                        + "                        where AuctionID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, AuctionID);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        int WinnerID = table.getInt("WinnerID");
                        int PlantID = table.getInt("PlantID");
                        int AccountID = table.getInt("AccountID");
                        AuctionID = table.getInt("AuctionID");
                        auw = new AuctionWinner(WinnerID, AuctionID, PlantID, AccountID);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return auw;
    }

}
