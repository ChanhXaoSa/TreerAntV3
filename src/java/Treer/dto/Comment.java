/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

import java.util.ArrayList;

/**
 *
 * @author tuank
 */
public class Comment extends CommentReply {

    private boolean status;
    private ArrayList<Reply> replies;

    public Comment(int id, int productId, int userId, String username, String content, String time, boolean status) {
        super(id, productId, userId, username, content, time);
        this.status = status;
    }

    // Getters and setters
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void addReply(Reply reply) {
        replies.add(reply);
    }
}
