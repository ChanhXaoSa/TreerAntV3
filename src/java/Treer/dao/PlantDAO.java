/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.Categories;
import Treer.dto.Plant;
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
public class PlantDAO {

    // Hàm search Plant dựa theo tên
    public static ArrayList<Plant> searchPlants(String keyword) {

        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "select PID, [NamePlant], [price] from Plant\n"
                    + "where NamePlant like ?";

            if (cn != null) {

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String name = rs.getString(2);
                        int price = rs.getInt(3);
                        String imgpath = getPlantImgByID(id);
                        int saleprice = price - price * getSaleByID(id) / 100;
                        Plant plant = new Plant(id, name, price, imgpath, saleprice);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Hiện tất cả các cây có trong kho hàng
    public static ArrayList<Plant> printAllPlants() {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "select PID, [NamePlant], [price]  from Plant";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String name = rs.getString(2);
                        int price = rs.getInt(3);
                        String imgpath = getPlantImgByID(id);
                        int saleprice = price - price * getSaleByID(id) / 100;
                        Plant plant = new Plant(id, name, price, imgpath, saleprice);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Plant> printAllPlantsAdmin() {

        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "SELECT  [PID], [NamePlant], [price], [description], [Status], "
                    + "CONVERT(varchar, CreateDate, 105) + ' ' + CONVERT(varchar, CreateDate, 108) as CreateDate, "
                    + "CONVERT(varchar, UpdateDate, 105) + ' ' + CONVERT(varchar, UpdateDate, 108) as UpdateDate from [dbo].[Plant]";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String name = rs.getString(2);
                        int price = rs.getInt(3);
                        String des = rs.getString(4);
                        int status = rs.getInt(5);
                        String cDate = rs.getString(6);
                        String uDate = rs.getString(7);

                        Plant plant = new Plant(id, name, price, name, des, status, status, id, id, cDate, uDate);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
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

    public static int getSaleByID(int id) {
        Connection cn = null;

        int salepercent = 0;
        try {
            cn = DBUtils.makeConnection();

            String sql2 = "select [Salepercent] from [dbo].[Sale] join [dbo].[Plant] on Sale.SaleID = Plant.saleID\n"
                    + "where Plant.[PID] = ?";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql2);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        salepercent = rs.getInt("Salepercent");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return salepercent;
    }

    // Hiện tất cả danh mục sản phẩm
    public static ArrayList<Categories> printallCategories() throws SQLException {

        ArrayList<Categories> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "select * from Categories";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int cateid = rs.getInt(1);
                        String catename = rs.getString(2);
                        Categories cate = new Categories(cateid, catename);
                        list.add(cate);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    // lấy danh sách cây dựa trên CateID
    public static ArrayList<Plant> getPlantwithCate(int cateID) {

        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "select Plant.[PID], [NamePlant], [price]\n"
                    + "\n"
                    + "FROM Plant\n"
                    + "JOIN categoriesdetails ON plant.PID = categoriesdetails.PlantID\n"
                    + "JOIN categories ON categoriesdetails.CategoriesID = categories.CateID\n"
                    + "where CateID = ?;";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);
                // đặt CateID
                pst.setInt(1, cateID);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String name = rs.getString(2);
                        int price = rs.getInt(3);
                        String imgpath = getPlantImgByID(id);
                        int saleprice = price - price * getSaleByID(id) / 100;
                        Plant plant = new Plant(id, name, price, imgpath, saleprice);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // lấy danh sách cây dựa trên CateID
    public static Categories getCategorieswithCateID(int cateID) {

        Categories cate = null;

        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "select * from Categories\n"
                    + "where CateID = ?";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);
                // đặt CateID
                pst.setInt(1, cateID);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String catename = rs.getString(2);
                        cate = new Categories(cateID, catename);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cate;
    }

    // Hiện những sản phẩm cây mới
    public static ArrayList<Plant> printNewPlant() {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "select Plant.[PID], [NamePlant], [price] from Plant\n"
                    + "order by PID desc";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String name = rs.getString(2);
                        int price = rs.getInt(3);
                        String imgpath = getPlantImgByID(id);
                        int saleprice = price - price * getSaleByID(id) / 100;
                        Plant plant = new Plant(id, name, price, imgpath, saleprice);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // lấy cây dựa trên PID, dành cho product details
    public static Plant getPlantwithPID(int PID) {

        Plant p = null;
        Connection cn = null;
        try {

            cn = DBUtils.makeConnection();

            String sql1 = "select [PID], [NamePlant], [price], [description], [Status], [stock], [sold] from [dbo].[Plant]\n"
                    + "where [PID] = ?";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);
                // đặt CateID
                pst.setInt(1, PID);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String name = rs.getString(2);
                        int price = rs.getInt(3);
                        String description = rs.getString(4);
                        int status = rs.getInt(5);
                        String imgpath = getPlantImgByID(id);
                        int stock = rs.getInt(6);
                        int sold = rs.getInt(7);
                        int saleprice = price - price * getSaleByID(id) / 100;
                        p = new Plant(id, name, price, imgpath, description, status, stock, sold, saleprice);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    // Hiện những sản phẩm bán chạy
    public static ArrayList<Plant> printHotPlant() {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "select Plant.[PID], [NamePlant], [price] from Plant\n"
                    + "order by sold desc";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String name = rs.getString(2);
                        int price = rs.getInt(3);
                        String imgpath = getPlantImgByID(id);
                        int saleprice = price - price * getSaleByID(id) / 100;
                        Plant plant = new Plant(id, name, price, imgpath, saleprice);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // đổi trạng thái hàng của cây (Admin) Còn hàng - hết hàng
    public static boolean changePlantStatus(int status, int plantID) {
        Connection cn = null;
        try {
            cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Plant set Status=?,UpdateDate=CURRENT_TIMESTAMP where PID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, plantID);
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
    
    public static boolean changePlantNameByID(int id, String newName) {
        Connection cn = null;
        try {
            cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Plant set NamePlant=?,UpdateDate=CURRENT_TIMESTAMP where PID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, newName);
                pst.setInt(2, id);
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
    public static boolean changePlantPriceByID(int id, int newPrice) {
        Connection cn = null;
        try {
            cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Plant set price=?,UpdateDate=CURRENT_TIMESTAMP where PID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, newPrice);
                pst.setInt(2, id);
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
    public static boolean changePlantDescriptionByID(int id, String newDescription) {
        Connection cn = null;
        try {
            cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Plant set description=?,UpdateDate=CURRENT_TIMESTAMP where PID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, newDescription);
                pst.setInt(2, id);
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
}
