/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

/**
 *
 * @author Triệu
 */
public class AuctionWinner {
    private int WinnerID;
    private int AuctionID;
    private int PlantID;
    private int AccountID;

    public AuctionWinner(int WinnerID, int AuctionID, int PlantID, int AccountID) {
        this.WinnerID = WinnerID;
        this.AuctionID = AuctionID;
        this.PlantID = PlantID;
        this.AccountID = AccountID;
    }
    
    public AuctionWinner() {
    }

    public int getAuctionID() {
        return AuctionID;
    }

    public void setAuctionID(int AuctionID) {
        this.AuctionID = AuctionID;
    }

    public int getWinnerID() {
        return WinnerID;
    }

    public void setWinnerID(int WinnerID) {
        this.WinnerID = WinnerID;
    }

    public int getPlantID() {
        return PlantID;
    }

    public void setPlantID(int PlantID) {
        this.PlantID = PlantID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }
    
}
