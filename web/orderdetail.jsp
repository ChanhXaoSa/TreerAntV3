<%-- 
    Document   : orderdetail
    Created on : Mar 1, 2023, 11:28:22 PM
    Author     : tuank
--%>

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
                                    <img src="http://via.placeholder.com/400x90?text=logo">
                                </div>

                                <div class="col-md-6 text-right">
                                    <p class="font-weight-bold mb-1">Invoice #550</p>
                                    <p class="text-muted">Due to: 4 Dec, 2019</p>
                                </div>
                            </div>

                            

                            <div class="row p-5">
                                <div class="col-md-12">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="border-0 text-uppercase small font-weight-bold">Mã cây</th>
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
                                                for (OrderDetail o : list) {
                                            %>
                                            <tr>
                                                <td><%= o.getPlantID()%></td>
                                                <td><%= o.getPlantName()%></td>
                                                <td> <img style="width: 100px; height: auto" src="<%= o.getImgPath()%>"> </td>
                                                <td><%= o.getPrice()%></td>
                                                <td><%= o.getQuantity()%></td>
                                                <td><%= o.getPrice() * o.getQuantity()%></td>
                                            </tr>
                                            <%

                                                    total = total + o.getPrice() * o.getQuantity();
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="d-flex flex-row-reverse bg-dark text-white p-4">
                                
                                <div class="py-3 px-5 text-right">
                                    <div class="mb-2">Thanh toán</div>
                                    <div class="h2 font-weight-light"><%=total%></div>
                                </div>

                                <div class="py-3 px-5 text-right">
                                    <div class="mb-2">Mã giảm giá</div>
                                    <div class="h2 font-weight-light">0</div>
                                </div>

                                <div class="py-3 px-5 text-right">
                                    <div class="mb-2">Tống cộng</div>
                                    <div class="h2 font-weight-light"><%=total%></div>
                                </div>
                                
                                <div class="py-3 px-5 text-right" style="margin-right: 100px ;">
                                    <div class="mb-2"></div>
                                    <div class="h2 font-weight-light"><a style="color: white" href="mainController?action=personalPage">Về trang cá nhân</a></div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-light mt-5 mb-5 text-center small">by : <a class="text-light" target="_blank" href="http://totoprayogo.com">totoprayogo.com</a></div>

        </div>
    </body>
</html>
