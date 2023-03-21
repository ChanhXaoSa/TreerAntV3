/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.AuctionPlant;
import Treer.untils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Triệu
 */
public class AuctionPlantDao {
    
    public static ArrayList<AuctionPlant> getAllAuctionPlants() {
        ArrayList<AuctionPlant> list = new ArrayList<>();
        AuctionPlant p = null;
        Connection cn = null;
        try {

            cn = DBUtils.makeConnection();

            String sql1 = "select PlantAuctionID,PlantAuctionName,Description,\n"
                    + "CONVERT(varchar, CreateDate, 105) + ' ' + CONVERT(varchar, CreateDate, 108) as CreateDate,\n"
                    + "CONVERT(varchar, UpdateDate, 105) + ' ' + CONVERT(varchar, UpdateDate, 108) as UpdateDate,imgPath \n"
                    + "from dbo.AuctionPlant";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int PlantAuctionID = rs.getInt(1);
                        String PlantAuctionName = rs.getString(2);
                        String Description = rs.getString(3);
                        String CreateDate = rs.getString(4);
                        String UpdateDate = rs.getString(5);
                        String imgPath = rs.getString(6);
                        p = new AuctionPlant(PlantAuctionID, PlantAuctionName, Description, CreateDate, UpdateDate, imgPath);
                        list.add(p);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    
    public static AuctionPlant getPlantwithPID(int PAID) {

        AuctionPlant p = null;
        Connection cn = null;
        try {

            cn = DBUtils.makeConnection();

            String sql1 = "select PlantAuctionID,PlantAuctionName,Description,CreateDate,UpdateDate,imgPath \n"
                    + "from dbo.AuctionPlant\n"
                    + "where PlantAuctionID=?";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);
                // đặt CateID
                pst.setInt(1, PAID);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int PlantAuctionID = rs.getInt(1);
                        String PlantAuctionName = rs.getString(2);
                        String Description = rs.getString(3);
                        String CreateDate = rs.getString(4);
                        String UpdateDate = rs.getString(5);
                        String imgPath = rs.getString(6);
                        p = new AuctionPlant(PlantAuctionID, PlantAuctionName, Description, CreateDate, UpdateDate, imgPath);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public static boolean AddNewAuctionPlant(String plantName, String description, String imgPath){
        
        Connection cn = null;
        try {
            cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into AuctionPlant ([PlantAuctionName], [Description], [CreateDate], [imgPath]) values (?,?,?,?)";

                try ( PreparedStatement pst = cn.prepareStatement(sql)) {
                    pst.setString(1, plantName);
                    pst.setString(2, description);
                    
                    Date date = new Date(System.currentTimeMillis());
                    String Createdate = date.toString();
                    pst.setString(3, Createdate);
                    pst.setString(4, "img\\auction_img\\"+imgPath);
                    pst.executeQuery();
}
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
}
