<%-- 
    Document   : editProfile
    Created on : Mar 4, 2023, 1:39:47 AM
    Author     : tuank
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.Date"%>
<%@page import="Treer.dao.AccountDAO"%>
<%@page import="Treer.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit profile</title>
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>

    <body>

        <div class="well">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#home" data-toggle="tab">Thay đổi thông tin cá nhân</a></li>           
            </ul>

            <%
                String email = (String) session.getAttribute("email");

                Account acc = AccountDAO.getAccountsByEmail(email);
            %>

            <div id="myTabContent" class="tab-content">
                <div class="tab-pane active in" id="home">
                    <form id="tab" action="mainController" method="post">
                        <label>Tên tài khoản</label>
                        <input type="text"  name="txtusername" value="<%= acc.getName()%>" required="">

                        <label>Mật khẩu</label>
                        <input type="password" name="txtpassword"  value="<%= acc.getPassword()%>" required="">
                        <button style="margin-bottom: 10px" type="button" onclick="togglePasswordVisibility()" class="btn btn-primary">Hiển thị</button>

                        <label>Số điện thoại</label>
                        <input type="text"  name="txtphone" value="<%= acc.getPhone()%>"  required="">
                        <label>Địa chỉ</label>
                        <input type="text"  name="txtaddress" value="<%= acc.getAddress()%>"  required="">
                        <div>
                            <button class="btn btn-primary" value="Profile" name="action">Quay về</button>
                            <button class="btn btn-primary" value="updateProfile" name="action">Cập nhật</button>

                        </div>
                        <br>
                        <h4 style="color: red">${Mess}</h4>
                    </form>
                </div>
            </div>

            <script>
                function togglePasswordVisibility() {
                    var passwordInput = document.getElementsByName("txtpassword")[0];
                    if (passwordInput.type === "password") {
                        passwordInput.type = "text";
                    } else {
                        passwordInput.type = "password";
                    }
                }
            </script>
    </body>
</html>
