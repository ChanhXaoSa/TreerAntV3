/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.Categories;
import Treer.dto.WishList;
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
public class WishListDAO {

    // hiển thị toàn bộ wishlist
    public static ArrayList<WishList> printallWishList(int accid) throws SQLException {

        ArrayList<WishList> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "select [WishID],[AccID],[PID] from [dbo].[WishList]\n"
                    + "where [AccID] = ?";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accid);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int wishid = rs.getInt(1);
                        accid = rs.getInt(2);
                        int pid = rs.getInt(3);

                        WishList wishList = new WishList(wishid, accid, pid);

                        list.add(wishList);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static void addOrRemovePlantFromWishlist(int accid, int pid) {

        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "select [WishID],[AccID],[PID] from [dbo].[WishList]\n"
                    + "where [AccID] = ? and [PID] = ?";

            if (cn != null) {
                try ( PreparedStatement pst = cn.prepareStatement(sql1)) {
                    pst.setInt(1, accid);
                    pst.setInt(2, pid);

                    try ( ResultSet rs = pst.executeQuery()) {
                        if (rs.next()) {
                            String sql2 = "delete from [dbo].[WishList]\n"
                                    + "where [AccID] = ? and [PID] =?";
                            try ( PreparedStatement pst2 = cn.prepareStatement(sql2)) {
                                pst2.setInt(1, accid);
                                pst2.setInt(2, pid);
                                pst2.executeUpdate();
                            }
                        } else {
                            String sql3 = "insert into [dbo].[WishList] ([AccID], [PID])\n"
                                    + "values (?,?)";
                            try ( PreparedStatement pst3 = cn.prepareStatement(sql3)) {
                                pst3.setInt(1, accid);
                                pst3.setInt(2, pid);
                                pst3.executeUpdate();
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static boolean checkWishList(int accid, int pid) throws SQLException {
        Connection cn = null;
        boolean check = false;
        try {
            cn = DBUtils.makeConnection();

            String sql = "SELECT [WishID], [AccID], [PID] FROM [dbo].[WishList] WHERE [AccID] = ? AND [PID] = ?";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accid);
                pst.setInt(2, pid);
                ResultSet rs = pst.executeQuery();

                if (rs.next()) { // sử dụng phương thức next() để kiểm tra xem có bản ghi nào trong kết quả truy vấn hay không
                    check = true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (cn != null) {
                cn.close();
            }
        }
        return check;
    }

    // hàm này để lấy ảnh dựa trên ID
    public static String getPlantImgByID(int id) {
        Connection cn = null;
        String imgpath = "";
        try {
            cn = DBUtils.makeConnection();

            String sql2 = "select [PlantimgPath] from PlantImg \n"
                    + "where pid = ? \n"
                    + "order by pid offset 1 rows fetch next 1 rows only";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql2);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        imgpath = rs.getString("PlantimgPath");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return imgpath;
    }
    
    // hàm này để lấy ảnh dựa trên ID
    public static String getPlantNameByID(int pid) {
        Connection cn = null;
        String plantname = "";
        try {
            cn = DBUtils.makeConnection();

            String sql2 = "select [NamePlant] from [dbo].[Plant] where [PID] = ?";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql2);
                pst.setInt(1, pid);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        plantname = rs.getString(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plantname;
    }
}
