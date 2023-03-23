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
                            <a href="mainController?action=ordersManager" class="nav-links d-block"><i class="fa fa-list pr-2"></i> DANH SÁCH ĐƠN HÀNG</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=auctionManager" class="nav-links d-block"><i class="fa fa-balance-scale pr-2"></i> ĐẤU GIÁ</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=auctionPlantManager" class="nav-links d-block"><i class="fa fa-balance-scale pr-2"></i>CÂY CẢNH ĐẤU GIÁ</a>
                        </li>
                        <li class="nav-item">
                            <a href="index.jsp" class="nav-links d-block"><i class="fa fa-home"></i> TRANG CHỦ</a>
                        </li>
                    </ul>
                    <li class="nav-item">
                            <a href="mainController?action=logout" class="nav-links d-block"><i class="fa fa-arrow-left"></i> ĐĂNG XUẤT</a>
                        </li>
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

                <!--Phần thêm cây cảnh đấu giá-->    
                <button id="toggle-button" type="button" style="margin-left: 20px" class="btn btn-primary">Thêm cây cảnh</button>
                <style>
                    #form-container {
                        display: none;
                    }
                </style>
                <div id="form-container" style="margin-left: 5%" enctype="multipart/form-data">
                    <form action="mainController" method="post">
                        <br>
                        <label for="name">Tên cây cảnh</label>
                        <input type="text" name="nameplant" required=""><br><br>

                        <label for="description">Giới thiệu</label>
                        <input type="text" name="description" required=""><br><br>

                        <!-- Đoạn mã chọn ảnh -->
                        <label for="choose-file">Chọn ảnh:</label>
                        <input type="file" id="choose-file" name="image" required="">
                        <br>
                        <img id="preview" src="#" alt="" style="width: 300px; height: auto">
                        <br>
                        <label for="image-path">Đường dẫn ảnh:</label>
                        <input type="text" id="image-path" name="image-path" readonly>
                        <br>
                        <script>
                            const chooseFile = document.getElementById("choose-file");
                            const preview = document.getElementById("preview");
                            const imagePath = document.getElementById("image-path");

                            chooseFile.addEventListener("change", function () {
                                const file = this.files[0];
                                if (file) {
                                    const reader = new FileReader();
                                    reader.addEventListener("load", function () {
                                        preview.setAttribute("src", this.result);
                                    });
                                    reader.readAsDataURL(file);
                                    imagePath.value = URL.createObjectURL(file);
                                }
                            });
                        </script>
                        <br>
                        <button value="addNewPlantAuction" name="action" class="btn btn-danger">Lưu</button>
                    </form>
                    <script>
                        const toggleButton = document.getElementById("toggle-button");
                        const formContainer = document.getElementById("form-container");

                        toggleButton.addEventListener("click", function () {
                            if (formContainer.style.display === "none") {
                                formContainer.style.display = "block";
                            } else {
                                formContainer.style.display = "none";
                            }
                        });
                    </script>
                </div>
                <h4 style="color: red">${MSG==null?"":MSG}</h4>
                
                <!--Phần thêm cây cảnh đấu giá - END-->


                <%
                    String searchOption = request.getParameter("searchOption");
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

                <!--Phần này để tìm kiếm cây cảnh-->
                <form action="mainController" method="post" style="margin-left: 20px">
                    <input type="text" name="keyword" />
                    <select name="searchOption">
                        <option value="id" <%= (searchOption == null || searchOption.equals("id")) ? "selected" : ""%>>ID</option>              
                        <option value="name" <%= (searchOption == null || searchOption.equals("name")) ? "selected" : ""%>>Name</option>
                    </select>
                    <button name="action" value="plantsAuctionManager" class="btn btn-primary">Search</button>
                </form>
                    
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
