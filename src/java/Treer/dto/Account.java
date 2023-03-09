/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

/**
 *
 * @author tuank
 */
public class Account {

    private int AccID;
    private String Name;
    private String Email;
    private String Password;
    private int RoleID;
    private String Phone;
    private String Address;
    private int Status;

    public Account() {
    }

    public Account(int AccID, String Name, String Email, String Password, int RoleID, String Phone, String Address, int Status) {
        this.AccID = AccID;
        this.Name = Name;
        this.Email = Email;
        this.Password = Password;
        this.RoleID = RoleID;
        this.Phone = Phone;
        this.Address = Address;
        this.Status = Status;
    }

    public int getAccID() {
        return AccID;
    }

    public String getName() {
        return Name;
    }

    public String getEmail() {
        return Email;
    }

    public String getPassword() {
        return Password;
    }

    public int getRoleID() {
        return RoleID;
    }

    public String getPhone() {
        return Phone;
    }

    public String getAddress() {
        return Address;
    }

    public int getStatus() {
        return Status;
    }

    public void setAccID(int AccID) {
        this.AccID = AccID;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public void setRoleID(int RoleID) {
        this.RoleID = RoleID;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "Account{" + "AccID=" + AccID + ", Name=" + Name + ", Email=" + Email + ", Password=" + Password + ", RoleID=" + RoleID + ", Phone=" + Phone + ", Address=" + Address + ", Status=" + Status + '}';
    }

}
