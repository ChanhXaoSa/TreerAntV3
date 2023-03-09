/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dao;

import Treer.dto.Comment;
import Treer.dto.Reply;
import Treer.untils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {

    Connection cn = null;

    // tạo một Comment
    public static void createComment(int productId, int userId, String content) throws SQLException, Exception {

        String sql = "INSERT INTO [dbo].[Comments] \n"
                + "([product_id], [AccID], [comment_content], [comment_time],[comment_status]) VALUES\n"
                + "(?, ?, ?, ?, ?)";

        try ( Connection connection = DBUtils.makeConnection();  PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, productId);
            statement.setInt(2, userId);
            statement.setString(3, content);
            Date d = new Date(System.currentTimeMillis());
            String date = d.toString();
            statement.setString(4, date);
            statement.setInt(5, 1); // mặc định luôn hiển thị

            statement.executeUpdate();
        }
    }

    public static void createReply(int commentId, int userId, String content) throws SQLException, Exception {
        String sql = "INSERT INTO [dbo].[Replies] ([comment_id], [AccID], [reply_content], [reply_time]) VALUES \n"
                + "(?,?,?,?)";

        try ( Connection connection = DBUtils.makeConnection();  PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, commentId);
            statement.setInt(2, userId);
            statement.setString(3, content);
            Date d = new Date(System.currentTimeMillis());
            String date = d.toString();
            statement.setString(4, date);

            statement.executeUpdate();
        }
    }

    public static ArrayList<Comment> getComments(int productId) throws SQLException, Exception {

        ArrayList<Comment> comments = new ArrayList<>();

        String sql = "SELECT c.[comment_id], c.[comment_content], c.[comment_time], acc.[AccID]\n"
                + "                FROM comments c \n"
                + "                INNER JOIN [dbo].[Account] acc ON c.[AccID] = acc.[AccID] \n"
                + "                WHERE c.[product_id] = ?\n"
                + "                ORDER BY c.[comment_time] DESC";

        try ( Connection connection = DBUtils.makeConnection();  PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, productId);

            try ( ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int commentId = resultSet.getInt(1);
                    String content = resultSet.getString(2);
                    String time = resultSet.getString(3);
                    int accId = resultSet.getInt(4);
                    String username = getUserNamebyAccId(accId);
                    List<Reply> replies = getReplies(commentId);

                    Comment comment = new Comment(accId, productId, accId, username, content, time, true);
                    comments.add(comment);
                }
            }
        }
        return comments;
    }

    public static ArrayList<Reply> getReplies(int commentId) throws SQLException, Exception {
        ArrayList<Reply> replies = new ArrayList<>();
        String sql = "SELECT r.[reply_id], r.[reply_content], r.[reply_time], u.[AccID] \n"
                + "                FROM replies r \n"
                + "                INNER JOIN [dbo].[Account] u ON r.[AccID] = u.[AccID]\n"
                + "                WHERE r.[comment_id] = ? \n"
                + "                ORDER BY r.[reply_time] ASC";

        try ( Connection connection = DBUtils.makeConnection();  PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, commentId);

            try ( ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int replyId = resultSet.getInt(1);
                    String content = resultSet.getString(2);
                    String replyTime = resultSet.getString(3);
                    int accId = resultSet.getInt(4);
                    String username = getUserNamebyAccId(accId);

                    Reply reply = new Reply(replyId, commentId, accId, username, content, replyTime);
                    replies.add(reply);
                }
            }
        }
        return replies;
    }

    // hàm để lấy toàn bộ cmt, chưa lấy reply
    public static List<Comment> getAllComments(int productId) throws SQLException, Exception {

        List<Comment> comments = new ArrayList<>();

        String sql = "SELECT c.[comment_id], c.[product_id], c.[AccID], c.[comment_content], c.[comment_time],\n"
                + "r.[reply_id] AS replyId, r.[AccID] AS replyUserId, r.[reply_content] AS replyContent, r.[reply_time] AS replyTime\n"
                + "                   FROM [dbo].[Comments] c LEFT JOIN [dbo].[Replies] r ON c.[comment_id] = r.[comment_id]\n"
                + "                   WHERE c.[product_id] = ? \n"
                + "				   ORDER BY c.[comment_time] DESC, r.[reply_time] DESC";

        try ( Connection connection = DBUtils.makeConnection();  PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, productId);

            try ( ResultSet resultSet = statement.executeQuery()) {
                int currentCommentId = -1;
                Comment currentComment = null;

                while (resultSet.next()) {
                    int commentId = resultSet.getInt(1);
                    int userId = resultSet.getInt(3);
                    String username = getUserNamebyAccId(userId);
                    String content = resultSet.getString(4);
                    String time = resultSet.getString(5);

                    if (commentId != currentCommentId) {
                        currentComment = new Comment(commentId, productId, userId, username, content, time, true);
                        comments.add(currentComment);
                        currentCommentId = commentId;
                    }
                }
            }
        }
        return comments;
    }

    public static String getUserNamebyAccId(int accid) {
        Connection cn = null;
        String username = "";
        try {
            cn = DBUtils.makeConnection();

            String sql = "select [Name] from [dbo].[Account] where [AccID] = ?";

            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, accid);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    while (rs.next()) {
                        username = rs.getString(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return username;
    }
}
