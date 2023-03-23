/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

/**
 *
 * @author tuank
 */
public class Order {
    private int orderID;
    private String orderdate;
    private String ordership;
    private int status;
    private int accID;
    private String discount;

    private String Address;
    private String Phone;
    private String NameCus;
    public Order() {
    }

    public Order(int orderID, String orderdate, String ordership, int status, int accID, String discount) {
        this.orderID = orderID;
        this.orderdate = orderdate;
        this.ordership = ordership;
        this.status = status;
        this.accID = accID;
        this.discount = discount;
    }

    public Order(int orderID, String orderdate, String ordership, int status, int accID, String discount, String Address, String Phone, String NameCus) {
        this.orderID = orderID;
        this.orderdate = orderdate;
        this.ordership = ordership;
        this.status = status;
        this.accID = accID;
        this.discount = discount;
        this.Address = Address;
        this.Phone = Phone;
        this.NameCus = NameCus;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }

    public String getOrdership() {
        return ordership;
    }

    public void setOrdership(String ordership) {
        this.ordership = ordership;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getNameCus() {
        return NameCus;
    }

    public void setNameCus(String NameCus) {
        this.NameCus = NameCus;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", orderdate=" + orderdate + ", ordership=" + ordership + ", status=" + status + ", accID=" + accID + ", discount=" + discount + ", Address=" + Address + ", Phone=" + Phone + ", NameCus=" + NameCus + '}';
    }
}
