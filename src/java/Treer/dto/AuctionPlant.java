/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

/**
 *
 * @author Triệu
 */
public class AuctionPlant {
    private int PlantAuctionID;
    private String PlantAuctionName;
    private String Description;
    private String CreateDate;
    private String UpdateDate;
    private String imgPath;

    public AuctionPlant() {
    }

    public AuctionPlant(int PlantAuctionID, String PlantAuctionName, String Description, String CreateDate, String UpdateDate, String imgPath) {
        this.PlantAuctionID = PlantAuctionID;
        this.PlantAuctionName = PlantAuctionName;
        this.Description = Description;
        this.CreateDate = CreateDate;
        this.UpdateDate = UpdateDate;
        this.imgPath = imgPath;
    }

    public int getPlantAuctionID() {
        return PlantAuctionID;
    }

    public void setPlantAuctionID(int PlantAuctionID) {
        this.PlantAuctionID = PlantAuctionID;
    }

    public String getPlantAuctionName() {
        return PlantAuctionName;
    }

    public void setPlantAuctionName(String PlantAuctionName) {
        this.PlantAuctionName = PlantAuctionName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(String CreateDate) {
        this.CreateDate = CreateDate;
    }

    public String getUpdateDate() {
        return UpdateDate;
    }

    public void setUpdateDate(String UpdateDate) {
        this.UpdateDate = UpdateDate;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
    
}
