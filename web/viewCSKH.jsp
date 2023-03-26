<%-- 
    Document   : viewCSKH
    Created on : Mar 11, 2023, 11:50:08 PM
    Author     : Ducbui
--%>

<%@page import="Treer.dao.CusServiceDAO"%>
<%@page import="Treer.dto.CusService"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Treer | Chăm sóc khách hàng</title>

        <!-- css style -->
        <link rel="stylesheet" href="css/jquery-ui.min.css>" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/bootstrap4.min.css" type="text/css">
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
                            <a href="mainController?action=ordersManager" class="nav-links d-block"><i class="fa fa-list pr-2"></i> DANH SÁCH ĐƠN HÀNG</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=auctionManager" class="nav-links d-block"><i class="fa fa-balance-scale pr-2"></i> ĐẤU GIÁ</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=auctionPlantManager" class="nav-links d-block"><i class="fa fa-balance-scale pr-2"></i>CÂY CẢNH ĐẤU GIÁ</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=viewCSKH" class="nav-links d-block"><i class="fa fa-comments pr-2"></i> CHĂM SÓC KHÁCH HÀNG</a>
                        </li>
                        <li class="nav-item">
                            <a href="index.jsp" class="nav-links d-block"><i class="fa fa-home"></i> TRANG CHỦ</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=logout" class="nav-links d-block"><i class="fa fa-arrow-left"></i> ĐĂNG XUẤT</a>
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
                <div class="table-responsive bg-light">
                    <li style="list-style-type: none;">
                        <form action="mainController" method="post" class="#">
                            <input type="text" name="txtsearch" value="<%= (request.getParameter("txtsearch") == null) ? "" : request.getParameter("txtsearch")%>" />
                            <select name="searchby">
                                <option value="Email">Email</option>
                                <option value="Title">Title</option>
                                <option value="Date">Date</option>
                                <option value="Status">Status</option>
                            </select>
                            <button type="submit" name="action" value="custServiceSearch" class="btn btn-danger">Tra cứu</button>
                        </form>
                    </li>

                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Email</th>
                                <th scope="col">Tên người gửi</th>
                                <th scope="col">Ngày nhận</th>
                                <th scope="col">Ngày trả lời</th>
                                <th scope="col">Chủ đề</th>
                                <th scope="col">Nội dung</th>
                                <th scope="col">Nội dung trả lời</th>
                                <th scope="col">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String keyword = request.getParameter("txtsearch");
                                String searchby = request.getParameter("searchby");

                                ArrayList<CusService> list;
                                if (keyword == null && searchby == null) //when the page loaded all products will be displayed
                                {
                                    list = CusServiceDAO.getAllCusService("", "Email");
                                } else {
                                    list = CusServiceDAO.getAllCusService(keyword, searchby); //Only get Customer Service by Email/Title/Status/Date_receive
                                }
                                if (list != null && !list.isEmpty()) {
                                    int i = 0;
                                    for (CusService custService : list) {
                            %>
                            <tr>
                                <td><%= ++i%></td>
                                <td>
                                    <a href="mainController?action=replyCustService&CustSerID=<%= custService.getCustSerID()%> ">
                                        <%= custService.getCustEmail()%>
                                    </a>
                                </td>
                                <td><%= custService.getCusName()%></td>
                                <td><%= custService.getDate_receive()%></td>
                                <td><%= (custService.getDate_response() == null) ? "" : custService.getDate_response()%></td>
                                <td><%= custService.getTitle()%></td>
                                <td><%= custService.getContent()%></td>
                                <td><%= (custService.getReplyContent() == null) ? "" : custService.getReplyContent()%></td>
                                <td><input type="checkbox" <%= (custService.getStatus() == 1) ? "checked" : ""%> disabled="true" /></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

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
