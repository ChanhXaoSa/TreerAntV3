/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

/**
 *
 * @author Ducbui
 */
public class CusService {
    private int CustSerID;
    private String CustEmail;
    private String CusName;
    private String Title;
    private String Content;
    private String Date_receive;
    private String Date_response;
    private String ReplyContent;
    private int Status;

    public CusService(int CustSerID, String CustEmail, String CusName, String Title, String Content, String Date_receive, String Date_response, int Status) {
        this.CustSerID = CustSerID;
        this.CustEmail = CustEmail;
        this.CusName = CusName;
        this.Title = Title;
        this.Content = Content;
        this.Date_receive = Date_receive;
        this.Date_response = Date_response;
        this.Status = Status;
    }

    public CusService(int CustSerID, String CustEmail, String CusName, String Title, String Content, String Date_receive, String Date_response, String ReplyContent, int Status) {
        this.CustSerID = CustSerID;
        this.CustEmail = CustEmail;
        this.CusName = CusName;
        this.Title = Title;
        this.Content = Content;
        this.Date_receive = Date_receive;
        this.Date_response = Date_response;
        this.ReplyContent = ReplyContent;
        this.Status = Status;
    }

    public String getReplyContent() {
        return ReplyContent;
    }

    public void setReplyContent(String ReplyContent) {
        this.ReplyContent = ReplyContent;
    }

    public CusService() {
    }

    public int getCustSerID() {
        return CustSerID;
    }

    public void setCustSerID(int CustSerID) {
        this.CustSerID = CustSerID;
    }

    public String getCustEmail() {
        return CustEmail;
    }

    public void setCustEmail(String CustEmail) {
        this.CustEmail = CustEmail;
    }

    public String getCusName() {
        return CusName;
    }

    public void setCusName(String CusName) {
        this.CusName = CusName;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public String getDate_receive() {
        return Date_receive;
    }

    public void setDate_receive(String Date_receive) {
        this.Date_receive = Date_receive;
    }

    public String getDate_response() {
        return Date_response;
    }

    public void setDate_response(String Date_response) {
        this.Date_response = Date_response;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "CusService{" + "CustSerID=" + CustSerID + ", CustEmail=" + CustEmail + ", CusName=" + CusName + ", Title=" + Title + ", Content=" + Content + ", Date_receive=" + Date_receive + ", Date_response=" + Date_response + ", ReplyContent=" + ReplyContent + ", Status=" + Status + '}';
    }

}
