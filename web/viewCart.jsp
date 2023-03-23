<%-- 
    Document   : viewCart
    Created on : Feb 25, 2023, 4:52:40 PM
    Author     : Ducbui
--%>

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
            <font style='color:red;'>
            <%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%>
            </font>

            <table width="100%" class="shopping col d-flex justify-content-center">
                <tr class="giua">
                    <th class="list">No</th>
                    <th class="list">Plant name</th>
                    <th class="list">Image</th>
                    <th class="list">Price</th>
                    <th class="list">Sale</th>
                    <th class="list">Price After Sale</th>
                    <th class="list">Quantity</th>
                    <th class="list">Action</th>
                    <th class="list">Cost</th>
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
                        <td class="list"><%= plant.getPrice()%></td>
                        <td class="list"><%= salePercent%></td>
                        <td class="list"><%= plant.getPrice() - plant.getPrice() * salePercent / 100%></td>
                        <td class="list"><input type="number" value="<%= quantity%>" name="quantity"></td>
                        <td class="list">
                            <input type="submit" value="update" name="action" class="nut">
                            <input type="submit" value="delete" name="action" class="nut">
                        </td>
                        <td class="list"><%= (plant.getPrice() - plant.getPrice() * salePercent / 100) * quantity%></td>
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

                %>  
                <br/>

            </table>
            <div class="bot_ma">
                <div class="bot col-md-8">
                    <h5>Thành tiền</h5>
                </div>
                <div class="bot col-md-1">
                    <%= totalmoney%> VND
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

        <!-- Footer Section -->
        <footer>        
            <c:import url="footer.jsp"></c:import>
        </footer>
        <!-- Footer Section end -->
    </body>
</html>
