<%-- 
    Document   : ProfilePage
    Created on : Mar 4, 2023, 12:17:44 AM
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
        <title>Profile</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="css/profile.css" rel="stylesheet" id="bootstrap-css">
    </head>
        <body>
            <c:import url="personalheader.jsp"></c:import>
            
            <div class="container">
                <div class="row" style="margin-top: 10%">
                    <div class="col-md-5  toppad  pull-right col-md-offset-3 ">                
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1 toppad" >

                    <%
                        String email = (String) session.getAttribute("email");

                        Account acc = AccountDAO.getAccountsByEmail(email);

                    %>

                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title"> <%= acc.getName()%> </h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="img/Logo.jpg" class="img-circle img-responsive"> </div>

                                <div class=" col-md-9 col-lg-9 "> 
                                    <table class="table table-user-information">
                                        <tbody>
                                            <tr>
                                                <td>Email</td>
                                                <td><%= acc.getEmail()%></td>
                                            </tr>
                                            <tr>
                                                <td>Số điện thoại</td>
                                                <td><%= acc.getPhone() == null ? "" : acc.getPhone()%></td>
                                            </tr>
                                            <tr>
                                                <td>Địa chỉ</td>
                                                <td><%= acc.getAddress() == null ? "" : acc.getAddress()%></td>
                                            </tr>

                                            <tr>
                                            <tr>
                                                <td>Ngày tạo tài khoản</td>
                                                <td><%= acc.getCreateDate() == null ? "" : acc.getCreateDate()%></td>
                                            </tr>
                                            <tr>
                                                <td>Sửa đổi gần đây</td>
                                                <td><%= acc.getUpdateDate() == null ? "" : acc.getUpdateDate()%></td>
                                            </tr>
                                            <tr>
                                                <td>Email</td>
                                                <td><a href="<%= acc.getEmail()%>"><%= acc.getEmail()%></a></td>
                                            </tr>

                                            </tr>

                                        </tbody>
                                    </table>

                                    <!--                                    <a href="#" class="btn btn-primary">Đổi ảnh đại diện</a>
                                                                        <a href="#" class="btn btn-primary">Team Sales Performance</a>-->
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <a href="mainController?action=personalPage" class="btn btn-primary" style="font-size: 18px">VỀ TRANG CÁ NHÂN</a>
                            <span class="pull-right">
                                <a href="mainController?action=editProfile" style="font-size: 18px" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                                <a data-original-title="Remove this user" style="font-size: 18px" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                            </span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>

    <style>
        .panel-body {
            font-size: 16px;
            padding: 20px;
        }

        .table-user-information td {
            font-size: 16px;
            padding: 10px;
        }

        .img-circle {
            width: 300px;
            height: auto;
        }
    </style>

    <script>
        $(document).ready(function () {
            var panels = $('.user-infos');
            var panelsButton = $('.dropdown-user');
            panels.hide();

            //Click dropdown
            panelsButton.click(function () {
                //get data-for attribute
                var dataFor = $(this).attr('data-for');
                var idFor = $(dataFor);

                //current button
                var currentButton = $(this);
                idFor.slideToggle(400, function () {
                    //Completed slidetoggle
                    if (idFor.is(':visible'))
                    {
                        currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
                    } else
                    {
                        currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
                    }
                })
            });


            $('[data-toggle="tooltip"]').tooltip();

            $('button').click(function (e) {
                e.preventDefault();
                alert("This is a demo.\n :-)");
            });
        });
    </script>

</html>
