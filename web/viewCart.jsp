<%-- 
    Document   : viewCart
    Created on : Feb 25, 2023, 4:52:40 PM
    Author     : Ducbui
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Treer.dao.PlantDAO"%>
<%@page import="Treer.dto.Plant"%>
<%@page import="Treer.dto.Plant"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Treer | Giỏ hàng</title>

        <link rel="stylesheet" href="path/to/font-awesome/css/all.min.css">
        <link rel="stylesheet" href="css/viewCart.css"/>
    </head>
    <body>
        <!-- Header Section Begin -->
        <header>
            <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-chevron-up"></i></button>   

            <c:import url="header.jsp"></c:import>
            </header>
            <div class="container">
                <!-- Header Section End -->

                <!-- Main Section -->
                <section id="all">
                <%
                    String name = (String) session.getAttribute("name");
                    if (name != null) {
                %>
                <%
                    }
                %>


                <table width="100%" class="shopping col d-flex justify-content-center">
                    <tr class="giua">
                        <th class="list">Stt</th>
                        <th class="list">Tên</th>
                        <th class="list">Hình ảnh</th>
                        <th class="list">Giá</th>
                        <th class="list">Giảm giá</th>
                        <th class="list">Giá cuối</th>
                        <th class="list">Số lượng</th>
                        <th class="list">Hành động</th>
                        <th class="list">Tổng</th>
                    </tr>
                    <%
                        HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
                        int totalmoney = 0;
                        int i = 0;
                        if (cart != null) {
                            for (String pid : cart.keySet()) {
                                int quantity = cart.get(pid);
                                Plant plant = PlantDAO.getPlantByPID(Integer.parseInt(pid.trim()));
                                int salePercent = PlantDAO.getSaleByID(Integer.parseInt(pid.trim()));
                                totalmoney = totalmoney + ((plant.getPrice() - plant.getPrice() * salePercent / 100) * quantity);
                                int price = plant.getPrice();
                                int sale = plant.getSale();
                                String formattedPrice = "";
                                String formattedSalePrice = "";
                                String formattedTotalPrice = "";

                                NumberFormat nf = NumberFormat.getInstance();
                                nf.setGroupingUsed(true);
                                formattedPrice = nf.format(price);
                                formattedSalePrice = nf.format(plant.getPrice() - plant.getPrice() * salePercent / 100);
                                formattedTotalPrice = nf.format((plant.getPrice() - plant.getPrice() * salePercent / 100) * quantity);
                    %>
                    <form action="mainController" method="post" class="list">
                        <tr class="list">
                            <td class="list"><input type="hidden" name="PID" value="<%= pid%>" /><%= ++i%></td>
                            <td class="list"><a class="linkten" href="productDetail.jsp?PID=<%= pid%>"><%= plant.getName()%></a></td>
                            <td class="list">
                                <a href="productDetail.jsp?PID=<%= pid%>" style="width: 60px; height: 80px">
                                    <img src="<%= plant.getImgpath()%>" class="imagePlant">
                                </a>
                            </td>
                            <td class="list"><%= formattedPrice%>đ</td>
                            <td class="list"><%= salePercent%> %</td>
                            <td class="list"><%= formattedSalePrice%>đ</td>
                            <td class="list"><input type="number" value="<%= quantity%>" name="quantity"></td>
                            <td class="list">
                                <button type="submit" value="update" name="action" class="nut btn btn-info" style="color: #fff; font-weight: 500;">Cập nhật</button>
                                <button type="submit" value="delete" name="action" class="nut btn btn-info mt-2" style="color: #fff; font-weight: 500; padding: 5.5px 30px;">Xoá</button>
                            </td>
                            <td class="list" style="font-weight: 500;"><%= formattedTotalPrice%>đ</td>
                        </tr>
                    </form>

                    <!--            </table>
                    
                                <table class="total col d-flex justify-content-center">-->
                    <%
                        }
                    } else {
                    %> 
                    <tr>Your cart is empty!!</tr> 
                    <%
                        }
                        session.setAttribute("totalmoney", totalmoney);
                        NumberFormat nf = NumberFormat.getInstance();
                        nf.setGroupingUsed(true);
                        String formattedTotalMoney = "";
                        formattedTotalMoney = nf.format(totalmoney);
                    %>  
                    <br/>

                </table>
                <div class="bot_ma">
                    <div class="bot col-md-8">
                        <h5>Thành tiền</h5>
                    </div>
                    <div class="bot col-md-2" style="font-weight: 600; font-size: 25px;">
                        <%= formattedTotalMoney %> đ
                    </div>
                </div>
                <form action="mainController" method="post">
                    <div style="display: flex; text-align: center">
                        <div class="col-md-6">
                            <button class="muatiep">
                                <a href="index.jsp">< Tiếp tục mua hàng</a>
                            </button>
                        </div>
                        <div class="col-md-6">
                            <button class="submitorder" type="submit" name="action" value="muahang" >Tiến hành thanh toán</button>
                        </div>
                    </div>
                </form>
            </section>


            <!-- Main Section End -->
        </div>
        <!-- Footer Section -->
        <footer>        
            <c:import url="footer.jsp"></c:import>
        </footer>
        <!-- Footer Section end -->
    </body>
</html>
