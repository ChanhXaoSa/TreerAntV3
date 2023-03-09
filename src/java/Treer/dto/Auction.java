/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

/**
 *
 * @author Triệu
 */
public class Auction {
    private int auctionId;
    private String startTime;
    private String endTime;
    private int plantId;
    private int statingPrice;
    private int bid;
    private int endPrice;
    private int status;

    public Auction() {
    }

    public Auction(int auctionId, String startTime, String endTime, int plantId, int statingPrice, int bid, int endPrice, int status) {
        this.auctionId = auctionId;
        this.startTime = startTime;
        this.endTime = endTime;
        this.plantId = plantId;
        this.statingPrice = statingPrice;
        this.bid = bid;
        this.endPrice = endPrice;
        this.status = status;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    

    public int getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(int auctionId) {
        this.auctionId = auctionId;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getPlantId() {
        return plantId;
    }

    public void setPlantId(int plantId) {
        this.plantId = plantId;
    }

    public int getStatingPrice() {
        return statingPrice;
    }

    public void setStatingPrice(int statingPrice) {
        this.statingPrice = statingPrice;
    }

    public int getEndPrice() {
        return endPrice;
    }

    public void setEndPrice(int endPrice) {
        this.endPrice = endPrice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

   
}
