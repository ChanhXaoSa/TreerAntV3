/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

import java.time.LocalDateTime;

/**
 *
 * @author tuank
 */
public class CommentReply {
    private int id;
    private int productId;
    private int userId;
    private String UserName;
    private String content;
    private String time;

    public CommentReply() {
    }

    public CommentReply(int id, int productId, int userId, String UserName, String content, String time) {
        this.id = id;
        this.productId = productId;
        this.userId = userId;
        this.UserName = UserName;
        this.content = content;
        this.time = time;
    }

    // Getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }
}

