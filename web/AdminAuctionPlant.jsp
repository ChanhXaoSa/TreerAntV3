<%-- 
    Document   : AdminAuctionPlant
    Created on : Mar 14, 2023, 1:45:36 PM
    Author     : Triệu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Treer.dto.AuctionPlant"%>
<%@page import="Treer.dao.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Auction Manager Page</title>
        <link rel="stylesheet" href="css/bootstrap4.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css>" type="text/css">
        <link rel="stylesheet" href="css/styleAdmin.css" type="text/css"/>

    </head>
    <body>
        <div id="page-container" class="main-admin">
            <nav class="navbar navbar-expand-lg navbar-light bg-light position-fixed w-100">
                <a class="navbar-brand" href="#"></a>
                <div id="open-menu" class="menu-bar">
                    <div class="bars"></div>
                </div>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown ets-right-0">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="img/Logo.jpg" class="img-fluid rounded-circle border user-profile">
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Profile</a>
                            <a class="dropdown-item" href="#">Change Password</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="mainController?action=logout">Logout</a>
                        </div>
                    </li>
                </ul>
            </nav>
            <div class="side-bar">
                <div class="side-bar-links">
                    <div class="side-bar-logo text-center py-3">
                        <a href="AdminIndex.jsp" >
                            <img src="img/Logo.jpg" class="img-fluid rounded-circle border bg-secoundry mb-3">
                            <h5>Treer</h5>
                        </a>
                    </div>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a href="mainController?action=backToAdminIndex" class="nav-links d-block"><i class="fa fa-home pr-2"></i> DASHBOARD</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=manageAccounts" class="nav-links d-block"><i class="fa fa-users pr-2"></i> DANH SÁCH NGƯỜI DÙNG</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=plantsManager" class="nav-links d-block"><i class="fa fa-list pr-2"></i> DANH SÁCH CÂY CẢNH</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=auctionManager" class="nav-links d-block"><i class="fa fa-balance-scale pr-2"></i> ĐẤU GIÁ</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=auctionPlantManager" class="nav-links d-block"><i class="fa fa-balance-scale pr-2"></i>CÂY CẢNH ĐẤU GIÁ</a>
                        </li>
                        <li class="nav-item">
                            <a href="index.jsp" class="nav-links d-block"><i class="fa fa-list pr-2"></i> TRANG CHỦ</a>
                        </li>
                    </ul>
                </div>
                <div class="side-bar-icons">
                    <div class="side-bar-logo text-center py-3">
                        <a href="AdminIndex.jsp" >
                            <img src="img/Logo.jpg" class="img-fluid rounded-circle border bg-secoundry mb-3">
                            <h5>Treer</h5>
                        </a>
                    </div> 
                    <div class="icons d-flex flex-column align-items-center">
                        <a href="mainController?action=backToAdminIndex" class="set-width text-center display-inline-block my-1"><i class="fa fa-home"></i></a>
                        <a href="mainController?action=manageAccounts" class="set-width text-center display-inline-block my-1"><i class="fa fa-users"></i></a>
                        <a href="mainController?action=plantsManager" class="set-width text-center display-inline-block my-1"><i class="fa fa-list"></i></a>
                    </div>
                </div>
            </div>
            <div class="main-body-content w-100 ets-pt">
                <%
                    String name = (String) session.getAttribute("name");
                    int id = (int) session.getAttribute("id");
                    if (name == null) {
                %>
                <h2 style="color: red">You are not login yet!</h2>
                <%
                } else if (AccountDAO.getAccountsWithAccID(id).getRoleID() == 1) {
                %>
                <h2 style="color: red">You don't have permision to enter to this url</h2>
                <%
                } else {
                    ArrayList<AuctionPlant> list = (ArrayList<AuctionPlant>) request.getAttribute("auctionPlantsList");
                %>
                <%
                    if (list != null) {
                %>
                <div class="table-responsive bg-light">
                    <table class="table">
                        <thead>
                            <tr>
                                <% if (request.getAttribute("chonCay") != null) {
                                %>
                                <th scope="col"></th>
                                    <%
                                        }
                                    %>
                                <th scope="col">ID</th>
                                <th scope="col">Tên</th>
                                <th scope="col">Giới thiệu</th>
                                <th scope="col">Thời gian tạo</th>
                                <th scope="col">Thời gian kết thúc</th>
                                <th scope="col">Ảnh</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (AuctionPlant auc : list) {
                            %>
                            <tr>
                                <% if (request.getAttribute("chonCay") != null) {
                                %>
                                <th scope="row">
                                    <form action="mainController?action=idAuctionPlantChoosen" method="POST">
                                        <input type="hidden" name="apID" value="<%= auc.getPlantAuctionID() %>">
                                        <button type="submit" class="btn btn-outline-danger">Chọn</button>
                                    </form>
                                </th>
                                <%
                                    }
                                %>
                                <th scope="row"><%= auc.getPlantAuctionID()%></th>
                                <th><%= auc.getPlantAuctionName()%></th>
                                <th><%= auc.getDescription()%></th>
                                <th><%= auc.getCreateDate()%></th>
                                <th><%= auc.getUpdateDate() == null ? "" : auc.getUpdateDate()%></th>
                                <th>
                                    <img src="<%= auc.getImgPath()%>" width="200px" height="200px">
                                </th>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <%
                    }
                %>

                <% }%>
                <!-- Js Plugins -->
                <script src="js/jquery-3.2.1.slim.min.js"></script>
                <script src="js/jquery-3.3.1.min.js"></script>
                <script src="js/jquery-ui.min.js"></script>
                <script src="js/jquery.nice-select.min.js"></script>
                <script src="js/jquery.slicknav.js"></script>
                <script src="js/popper.min.js"></script>
                <script src="js/bootstrap4.min.js"></script>
                <script src="js/mainAdmin.js"></script>
                </body>
                </html>
