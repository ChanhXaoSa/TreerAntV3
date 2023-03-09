<%-- 
    Document   : productDetail
    Created on : Feb 25, 2023, 12:01:04 AM
    Author     : tuank
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Treer.dao.PlantDAO"%>
<%@page import="Treer.dto.Plant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product details</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/product_details.css" rel="stylesheet" type="text/css">
    </head>
    <body>    
        <header><c:import url="header.jsp"></c:import></header>


            <div class="container">
                <div class="card">
                    <div class="container-fliud">
                        <div class="wrapper row">

                        <%
                            String PID = request.getParameter("PID");
                            int intPID = Integer.parseInt(PID);

                            Plant p = PlantDAO.getPlantwithPID(intPID);
                        %>

                        <div class="preview col-md-6">

                            <div class="preview-pic tab-content">
                                <div class="tab-pane active" id="pic-1"
                                     style="width: 70%;
                                     height: auto;
                                     margin-left: 20%"><img src="<%= p.getImgpath()%>" /></div>
                                <div class="tab-pane" id="pic-2"><img src="http://placekitten.com/400/252" /></div>
                                <div class="tab-pane" id="pic-3"><img src="http://placekitten.com/400/252" /></div>
                                <div class="tab-pane" id="pic-4"><img src="http://placekitten.com/400/252" /></div>
                                <div class="tab-pane" id="pic-5"><img src="http://placekitten.com/400/252" /></div>
                            </div>

                        </div>
                        <div class="details col-md-6">
                            <h3 class="product-title"><%= p.getName()%></h3>
                            <div class="rating">
                                <div class="stars">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </div>

                            </div>
                            <p class="product-description"><%= p.getDescription()%></p>
                            <h4 class="price"> 
                                <span style="text-decoration: line-through; font-size: 15px; color: gray">
                                    <%= p.getPrice() == p.getSale() ? "" : p.getPrice() + " VND"%> </span>
                                <span><%= p.getSale()%> Vnd</span>
                            </h4>
                            <i><span><%= p.getStatus() == 1 ? "Còn " + p.getStock() + " sản phẩm" : "Đã hết hàng"%></span></i>
                            <i><span><%= "Đã bán " + p.getSold() + " sản phẩm"%></span></i>
                            <h3><br></h3>
                                <%
                                    if (p.getStatus() == 1) {
                                %>    
                            <div class="action">
                                <input type="number" value="1" style="text-align: center; width: 20%">                
                                <button class="add-to-cart btn btn-default" type="button">Thêm vào giỏ hàng</button>
                                <button class="like btn btn-default" type="button"><span class="fa fa-heart"></span></button>
                            </div>
                            <%
                            } else {
                            %>
                            <div class="action">
                                <button class="add-to-cart btn btn-default" type="button">Đã hết hàng</button>
                                <button class="like btn btn-default" type="button"><span class="fa fa-heart"></span></button>
                            </div>          
                            <br>
                            <i>Vui lòng liên hệ 0394 XXX XXX để đặt hàng trước</i>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>

            <h1><br></h1>
            <h3>Sản phẩm bán chạy</h3>
            <c:import url="productpart.jsp"></c:import>
            </div>

            <footer><c:import url="footer.jsp"></c:import></footer>
    </body>
</html>
