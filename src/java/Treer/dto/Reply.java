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
public class Reply extends CommentReply {
    public Reply(int id, int commentId, int userId, String username, String content, String time) {
        super (id, commentId, userId, username, content, time);
    }
}
