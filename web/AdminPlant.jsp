<%-- 
    Document   : AdminPlant
    Created on : Feb 27, 2023, 12:33:58 AM
    Author     : Triệu
--%>

<%@page import="Treer.dao.AccountDAO"%>
<%@page import="Treer.dao.PlantDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Treer.dto.Plant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Plants Manager Page</title>
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
                    ArrayList<Plant> list = PlantDAO.printAllPlantsAdmin();
                %>
                <%
                    if (list != null) {
                %>
                <div class="table-responsive bg-light">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Tên</th>
                                <th scope="col">Giá</th>

                                <th scope="col">Tình Trạng</th>
                                <th scope="col">Giới Thiệu</th>
                                <th scope="col">Thời Gian Tạo</th>
                                <th scope="col">Thời Gian Cập Nhật</th>
                                <th scope="col">Thay Đổi Tình Trạng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Plant plant : list) {
                            %>
                            <tr>
                                <th scope="row"><%= plant.getId()%></th>
                                <th>
                                    <form action="mainController?action=changePlantName" method="POST">
                                        <input type="text" value="<%= plant.getName()%>" name="newPlantName">
                                        <input type="hidden" value="<%= plant.getId() %>" name="plantid">
                                        <button type="submit"><i class="fa fa-pencil"></i></button>  
                                    </form>
                                </th>
                                <th><input type="number" value="<%= plant.getPrice()%>"></th>

                                <% if (plant.getStatus() == 1) {
                                %>
                                <th>Còn Hàng</th>
                                    <%
                                    } else {
                                    %>
                                <th>Hết Hàng</th>
                                    <% }%>
                                <th><input type="text" value="<%= plant.getDescription()%>"></th>
                                <th><%= plant.getCreatedate()%></th>
                                    <%
                                        if (plant.getUpdatedate() != null) {
                                    %>
                                <th><%= plant.getUpdatedate()%></th>
                                    <%
                                    } else {
                                    %>
                                <th></th>
                                    <% }%>
                        <form action="mainController?action=changeStatusPlant" method="POST">
                            <input type="hidden" name="plantid" value="<%= plant.getId()%>">
                            <input type="hidden" name="plantstatus" value="<%= plant.getStatus()%>">
                            <th><button type="submit">
                                    Thay Đổi Tình Trạng           
                                </button></th>
                        </form>
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
            </div>
        </div>
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
