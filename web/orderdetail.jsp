<%-- 
    Document   : orderdetail
    Created on : Mar 1, 2023, 11:28:22 PM
    Author     : tuank
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="Treer.dto.OrderDetail"%>
<%@page import="Treer.dao.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order details</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="row p-5">
                                <div class="col-md-6">
                                    <img src="img/Logo.jpg" height="150">
                                </div>

                                <div class="col-md-6 text-right">
                                    <a href="mainController?action=personalPage" 
                                       class="btn btn-success p-3 font-weight-bold">Về trang cá nhân</a>
                                </div>
                            </div>



                            <div class="row p-5">
                                <div class="col-md-12">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="border-0 text-uppercase small font-weight-bold">Tên</th>
                                                <th class="border-0 text-uppercase small font-weight-bold">Hình ảnh</th>
                                                <th class="border-0 text-uppercase small font-weight-bold">Giá tiền</th>
                                                <th class="border-0 text-uppercase small font-weight-bold">Số lượng</th>
                                                <th class="border-0 text-uppercase small font-weight-bold">Tổng</th>
                                            </tr>
                                        </thead>
                                        <tbody>                                       
                                            <%
                                                String orderID = request.getParameter("OID");
                                                int orderidnumber = Integer.parseInt(orderID);
                                                ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderidnumber);
                                                int total = 0;

                                                NumberFormat nf = NumberFormat.getInstance();
                                                nf.setGroupingUsed(true);

                                                String formattedPrice = "";
                                                String formattedPlantTotal = "";
                                                String formattedTotal = "";

                                                for (OrderDetail o : list) {
                                            %>
                                            <tr>

                                                <td>
                                                    <a href="productDetailServlet?PID=<%= o.getPlantID()%>" style="text-decoration: none; color: black; font-weight: 500">
                                                        <%= o.getPlantName()%>
                                                    </a>
                                                </td>
                                                <td> 
                                                    <a href="productDetailServlet?PID=<%= o.getPlantID()%>" >
                                                        <img style="width: 100px; height: auto" src="<%= o.getImgPath()%>"> 
                                                    </a>
                                                </td>

                                                <%
                                                    int price = o.getPrice();
                                                    int plantTotal = o.getPrice() * o.getQuantity();

                                                    formattedPrice = nf.format(price);
                                                    formattedPlantTotal = nf.format(plantTotal);
                                                %>
                                                <td><%= formattedPrice%>VND</td>
                                                <td><%= o.getQuantity()%></td>
                                                <td><%= formattedPlantTotal%>VND</td>
                                            </tr>
                                            <%

                                                    total = total + o.getPrice() * o.getQuantity();
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="d-flex flex-row-reverse bg-dark text-white p-2">

                                <% formattedTotal = nf.format(total);%>

                                <div class="py-3 px-5 text-right">
                                    <div class="h2 font-weight-normal mr-5">Tổng : <%= formattedTotal%>VND</div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </body>
</html>
