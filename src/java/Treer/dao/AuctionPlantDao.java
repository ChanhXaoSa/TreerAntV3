/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.AuctionPlant;
import Treer.untils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Triệu
 */
public class AuctionPlantDao {

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

}
