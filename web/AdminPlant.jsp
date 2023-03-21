<%-- 
    Document   : AdminPlant
    Created on : Feb 27, 2023, 12:33:58 AM
    Author     : Triệu
--%>

<%@page import="Treer.dto.Sale"%>
<%@page import="Treer.dto.Categories"%>
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

                <!--Dùng để thêm cây cảnh-->         
                <button id="toggle-button" type="button">Thêm cây cảnh</button>
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

                        <label for="price">Giá tiền</label>
                        <input type="number" name="price" required=""><br><br>

                        <label for="message">Mô tả sản phẩm</label><br>
                        <textarea id="message" name="description" required=""></textarea><br><br>

                        <label>Số hàng có trong kho</label>
                        <input type="number" name="stock" required=""><br><br>


                        <label>Khuyến mãi</label>
                <%
                            ArrayList<Sale> slist = null;
                            slist = (ArrayList<Sale>) request.getAttribute("saleList");
                        %>                    
                        <select name="Sale">
                            <%
                                for (Sale sale : slist) {
                            %>
                            <option value="<%= sale.getSaleID()%>"><%= sale.getSalenum()%> %</option>
                            <%
                                }
                            %>
                        </select><br><br>

                        <label for="name">Danh mục sản phẩm</label><br>
                        <%
                            ArrayList<Categories> clist = null;
                            clist = (ArrayList<Categories>) request.getAttribute("catelist");
                            for (Categories categories : clist) {
                        %>
                        <input type="checkbox" id="sports" name="cate[]" value="<%= categories.getCateID()%>"><%= categories.getCateName()%><br>
                        <%
                            }
                        %>
                        <!-- Đoạn mã chọn ảnh -->
                        <label for="choose-file">Chọn ảnh:</label>
                        <input type="file" id="choose-file" name="image" required="">
                        <br>
                        <img id="preview" src="#" alt="Ảnh được chọn" style="width: 300px; height: auto">
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
                        <button value="addNewPlant" name="action" class="btn btn-danger">Lưu</button>
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

                <%                                    String searchOption = request.getParameter("searchOption");
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
                    ArrayList<Plant> list = null;
                    list = (ArrayList<Plant>) request.getAttribute("listplants");
                    if (list != null) {
                %>

                <h6><br></h6>
                <form action="mainController" method="post">
                    <input type="text" name="keyword" />
                    <select name="searchOption">
                        <option value="status" <%= (searchOption == null || searchOption.equals("status")) ? "selected" : ""%>>Status</option>
                        
                        <option value="id" <%= (searchOption == null || searchOption.equals("id")) ? "selected" : ""%>>ID</option>              
                        <option value="name" <%= (searchOption == null || searchOption.equals("name")) ? "selected" : ""%>>Name</option>
                    </select>
                    <button name="action" value="plantsManager">Search</button>
                </form>
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
                                        <textarea name="newPlantName" rows="1"><%= plant.getName()%></textarea>
                                        <input type="hidden" value="<%= plant.getId()%>" name="plantid">
                                        <button type="submit"><i class="fa fa-pencil"></i></button>  
                                    </form>
                                </th>
                                <th>
                                    <form action="mainController?action=changePlantPrice" method="POST">
                                        <input type="number" value="<%= plant.getPrice()%>" step=1000 name="newPrice">
                                        <input type="hidden" value="<%= plant.getId()%>" name="plantid">
                                        <button type="submit"><i class="fa fa-pencil"></i></button>  
                                    </form>
                                    
                                </th>

                                <% if (plant.getStatus() == 1) {
                                %>
                                <th>Còn Hàng</th>
                                    <%
                                    } else {
                                    %>
                                <th>Hết Hàng</th>
                                    <% }%>
                                <th>
                                    <form action="mainController?action=changePlantDescription" method="POST">
                                        <textarea rows="4" cols="50" name="newDescription"><%= plant.getDescription()%></textarea>
                                        <input type="hidden" value="<%= plant.getId()%>" name="plantid">
                                        <button type="submit"><i class="fa fa-pencil"></i></button>  
                                    </form>
                                </th>
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
