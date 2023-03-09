/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

/**
 *
 * @author tuank
 */
public class WishList {
    private int wishListid, accID, PID;

    public WishList() {
    }

    public WishList(int wishListid, int accID, int PID) {
        this.wishListid = wishListid;
        this.accID = accID;
        this.PID = PID;
    }

    public int getWishListid() {
        return wishListid;
    }

    public void setWishListid(int wishListid) {
        this.wishListid = wishListid;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public int getPID() {
        return PID;
    }

    public void setPID(int PID) {
        this.PID = PID;
    }

    @Override
    public String toString() {
        return "WishList{" + "wishListid=" + wishListid + ", accID=" + accID + ", PID=" + PID + '}';
    }
}
