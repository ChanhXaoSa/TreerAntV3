/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import static Treer.dao.PlantDAO.getPlantImgByID;
import static Treer.dao.PlantDAO.getSaleByID;
import Treer.dto.Blog;
import Treer.dto.Plant;
import Treer.untils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author tuank
 */
public class BlogDAO {

    public static String getBlogImgByID(int blogid) {
        Connection cn = null;
        String imgpath = "";
        try {
            cn = DBUtils.makeConnection();

            String sql2 = "select BlogImgPath from BlogImg\n"
                    + "where BlogID = ?";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql2);
                pst.setInt(1, blogid);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        imgpath = rs.getString("BlogImgPath");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return imgpath;
    }

    public static ArrayList<Blog> printAlllog() {
        
        ArrayList<Blog> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "select [BlogID], [Status], [Title], [description], [postdate], [Link] from [dbo].[Blog]";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int blogid = rs.getInt(1);
                        int status = rs.getInt(2);
                        String title = rs.getString(3);
                        String des = rs.getString(4);
                        String postdate = rs.getString(5);
                        String imgBlogPath = getBlogImgByID(blogid);
                        String link = rs.getString(6);
                        
                        Blog blog = new Blog(blogid, status, title, des, postdate, imgBlogPath, link);
                        list.add(blog);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
