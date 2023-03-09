/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

/**
 *
 * @author Triệu
 */
public class AuctionDetail {
    private int AuctionDetailID;
    private int AuctionID;
    private int AccountID;
    private int Bidprice;
    private String Bidtime;

    public AuctionDetail() {
    }

    public AuctionDetail(int AuctionDetailID, int AuctionID, int AccountID, int Bidprice, String Bidtime) {
        this.AuctionDetailID = AuctionDetailID;
        this.AuctionID = AuctionID;
        this.AccountID = AccountID;
        this.Bidprice = Bidprice;
        this.Bidtime = Bidtime;
    }

    public int getAuctionDetailID() {
        return AuctionDetailID;
    }

    public void setAuctionDetailID(int AuctionDetailID) {
        this.AuctionDetailID = AuctionDetailID;
    }

    public int getAuctionID() {
        return AuctionID;
    }

    public void setAuctionID(int AuctionID) {
        this.AuctionID = AuctionID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public int getBidprice() {
        return Bidprice;
    }

    public void setBidprice(int Bidprice) {
        this.Bidprice = Bidprice;
    }

    public String getBidtime() {
        return Bidtime;
    }

    public void setBidtime(String Bidtime) {
        this.Bidtime = Bidtime;
    }
    
}
