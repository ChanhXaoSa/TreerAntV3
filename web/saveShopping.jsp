<%-- 
    Document   : saveShopping
    Created on : Feb 28, 2023, 1:39:47 PM
    Author     : Ducbui
--%>

<%@page import="Treer.dao.AccountDAO"%>
<%@page import="Treer.dto.Account"%>
<%@page import="Treer.dao.PlantDAO"%>
<%@page import="Treer.dto.Plant"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Treer | Thanh toán</title>
    </head>
    <body>
        <!-- Header Section Begin -->
        <header>
            <c:import url="header.jsp"></c:import>
            </header>
            <!-- Header Section End -->

        <%
            String email = (String) session.getAttribute("email");
            Account acc = AccountDAO.getAccountsByEmail(email);
        %>

        <main role="main">
            <!-- Block content - Đục lỗ trên giao diện bố cục chung, đặt tên là `content` -->
            <div class="container mt-4">
                <form class="needs-validation" method="post" action="mainController">

                    <!--                        <input type="hidden" name="kh_tendangnhap" value="dnpcuong">-->

                    <div class="py-5 text-center">
                        <i class="fa fa-credit-card fa-4x" aria-hidden="true"></i>
                        <h2>Thanh toán</h2>
                        <p class="lead">Vui lòng kiểm tra thông tin nhận hàng, phương thức thanh toán trước khi đặt hàng.</p>
                    </div>

                    <div class="row">
                        <div class="col-md-5 order-md-2 mb-4">
                            <h4 class="mb-3">Hình thức thanh toán</h4>

                            <div class="d-block my-3">
                                <div class="custom-control custom-radio">
                                    <input id="thanh-toan-the" name="thanh-toan" type="radio" class="custom-control-input" value="Card" disabled>
                                    <label class="custom-control-label" for="thanh-toan-the">Thẻ ATM</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input id="thanh-toan-truc-tuyen" name="thanh-toan" type="radio" class="custom-control-input" value="OnlinePayment" disabled>
                                    <label class="custom-control-label" for="thanh-toan-truc-tuyen">Thanh toán qua cổng thanh toán trực tuyến (Ngân Lượng)</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input id="thanh-toan-cod" name="thanh-toan" type="radio" class="custom-control-input" value="COD" checked>
                                    <label class="custom-control-label" for="thanh-toan-cod">Ship COD</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input id="thanh-toan-vi-dien-tu" name="thanh-toan" type="radio" class="custom-control-input" value="E-Walet" disabled>
                                    <label class="custom-control-label" for="thanh-toan-vi-dien-tu">Thanh toán qua ví điện tử (Momo, ZaloPay, ShopeePay, ...)</label>
                                </div>
                            </div>

                            <br>
                            <hr class="mb-4">
                            <button class="d-flex justify-content-center btn btn-success mt-5 fs-5 pl-5 pr-5" type="submit" name="action" value="thanhtoan" >Đặt hàng</button>
                        </div>

                        <div class="col-md-7">
                            <h4 class="mb-3">Thông tin khách hàng</h4>

                            <div class="row">


                                <input type="hidden" value="<%= acc.getAccID()%>" name="AccID">

                                <div class="col-md-12">
                                    <label for="kh_ten">Họ tên</label>
                                    <input type="text" class="form-control" name="kh_ten" id="kh_ten"
                                           value="<%= acc.getName()%>" require="">
                                </div>
                                <div class="col-md-12">
                                    <label for="kh_diachi">Địa chỉ</label>
                                    <input type="text" class="form-control" name="kh_diachi" id="kh_diachi"
                                           value="<%= acc.getAddress()%>" require="" >
                                </div>
                                <div class="col-md-12">
                                    <label for="kh_dienthoai">Điện thoại</label>
                                    <input type="text" class="form-control" name="kh_dienthoai" id="kh_dienthoai"
                                           value=" <%= acc.getPhone().trim() %>" require="">
                                </div>
                                <div class="col-md-12">
                                    <label for="kh_email">Email</label>
                                    <input type="text" class="form-control" name="kh_email" id="kh_email"
                                           value="<%= acc.getEmail()%>" readonly="" >
                                </div>

                            </div>
                        </div>
                    </div>

                    <font style="color: red"><%= (request.getAttribute("WARNING") == null) ? "" : request.getAttribute("WARNING")%></font>

                    <br>
                </form>
            </div>
            <!-- End block content -->
        </main>

        <!-- Footer Section -->
        <footer>        
            <c:import url="footer.jsp"></c:import>
        </footer>
        <!-- Footer Section end -->


        <!-- Optional JavaScript --> 
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/popperjs/popper.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="../assets/js/app.js"></script>
    </body>
</html>
