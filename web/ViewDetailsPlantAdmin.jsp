<%-- 
    Document   : ViewDetailsPlantAdmin
    Created on : Mar 20, 2023, 10:55:51 PM
    Author     : tuank
--%>

<%@page import="Treer.dao.PlantDAO"%>
<%@page import="Treer.dto.Sale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Treer.dto.Plant"%>
<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Plants Manager Page</title>
        <link rel="stylesheet" href="css/bootstrap4.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css>" type="text/css">
        <link rel="stylesheet" href="css/styleAdmin.css" type="text/css"/>
        <link href="css/product_details.css" rel="stylesheet" type="text/css">
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
                <div class="container">
                    <div class="card">                   
                        <div class="container-fliud">
                            <div class="wrapper row">

                                <%
                                    Plant p = null;
                                    p = (Plant) request.getAttribute("PlantDetails");
                                %>

                                <div class="preview col-md-6">
                                    <div class="preview-pic tab-content">
                                        <div class="tab-pane active" id="pic-1"
                                             style="width: 70%;
                                             height: auto;
                                             margin-left: 20%"><img src="<%= p.getImgpath()%>" /></div>
                                    </div>
                                    
                                </div>
                                <div class="details col-md-6">
                                    <label>Tên sản phẩm</label>
                                    <form action="mainController?action=changePlantName" method="POST">
                                        <input type="text" name="newPlantName" value="<%= p.getName()%>">
                                        <input type="hidden" value="<%= p.getId()%>" name="plantid">
                                        <button type="submit"><i class="fa fa-save"></i></button>  
                                    </form>

                                    <label>Giá tiền</label>
                                    <form action="mainController?action=changePlantPrice" method="POST">
                                        <input type="number" value="<%= p.getPrice()%>" step=1000 name="newPrice">
                                        <input type="hidden" value="<%= p.getId()%>" name="plantid">
                                        <button type="submit"><i class="fa fa-save"></i></button>  
                                    </form>                           

                                    <label>Mô tả sản phẩm</label>
                                    <form action="mainController?action=changePlantDescription" method="POST">
                                        <textarea rows="4" cols="50" name="newDescription"><%= p.getDescription()%></textarea>
                                        <input type="hidden" value="<%= p.getId()%>" name="plantid">
                                        <button type="submit"><i class="fa fa-save"></i></button>  
                                    </form>

                                    <form action="mainController" method="post">
                                        <!-- Đoạn mã chọn ảnh -->
                                        <label for="choose-file">Chọn ảnh thay thế:</label>
                                        <input type="file" id="choose-file" name="image" required="">
                                        <br>
                                        <img id="preview" src="#" alt="" style="width: 150px; height: auto">
                                        <br>
                                        <input type="hidden" id="image-path" name="image-path" readonly>
                                        <input type="hidden" value="<%= p.getId()%>" name="plantid">
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
                                        <button value="changePlantImg" name="action" class="btn btn-danger">Lưu</button>
                                    </form>

                                    <label>Số lượng sản phẩm</label>
                                    <form action="mainController?action=changePlantStock" method="POST">
                                        <input type="number" value="<%= p.getStock()%>" name="newStock">
                                        <input type="hidden" value="<%= p.getId()%>" name="plantid">
                                        <button type="submit"><i class="fa fa-save"></i></button>  
                                    </form> 
                                        <br>
                                    <label>Giảm giá sản phẩm</label>
                                    <label style="color: red">Giảm giá hiện tại: <%= PlantDAO.getSaleByID(p.getId()) %>%</label>
                                    <form action="mainController?action=changePlantSale" method="POST">
                                        <%
                                            ArrayList<Sale> slist = null;
                                            slist = PlantDAO.printallSale();
                                        %>                    
                                        <select name="Sale">
                                            <%
                                                for (Sale sale : slist) {
                                            %>
                                            <option value="<%= sale.getSaleID()%>"><%= sale.getSalenum()%> %</option>
                                            <%
                                                }
                                            %>
                                        </select>
                                        <input type="hidden" value="<%= p.getId()%>" name="plantid">
                                        <button type="submit" ><i class="fa fa-save"></i></button>  
                                    </form> 


                                    <i><span><%= "Đã bán " + p.getSold() + " sản phẩm"%></span></i>
                                    <h3><br></h3>
                                    <form action="mainController?action=plantsManager" method="post">
                                        <button class="btn btn-primary">Về danh sách cây</button>
                                    </form>
                                </div>
                            </div>
                        </div>
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
