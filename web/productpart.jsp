<%-- 
    Document   : productpart
    Created on : Feb 26, 2023, 10:43:47 PM
    Author     : tuank
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="Treer.dao.PlantDAO"%>
<%@page import="Treer.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/blogpart.css" type="text/css">
    </head>
    <body>
        <div class="container cta-100 ">
            <div class="container">
                <div class="row blog">
                    <div class="col-md-12">
                        <div id="blogCarousel" class="carousel slide container-blog" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#blogCarousel" data-slide-to="0" class="active">1</li>
                                <li data-target="#blogCarousel" data-slide-to="1">2</li>
                            </ol>
                            <!-- Carousel items -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="row">
                                        <%
                                            ArrayList<Plant> list = PlantDAO.printHotPlant();

                                            if (list != null && !list.isEmpty()) {
                                                for (int i = 0; i < 4 && i < list.size(); i++) {
                                                    Plant p = list.get(i);
                                        %>

                                        <div class="col-md-3" >
                                            <div class="item-box-blog">
                                                <div class="item-box-blog-image">

                                                    <!--Image-->
                                                    <a href="productDetailServlet?PID=<%= p.getId()%>" class="product_thumb">
                                                        <img alt="" src="<%= p.getImgpath()%>" style="width: 100%; height: auto" >
                                                    </a>

                                                </div>
                                                <div class="item-box-blog-body">
                                                    <!--Heading-->
                                                    <div class="item-box-blog-heading">
                                                        <a href="productDetailServlet?PID=<%= p.getId()%>" tabindex="0" style="text-decoration: none" >
                                                            <h5 style="color: green;"><%= p.getName()%></h5>
                                                        </a>
                                                    </div>

                                                    <!--Text-->
                                                    <div class="item-box-blog-text">
                                                        <%
                                                            int price = p.getPrice();
                                                            int sale = p.getSale();
                                                            String formattedPrice = "";
                                                            String formattedSale = "";

                                                            NumberFormat nf = NumberFormat.getInstance();
                                                            nf.setGroupingUsed(true);
                                                            formattedPrice = nf.format(price);
                                                            formattedSale = nf.format(sale);

                                                        %>
                                                        <p style="color: red;">
                                                            <i style="text-decoration: line-through; color: gray; font-size: 14px"><%= p.getPrice() == p.getSale() ? "" : formattedPrice + " VND"%></i> 
                                                            <%= formattedSale + " VND"%>
                                                        </p>
                                                    </div>
                                                    <div class="mt"> <a href="#" tabindex="0" class="btn bg-blue-ui white read">Thêm vào giỏ hàng</a> </div>
                                                    <!--Read More Button-->
                                                </div>
                                            </div>
                                        </div>

                                        <%
                                                }
                                            }
                                        %>

                                    </div>
                                    <!--.row-->
                                </div>

                                <!--.item-->
                                <div class="carousel-item ">
                                    <div class="row">
                                        <%
                                            if (list != null && !list.isEmpty()) {
                                                for (int i = 4; i < 8 && i < list.size(); i++) {
                                                    Plant p = list.get(i);
                                        %>

                                        <div class="col-md-3" >
                                            <div class="item-box-blog">
                                                <div class="item-box-blog-image">

                                                    <!--Image-->
                                                    
                                                    <a href="productDetailServlet?PID=<%= p.getId()%>" class="product_thumb">
                                                        <img alt="" src="<%= p.getImgpath()%>" style="width: 100%; height: auto" >
                                                    </a>
                                                </div>
                                                <div class="item-box-blog-body">
                                                    <!--Heading-->
                                                    <div class="item-box-blog-heading">
                                                        <a href="productDetailServlet?PID=<%= p.getId()%>" tabindex="0" style="text-decoration: none" >
                                                            <h5 style="color: green;"><%= p.getName()%></h5>
                                                        </a>
                                                    </div>

                                                    <!--Text-->
                                                    <div class="item-box-blog-text">
                                                        <%
                                                            int price = p.getPrice();
                                                            int sale = p.getSale();
                                                            String formattedPrice = "";
                                                            String formattedSale = "";

                                                            NumberFormat nf = NumberFormat.getInstance();
                                                            nf.setGroupingUsed(true);
                                                            formattedPrice = nf.format(price);
                                                            formattedSale = nf.format(sale);

                                                        %>
                                                        <p style="color: red;">
                                                            <i style="text-decoration: line-through; color: gray; font-size: 14px"><%= p.getPrice() == p.getSale() ? "" : formattedPrice + " VND"%></i> 
                                                            <%= formattedSale + " VND"%>
                                                        </p>
                                                    </div>
                                                    <div class="mt"> <a href="#" tabindex="0" class="btn bg-blue-ui white read">Thêm vào giỏ hàng</a> </div>
                                                    <!--Read More Button-->
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                                }
                                            }
                                        %>

                                    </div>
                                    <!--.row-->
                                </div>
                                <!--.item-->
                            </div>



                            <!--.carousel-inner-->
                        </div>
                        <!--.Carousel-->
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
