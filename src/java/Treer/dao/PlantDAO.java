/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.Categories;
import Treer.dto.Plant;
import Treer.dto.Sale;
import Treer.untils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
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
                    + "where NamePlant like ? and (Status=1 or Status=0)";

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

    public static ArrayList<Plant> searchPlantForAdmin(String keyword, String cate) {

        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "SELECT  [PID], [NamePlant], [price], [description], [Status], stock,\n"
                    + "CONVERT(varchar, CreateDate, 105) + ' ' + CONVERT(varchar, CreateDate, 108) as CreateDate, \n"
                    + "CONVERT(varchar, UpdateDate, 105) + ' ' + CONVERT(varchar, UpdateDate, 108) as UpdateDate from [dbo].[Plant]";

//            String sql = "SELECT  [PID], [NamePlant], [price], [description], [Status], "
//                    + "CONVERT(varchar, CreateDate, 105) + ' ' + CONVERT(varchar, CreateDate, 108) as CreateDate, "
//                    + "CONVERT(varchar, UpdateDate, 105) + ' ' + CONVERT(varchar, UpdateDate, 108) as UpdateDate from [dbo].[Plant]"
//                    + " where NamePlant like ?";
            if (cn != null) {

                if (cate.equalsIgnoreCase("name")) {
                    sql = sql + " WHERE NamePlant like ?";
                } else if (cate.equals("id")) {
                    sql = sql + " WHERE PID like ? ";
                } else if (cate.equals("status")) {
                    sql = sql + " WHERE Status like ?";
                }

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String name = rs.getString(2);
                        int price = rs.getInt(3);
                        String des = rs.getString(4);
                        int status = rs.getInt(5);
                        int stock = rs.getInt(6);
                        String cDate = rs.getString(7);
                        String uDate = rs.getString(8);

                        String imgPath = getPlantImgByID(id);
                        int sale = getSaleByID(id);

                        Plant plant = new Plant(id, name, price, imgPath, des, status, stock, stock, sale, cDate, uDate);
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

            String sql1 = "select PID, [NamePlant], [price]  from Plant \n"
                    + "where Status=1 or Status=0";

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

    // hiển thị danh sách cây cho admin
    public static ArrayList<Plant> printAllPlantsAdmin() {

        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "SELECT  [PID], [NamePlant], [price], [description], [Status], stock,\n"
                    + "CONVERT(varchar, CreateDate, 105) + ' ' + CONVERT(varchar, CreateDate, 108) as CreateDate, \n"
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
                        int stock = rs.getInt(6);
                        String cDate = rs.getString(7);
                        String uDate = rs.getString(8);

                        String imgPath = getPlantImgByID(id);
                        int sale = getSaleByID(id);

                        Plant plant = new Plant(id, name, price, imgPath, des, status, stock, stock, sale, cDate, uDate);
                        list.add(plant);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // hiển thị chi tiết cây cho admin
    public static Plant printPlantsDetailsAdmin(int PID) {

        Plant plant = null;
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "SELECT  [PID], [NamePlant], [price], [description], [Status], stock, sold,\n"
                    + "CONVERT(varchar, CreateDate, 105) + ' ' + CONVERT(varchar, CreateDate, 108) as CreateDate, \n"
                    + "CONVERT(varchar, UpdateDate, 105) + ' ' + CONVERT(varchar, UpdateDate, 108) as UpdateDate from [dbo].[Plant] "
                    + "where PID = ?";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);
                pst.setInt(1, PID);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String name = rs.getString(2);
                        int price = rs.getInt(3);
                        String des = rs.getString(4);
                        int status = rs.getInt(5);
                        int stock = rs.getInt(6);
                        int sold = rs.getInt(7);
                        String cDate = rs.getString(8);
                        String uDate = rs.getString(9);

                        String imgPath = getPlantImgByID(id);
                        int sale = getSaleByID(id);

                        plant = new Plant(id, name, price, imgPath, des, status, stock, sold, sale, cDate, uDate);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plant;
    }

    // hàm này để lấy ảnh dựa trên ID
    public static String getPlantImgByID(int id) {
        Connection cn = null;
        String imgpath = "";
        try {
            cn = DBUtils.makeConnection();

            String sql2 = "select top 1 [PlantimgPath] from PlantImg "
                    + "where pid = ? ";

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

    // Hiện tất cả Sale
    public static ArrayList<Sale> printallSale() throws SQLException {
        ArrayList<Sale> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql = "select * from Sale";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int saleID = rs.getInt(1);
                        int saleNum = rs.getInt(2);
                        Sale sale = new Sale(saleID, saleNum);
                        list.add(sale);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    // lấy %sale dựa theo ID
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

            String sql1 = "select Plant.[PID], [NamePlant], [price], [Status]\n"
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
                        int status = rs.getInt(4);
                        String imgpath = getPlantImgByID(id);
                        int saleprice = price - price * getSaleByID(id) / 100;
                        Plant plant = new Plant(id, name, price, imgpath, imgpath, status, status, id, saleprice);
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

            String sql1 = "select Plant.[PID], [NamePlant], [price], [Status] from Plant\n"
                    + "where Status=1 or Status=0 \n"
                    + "order by PID desc";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String name = rs.getString(2);
                        int price = rs.getInt(3);
                        int status = rs.getInt(4);
                        String imgpath = getPlantImgByID(id);
                        int saleprice = price - price * getSaleByID(id) / 100;
                        Plant plant = new Plant(id, name, price, imgpath, imgpath, status, status, id, saleprice);
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

    // lấy ID cây cho addtocart
    public static Plant getPlantByPID(int PID) {
        Plant plant = null;
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "SELECT * FROM Plant\n"
                    + "WHERE PID = ? ";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);
                // đặt CateID
                pst.setInt(1, PID);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String name = rs.getString("NamePlant");
                        int price = rs.getInt("price");
                        String description = rs.getString("description");
                        int status = rs.getInt("Status");
                        int stock = rs.getInt("stock");
                        int sold = rs.getInt("sold");
                        String imgpath = getPlantImgByID(id);

                        plant = new Plant(id, name, price, imgpath, description, status, stock, sold);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plant;
    }

    // Hiện những sản phẩm bán chạy
    public static ArrayList<Plant> printHotPlant() {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "select Plant.[PID], [NamePlant], [price], [Status] from Plant\n"
                    + "where Status=1 or Status=0\n"
                    + "order by sold desc";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt(1);
                        String name = rs.getString(2);
                        int price = rs.getInt(3);
                        int status = rs.getInt(4);
                        String imgpath = getPlantImgByID(id);
                        int saleprice = price - price * getSaleByID(id) / 100;
                        Plant plant = new Plant(id, name, price, imgpath, imgpath, status, status, id, saleprice);
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

    // thay đổi giá cây
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

    // sửa số lượng hàng tồn
    public static boolean changePlantStockByID(int id, int newStock) {
        Connection cn = null;
        try {
            cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Plant set stock=?,UpdateDate=CURRENT_TIMESTAMP where PID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, newStock);
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

    // sửa % khuyến mãi sản phẩm
    public static boolean changePlantSaleByID(int id, int newSale) {
        Connection cn = null;
        try {
            cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Plant set saleID=?,UpdateDate=CURRENT_TIMESTAMP where PID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, newSale);
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

    public static boolean changePlantNameByCate(int id, String newCate) {
        Connection cn = null;
        try {
            cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update dbo.Plant set NamePlant=?,UpdateDate=CURRENT_TIMESTAMP where PID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, newCate);
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

    public static int countTotalPlant() throws Exception {
        int count = 0;
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT SUM(stock) as countPlant FROM dbo.Plant";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        count = table.getInt("countPlant");
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    // đổi hình ảnh hiển thị cây
    public static boolean changePlantImgByID(int id, String imgPath) {
        Connection cn = null;
        try {
            cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE dbo.PlantImg\n"
                        + "SET [PlantimgPath] = ?\n"
                        + "WHERE [PID] = ? AND [PlantimgPath] = (\n"
                        + "  SELECT TOP 1 [PlantimgPath]\n"
                        + "  FROM (\n"
                        + "    SELECT [PlantimgPath], ROW_NUMBER() OVER (ORDER BY [PicturePlant_ID]) AS row_num\n"
                        + "    FROM dbo.PlantImg\n"
                        + "    WHERE [PID] = ?\n"
                        + "  ) as t\n"
                        + "  WHERE row_num = 1\n"
                        + ");\n"
                        + "\n"
                        + "UPDATE [dbo].[Plant] SET UpdateDate=CURRENT_TIMESTAMP where PID= ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "img\\product_img\\" + imgPath);
                pst.setInt(2, id);
                pst.setInt(3, id);
                pst.setInt(4, id);
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

    public static boolean insertAuctionPlant(String NamePlant, int price, String description, String PlantimgPath) throws Exception {
        int rs = 0;
        try {
            Connection cn = Treer.untils.DBUtils.makeConnection();
            String sql = "BEGIN TRANSACTION\n"
                    + "DECLARE @PlantID int\n"
                    + "insert into dbo.Plant(NamePlant,price,description,Status,CreateDate,stock)\n"
                    + "values(?,?,?,2,CURRENT_TIMESTAMP,1)\n"
                    + "set @PlantID = SCOPE_IDENTITY()\n"
                    + "insert into dbo.PlantImg(PID,PlantimgPath)\n"
                    + "values(@PlantID, ?)\n"
                    + "commit transaction";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, NamePlant);
            pst.setInt(2, price);
            pst.setString(3, description);
            pst.setString(4, PlantimgPath);
            rs = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static Plant getLastPlantForAuction() {
        Plant plant = null;
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();

            String sql1 = "Select TOP 1 PID,NamePlant,price,description,Status,CreateDate,UpdateDate,stock,sold,saleID\n"
                    + "from dbo.Plant \n"
                    + "order by PID desc";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);
                // đặt CateID

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String name = rs.getString("NamePlant");
                        int price = rs.getInt("price");
                        String description = rs.getString("description");
                        int status = rs.getInt("Status");
                        int stock = rs.getInt("stock");
                        int sold = rs.getInt("sold");
                        String imgpath = getPlantImgByID(id);

                        plant = new Plant(id, name, price, imgpath, description, status, stock, sold);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plant;
    }

    // tổ hợp phục vụ cho việc add cây, lưu thông tin cơ bản của cây
    public static boolean AddNewPlant(String newName, int price, String description, int stock, int saleID, String imgpath) {
        Connection cn = null;
        try {
            cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {
                String sql = "BEGIN TRANSACTION\n"
                        + "DECLARE @PlantID INT\n"
                        + "INSERT INTO Plant([NamePlant], [price], [description], [Status], [CreateDate], [stock], [SaleID])\n"
                        + "VALUES (?,?,?,?,?,?,?)\n"
                        + "SET @PlantID = SCOPE_IDENTITY()\n"
                        + "INSERT INTO [dbo].[PlantImg] ([PID], [PlantimgPath])\n"
                        + "VALUES (@PlantID, ?)\n"
                        + "COMMIT TRANSACTION";

                try (PreparedStatement pst = cn.prepareStatement(sql)) {
                    pst.setString(1, newName);
                    pst.setInt(2, price);
                    pst.setString(3, description);
                    pst.setInt(4, stock == 0 ? 0 : 1);
                    Date d = new Date(System.currentTimeMillis());
                    String Date = d.toString();
                    pst.setString(5, Date);
                    pst.setInt(6, stock);
                    pst.setInt(7, saleID);
                    pst.setString(8, "img\\product_img\\" + imgpath);

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

    // lấy ID cây mới nhất
    public static int getNewPlantID() {
        int PID = 0;
        Connection cn = null;
        try {

            cn = DBUtils.makeConnection();

            String sql1 = "select top 1 [PID] from [dbo].[Plant] order by PID desc";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql1);

                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        PID = rs.getInt("PID");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return PID;
    }

    // add cate cho cây mới thêm vào
    public static boolean AddCateForNewPlant(int PlantID, int CateId) {
        Connection cn = null;
        try {
            cn = Treer.untils.DBUtils.makeConnection();
            if (cn != null) {

                String sql = "INSERT INTO [dbo].[CategoriesDetails] ([PlantID], [CategoriesID]) VALUES (?, ?)";
                try (PreparedStatement pst = cn.prepareStatement(sql)) {
                    pst.setInt(1, PlantID);
                    pst.setInt(2, CateId);
                    pst.executeUpdate();
                    cn.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }
}
