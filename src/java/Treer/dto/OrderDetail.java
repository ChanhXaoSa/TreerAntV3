/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

/**
 *
 * @author tuank
 */
public class OrderDetail {

    private int orderDetailID, orderID, plantID, price, quantity;
    private String PlantName, ImgPath;

    public OrderDetail() {
    }

    public OrderDetail(int orderDetailID, int orderID, int plantID, int price, int quantity, String PlantName, String ImgPath) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.plantID = plantID;
        this.price = price;
        this.quantity = quantity;
        this.PlantName = PlantName;
        this.ImgPath = ImgPath;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getPlantID() {
        return plantID;
    }

    public void setPlantID(int plantID) {
        this.plantID = plantID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPlantName() {
        return PlantName;
    }

    public void setPlantName(String PlantName) {
        this.PlantName = PlantName;
    }

    public String getImgPath() {
        return ImgPath;
    }

    public void setImgPath(String ImgPath) {
        this.ImgPath = ImgPath;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "orderDetailID=" + orderDetailID + ", orderID=" + orderID + ", plantID=" + plantID + ", price=" + price + ", quantity=" + quantity + ", PlantName=" + PlantName + ", ImgPath=" + ImgPath + '}';
    }
}
