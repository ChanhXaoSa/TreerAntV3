<%-- 
    Document   : index
    Created on : Feb 21, 2023, 11:47:44 PM
    Author     : tuank
--%>

<%@page import="Treer.dao.PlantDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Treer.dto.Plant"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Treer</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- css style -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css>" type="text/css">
    </head>

    <body>

        <!-- Header Section Begin -->
        
            <c:import url="header.jsp"></c:import>
            
            <!-- Header Section End -->

            <!-- Main Section -->
            <main>

                <!-- Banner -->
                <img src="img/banner/banner1.jpg" class="img-fluid">             
                <div class="banner" style="margin-bottom: 8px;">
                    <div class="col-lg-12"></div>
                </div>
                <!-- Banner End -->

                <!-- Best Seller -->
                <div class="best-seller">
                    <div class="container">
                        <div class="best_selling">
                            <div class="row col-sm-12">
                                <div class="Underline">
                                    <h2 class="best-seller-title">
                                        <i class="fa fa-tree"></i>
                                        Sản phẩm bán chạy
                                    </h2>
                                </div>
                            </div>

                            <div class="row">                 

                            <%
                                ArrayList<Plant> list;
                                list = PlantDAO.printHotPlant();

                                if (list != null && !list.isEmpty()) {
                                    for (int i = 0; i < 4 && i < list.size(); i++) {
                                        Plant p = list.get(i);
                            %>

                            <div class="col-sm-3">
                                <ul class="best-seller-items">
                                    <li class="best-seller-items-detail">
                                        <div class="product_top">
                                            <a href="productDetailServlet?PID=<%= p.getId()%> " class="product_thumb">    
                                                <img src="<%= p.getImgpath()%>">  
                                            </a>
                                        </div>
                                    </li>
                                    <li class="best-seller-items-detail">
                                        <div class="product_info">
                                            <a href="productDetailServlet?PID=<%= p.getId()%> " class="product_name"><%= p.getName()%></a>
                                            <div class="product_price">
                                                <span style="text-decoration: line-through; color: gray;"><%= p.getPrice() == p.getSale() ? "" : p.getPrice() + " VND"%></span>
                                                <span style="color: red; font-weight: bold">  <%= p.getSale()%> VND</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="best-seller-items-detail">
                                        <a href="#" class="buy">Mua ngay</a><br />
                                    </li>
                                </ul>
                            </div>

                            <%
                                    }
                                }
                            %>            

                        </div>
                    </div>
                </div>
            </div>
            <!-- Best Seller End -->

            <!-- New Product -->
            <div class="best-seller">
                <div class="container">
                    <div class="best_selling">
                        <div class="row col-sm-12">
                            <div class="Underline">
                                <h2 class="best-seller-title">
                                    <i class="fa fa-tree"></i>
                                    Sản phẩm mới
                                </h2>
                            </div>
                        </div>

                        <div class="row">                 

                            <%
                                list = PlantDAO.printNewPlant();

                                if (list != null && !list.isEmpty()) {
                                    for (int i = 0; i < 4 && i < list.size(); i++) {
                                        Plant p = list.get(i);
                            %>

                            <div class="col-sm-3">
                                <ul class="best-seller-items">
                                    <li class="best-seller-items-detail">
                                        <div class="product_top">
                                            <a href="productDetailServlet?PID=<%= p.getId()%>" class="product_thumb">
                                                <img src="<%= p.getImgpath()%>" alt="hoa ban">
                                            </a>
                                        </div>
                                    </li>
                                    <li class="best-seller-items-detail">
                                        <div class="product_info">
                                            <a href="productDetailServlet?PID=<%= p.getId()%>" class="product_name"><%= p.getName()%></a>
                                            <div class="product_price">
                                                <span style="text-decoration: line-through; color: gray"><%= p.getPrice() == p.getSale() ? "" : p.getPrice() + " VND"%></span>
                                                <span style="color: red; font-weight: bold">  <%= p.getSale()%> VND</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="best-seller-items-detail">
                                        <a href="#" class="buy">Mua ngay</a><br />
                                    </li>
                                </ul>
                            </div>

                            <%
                                    }
                                }
                            %>            

                        </div>
                    </div>
                </div>
            </div>
            <!-- New Product End -->      

            <!-- Cây để bàn -->
            <div class="best-seller">
                <div class="container">
                    <div class="best_selling">
                        <div class="row col-sm-12">
                            <div class="Underline">
                                <h2 class="best-seller-title">
                                    <i class="fa fa-tree"></i>
                                    Cây để bàn
                                </h2>
                            </div>
                        </div>

                        <div class="row">                 

                            <%
                                list = PlantDAO.getPlantwithCate(1);

                                if (list != null && !list.isEmpty()) {
                                    for (int i = 0; i < 4 && i < list.size(); i++) {
                                        Plant p = list.get(i);
                            %>

                            <div class="col-sm-3">
                                <ul class="best-seller-items">
                                    <li class="best-seller-items-detail">
                                        <div class="product_top">
                                            <a href="productDetailServlet?PID=<%= p.getId()%>" class="product_thumb">
                                                <img src="<%= p.getImgpath()%>" alt="hoa ban">
                                            </a>
                                        </div>
                                    </li>
                                    <li class="best-seller-items-detail">
                                        <div class="product_info">
                                            <a href="productDetailServlet?PID=<%= p.getId()%>" class="product_name"><%= p.getName()%></a>
                                            <div class="product_price">
                                                <span style="text-decoration: line-through; color: gray"><%= p.getPrice() == p.getSale() ? "" : p.getPrice() + " VND"%></span>
                                                <span style="color: red; font-weight: bold">  <%= p.getSale()%> VND</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="best-seller-items-detail">
                                        <a href="#" class="buy">Mua ngay</a><br />
                                    </li>
                                </ul>
                            </div>

                            <%
                                    }
                                }
                            %>            

                        </div>
                    </div>
                </div>
            </div>
            <!-- Cây để bàn End -->     

            <!-- Cây dây leo -->
            <div class="best-seller">
                <div class="container">
                    <div class="best_selling">
                        <div class="row col-sm-12">
                            <div class="Underline">
                                <h2 class="best-seller-title">
                                    <i class="fa fa-tree"></i>
                                    Cây dây leo
                                </h2>
                            </div>
                        </div>

                        <div class="row">                 

                            <%
                                list = PlantDAO.getPlantwithCate(4);

                                if (list != null && !list.isEmpty()) {
                                    for (int i = 0; i < 4 && i < list.size(); i++) {
                                        Plant p = list.get(i);
                            %>

                            <div class="col-sm-3">
                                <ul class="best-seller-items">
                                    <li class="best-seller-items-detail">
                                        <div class="product_top">
                                            <a href="productDetailServlet?PID=<%= p.getId()%>" class="product_thumb">
                                                <img src="<%= p.getImgpath()%>" alt="hoa ban">
                                            </a>
                                        </div>
                                    </li>
                                    <li class="best-seller-items-detail">
                                        <div class="product_info">
                                            <a href="productDetailServlet?PID=<%= p.getId()%>" class="product_name"><%= p.getName()%></a>
                                            <div class="product_price">
                                                <span style="text-decoration: line-through; color: gray"><%= p.getPrice() == p.getSale() ? "" : p.getPrice() + " VND"%></span>
                                                <span style="color: red; font-weight: bold">  <%= p.getSale()%> VND</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="best-seller-items-detail">
                                        <a href="#" class="buy">Mua ngay</a><br />
                                    </li>
                                </ul>
                            </div>

                            <%
                                    }
                                }
                            %>            

                        </div>
                    </div>
                </div>
            </div>
            <!-- Cây dây leo End -->

            <!-- Tin tức -->
            <div class="best-seller" style="margin-top: 20px">
                <div class="container">
                    <div class="best_selling">
                        <div class="row col-sm-12">
                            <div class="Underline">
                                <h2 class="best-seller-title">
                                    <i class="fa fa-tree"></i>
                                    Tin tức
                                </h2>
                            </div>
                        </div>

                        <div class="row">                 

                            <c:import url="blogpart.jsp"></c:import>         

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Tin tức End ->
    
                </main>
                <!-- Main Section End -->


                <!-- Footer Section -->
                <footer>        
                <c:import url="footer.jsp"></c:import>
            </footer>
            <!-- Footer Section end -->

            <!-- Js Plugins -->

            <script src="js/bootstrap.min.js"></script>
            <script src="js/jquery-3.3.1.min.js"></script>
            <script src="js/jquery-ui.min.js"></script>
            <script src="js/jquery.nice-select.min.js"></script>
            <script src="js/jquery.slicknav.js"></script>
            <script src="js/main.js"></script>

    </body>
</html>
