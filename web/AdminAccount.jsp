<%-- 
    Document   : AdminAccount
    Created on : Feb 26, 2023, 9:30:19 PM
    Author     : Triệu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Treer.dao.AccountDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Treer.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Account Manager Page</title>
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
                    Account acc = new Account();
                    int id = (int) session.getAttribute("id");
                    ArrayList<Account> accList = null;
                    accList = (ArrayList<Account>) request.getAttribute("accList");

                    if (name == null) {
                %>
                <h2 style="color: red">You are not login yet!</h2>
                <%
                } else if (AccountDAO.getAccountsWithAccID(id).getRoleID() == 1) {
                %>
                <h2 style="color: red">You don't have permision to enter to this url</h2>
                <%
                } else {
                %>
                <%
                    if (accList != null) {
                %>
                <% if (request.getAttribute("createSuccess") != null) {
                        request.setAttribute("createSuccess", null);
                        %>
                        <h5 style="color: red">Tạo tài khoản thành công</h5>
                <%
                    }
                %>
                <% if (request.getAttribute("confirmAccCr") == null) {
                %>
                <a href="mainController?action=confirmCreateNewAccount"><div class="btn btn-danger">Tạo tài khoản mới</div></a>
                <font style="color: red"><%= (request.getAttribute("ERROR") == null) ? "" : request.getAttribute("ERROR")%></font>
                <% request.setAttribute("ERROR", null); %>
                <%
                } else {
                    request.setAttribute("confirmAccCr", null);
                %>
                <a href="mainController?action=manageAccounts"><div class="btn btn-light">Quay lại</div></a>
                <form action="mainController?action=registerAdminPage" method="post">                   

                    <!--nhập email-->
                    <input type="text" 
                           name="txtemail" 
                           placeholder="Email"    
                           value="<%= (request.getAttribute("email") == null) ? "" : request.getAttribute("email")%>" 
                           required=""
                           />

                    <!--Nhập tên-->
                    <input type="text" 
                           name="txtname" 
                           placeholder="Tên" 
                           value="<%= (request.getAttribute("fullname") == null) ? "" : request.getAttribute("name")%>" 
                           required=""/>

                    <!--Nhập Passwords-->
                    <input type="password" 
                           name="txtpassword" 
                           placeholder="Mật Khẩu"
                           required="" 
                           />          
                    <!--nhập phone-->
                    <input type="text" 
                           name="txtphone"
                           placeholder="Số Điện Thoại"
                           value="<%= (request.getAttribute("phone") == null) ? "" : request.getAttribute("phone")%>" 
                           required="" 
                           />
                    <select name="accRole">
                        <option value="1">User</option>
                        <option value="2">Admin</option>
                    </select>
                    <!--nút regis-->
                    <input type="submit" 
                           value="Đăng Ký" 
                           />

                </form>
                <%
                    }
                    String searchOption = request.getParameter("searchOption");
                %>
                <h6><br></h6>
                <form action="mainController" method="post">
                    <input type="text" name="keyword" />
                    <select name="searchOption">
                        <option value="status" <%= (searchOption == null || searchOption.equals("status")) ? "selected" : "" %>>Status</option>
                        <option value="id" <%= (searchOption == null || searchOption.equals("id")) ? "selected" : "" %>>ID</option>              
                        <option value="email" <%= (searchOption == null || searchOption.equals("email")) ? "selected" : "" %>>Email</option>
                        <option value="role" <%= (searchOption == null || searchOption.equals("role")) ? "selected" : "" %>>Role</option>
                        <option value="name" <%= (searchOption == null || searchOption.equals("name")) ? "selected" : "" %>>Name</option>
                    </select>
                    <button name="action" value="manageAccounts">Search</button>
                </form>

                <div class="table-responsive bg-light">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Tên</th>
                                <th scope="col">Email</th>
                                <th scope="col">Mật Khẩu</th>
                                <th scope="col">Quyền</th>
                                <th scope="col">Số Điện Thoại</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col">Tình trạng</th>
                                <th scope="col">Khoá/Mở Khoá</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Account accMini : accList) {
                            %>
                            <tr>
                                <th scope="row"><%= accMini.getAccID()%></th>
                                <th><%= accMini.getName()%></th>
                                <th><%= accMini.getEmail()%></th>
                                <th><%= accMini.getPassword()%></th>
                                    <% if (accMini.getRoleID() == 1) {
                                    %>
                                <th>User</th>    
                                    <%
                                    } else {
                                    %>
                                <th>Admin</th>
                                    <% } %>
                                    <% if (accMini.getPhone() == null) {
                                    %> <th></th> <%
                                    } else {
                                    %>
                                <th><%= accMini.getPhone()%></th>
                                    <% } %>
                                    <% if (accMini.getAddress() == null) {
                                    %> <th></th> <%
                                    } else {
                                    %>
                                <th><%= accMini.getAddress()%></th>
                                    <% }%>
                                    <% if (accMini.getStatus() == 1) { %>
                                <th>Hoạt Động</th>
                                    <% } %>
                                    <% if (accMini.getStatus() == 0) { %>
                                <th>Khoá</th>
                                    <% }%>
                        <form action="mainController?action=banAccount" method="POST">
                            <input type="hidden" name="accid" value="<%= accMini.getAccID()%>">
                            <input type="hidden" name="accstatus" value="<%= accMini.getStatus()%>">
                            <th><button type="submit">
                                    <%
                                        if (accMini.getStatus() == 1) {
                                    %>Khoá<%
                                    } else {
                                    %> Mở Khoá <% } %>            
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
