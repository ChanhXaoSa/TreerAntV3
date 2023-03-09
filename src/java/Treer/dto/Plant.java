/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

/**
 *
 * @author tuank
 */
public class Plant {
    private int id;
    private String name;
    private int price;
    private String imgpath;
    
    private String description;
    private int status;
    
    private int stock;
    private int sold;
    
    private int sale;
    
    private String createdate;
    private String updatedate;

    public Plant() {
    }

    public Plant(int id, String name, int price, String imgpath, int sale) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgpath = imgpath;
        this.sale = sale;
    }

    // contructor 6 tham số
    public Plant(int id, String name, int price, String imgpath, String description, int status) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgpath = imgpath;
        this.description = description;
        this.status = status;
    }

    // contructor 8 tham số
    public Plant(int id, String name, int price, String imgpath, String description, int status, int stock, int sold) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgpath = imgpath;
        this.description = description;
        this.status = status;
        this.stock = stock;
        this.sold = sold;
    }

    // contructor 9
    public Plant(int id, String name, int price, String imgpath, String description, int status, int stock, int sold, int sale) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgpath = imgpath;
        this.description = description;
        this.status = status;
        this.stock = stock;
        this.sold = sold;
        this.sale = sale;
    }

    public Plant(int id, String name, int price, String imgpath, String description, int status, int stock, int sold, int sale, String createdate, String updatedate) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgpath = imgpath;
        this.description = description;
        this.status = status;
        this.stock = stock;
        this.sold = sold;
        this.sale = sale;
        this.createdate = createdate;
        this.updatedate = updatedate;
    }   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }

    @Override
    public String toString() {
        return "Plant{" + "id=" + id + ", name=" + name + ", price=" + price + ", imgpath=" + imgpath + ", description=" + description + ", status=" + status + ", stock=" + stock + ", sold=" + sold + ", sale=" + sale + ", createdate=" + createdate + ", updatedate=" + updatedate + '}';
    }
    
}
