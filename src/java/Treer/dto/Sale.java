/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

/**
 *
 * @author tuank
 */
public class Sale {
    private int saleID;
    private int Salenum;

    public Sale() {
    }

    public Sale(int saleID, int Salenum) {
        this.saleID = saleID;
        this.Salenum = Salenum;
    }

    public int getSaleID() {
        return saleID;
    }

    public void setSaleID(int saleID) {
        this.saleID = saleID;
    }

    public int getSalenum() {
        return Salenum;
    }

    public void setSalenum(int Salenum) {
        this.Salenum = Salenum;
    }

    @Override
    public String toString() {
        return "Sale{" + "saleID=" + saleID + ", Salenum=" + Salenum + '}';
    }
}
