<%-- 
    Document   : replyCustService
    Created on : Mar 12, 2023, 1:16:01 PM
    Author     : Ducbui
--%>

<%@page import="Treer.dao.CusServiceDAO"%>
<%@page import="Treer.dto.CusService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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
                            <a href="mainController?action=auctionManager" class="nav-links d-block"><i class="fa fa-balance-scale pr-2"></i> ĐẤU GIÁ</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=viewCSKH" class="nav-links d-block"><i class="fa-solid fa-comments pr-2"></i> CHĂM SÓC KHÁCH HÀNG</a>
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
                <div class="table-responsive bg-light">
                    <%
                        String CustSerID = request.getParameter("CustSerID");

                        CusService cusService = CusServiceDAO.getCusServiceByCustSerID(Integer.parseInt(CustSerID.trim()));

                        String CustEmail = cusService.getCustEmail();
                        String CusTitle = cusService.getTitle();
                        String Title = "Reply: " + CusTitle;
                    %>

                    <form action="mainController" method="POST">
                        <table class="table">
                            <tr>
                                <td>Receiver</td>
                                <td><input  class="nhap" type="text" name="CusName" value="<%= cusService.getCusName()%>" readonly="" /></td>
                            </tr>
                            <tr>
                                <td>Receiver's email</td>
                                <td class="nhapnd"><input class="nhap" type="text" name="emailReceiver" value="<%= CustEmail%>" readonly="" /></td>
                            </tr>
                            <tr>
                                <td>Title</td>
                                <td class="nhapnd"><input class="nhap" type="text" name="title" value="<%= Title%>" readonly="" /></td>
                            </tr>
                            <tr>
                                <td>Content</td>
                                <td class="nhapnd"><textarea class="nhap" type="text" name="content" placeholder="Nhập nội dung..." required=""></textarea></td>                          
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <input type="hidden" name="CustSerID" value="<%= CustSerID%>" />
                                    <a href="viewCSKH.jsp">Quay về trang xem CSKH</a>
                                    <button type="submit" name="action" value="replyCusService" class="btn btn-danger">Gửi reply</button>
                                </td>
                            </tr>
                            <%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%>
                        </table>
                    </form>
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
