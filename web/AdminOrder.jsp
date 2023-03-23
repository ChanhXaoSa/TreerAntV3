<%-- 
    Document   : AdminOrder
    Created on : Mar 22, 2023, 1:08:59 AM
    Author     : tuank
--%>

<%@page import="Treer.dto.OrderDetail"%>
<%@page import="Treer.dao.OrderDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="Treer.dto.Order"%>
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
        <title>Admin Orders Manager Page</title>
        <link rel="stylesheet" href="css/bootstrap4.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css>" type="text/css">
        <link rel="stylesheet" href="css/styleAdmin.css" type="text/css"/>
    </head>

    <body>
        <%
            String name = (String) session.getAttribute("name");
            if (name == null) {
        %>
        <h2 style="color: red">You are not login yet!</h2>
        <%
        } else {
        %>
        <div id="page-container" class="main-admin">
            <nav class="navbar navbar-expand-lg navbar-light bg-light position-fixed w-100">
                <a class="navbar-brand" href="#"></a>
                <div id="open-menu" class="menu-bar">
                    <div class="bars"></div>
                </div>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown ets-right-0">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="" class="img-fluid rounded-circle border user-profile">
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Thông tin tài khoản</a>
                            <a class="dropdown-item" href="#">Cài đặt</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="mainController?action=logout">Đăng xuất</a>
                        </div>
                    </li>
                </ul>
            </nav>
            <div class="side-bar">
                <div class="side-bar-links">
                    <div class="side-bar-logo text-center py-3">
                        <img src="" class="img-fluid rounded-circle border bg-secoundry mb-3">
                        <h5>${name}</h5>
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
                            <a href="mainController?action=ordersManager" class="nav-links d-block"><i class="fa fa-list pr-2"></i> DANH SÁCH ĐƠN HÀNG</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=auctionManager" class="nav-links d-block"><i class="fa fa-balance-scale pr-2"></i> ĐẤU GIÁ</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=auctionPlantManager" class="nav-links d-block"><i class="fa fa-balance-scale pr-2"></i>CÂY CẢNH ĐẤU GIÁ</a>
                        </li>
                        <li class="nav-item">
                            <a href="index.jsp" class="nav-links d-block"><i class="fa fa-home"></i> TRANG CHỦ</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=logout" class="nav-links d-block"><i class="fa fa-arrow-left"></i> ĐĂNG XUẤT</a>
                        </li>
                    </ul>
                </div>
                <div class="side-bar-icons">
                    <!-- <div class="side-bar-logo text-center py-3">
                            <img src="" class="img-fluid rounded-circle border bg-secoundry mb-3">
                            <h5>Company Name</h5>
                    </div> -->
                    <div class="icons d-flex flex-column align-items-center">
                        <a href="mainController?action=personalPage" class="set-width text-center display-inline-block my-1"><i class="fa fa-list"></i></a>
                        <a href="mainController?action=Profile" class="set-width text-center display-inline-block my-1"><i class="fa fa-user"></i></a>
                    </div>
                </div>
            </div>
            <div class="main-body-content w-100 ets-pt">
                <h1 style="margin-left: 20px">Bảng đơn hàng</h1>
                <div class="table-responsive bg-light">

                    <%
                        int accid = (int) session.getAttribute("accid");
                        String button = (String) session.getAttribute("selectedOption");
                        String from = request.getParameter("from");
                        String to = request.getParameter("to");

                        String[] status = {"", "Chờ xác nhận", "Đã giao", "Đã hủy"};
                    %>

                    <form action="mainController?action=filterOrderAdmin" method="post" style="margin-left: 30px">
                        <select name="button">
                            <option  value="completed" <%= (button == null || button.equals("completed")) ? "selected" : ""%>>Đã giao</option>
                            <option  value="confirm" <%= (button == null || button.equals("confirm")) ? "selected" : ""%>>Chờ xác nhận</option>
                            <option  value="cancel" <%= (button == null || button.equals("cancel")) ? "selected" : ""%>>Đã hủy</option>
                            <option  value="all" <%= (button == null || button.equals("all")) ? "selected" : ""%>>Tất cả</option>
                        </select> 

                        <label>từ ngày</label>  
                        <input type="date" name="from" value="<%= from%>">
                        <label>đến ngày</label>
                        <input type="date" name="to" value="<%= to%>">
                        <button type="submit" name="action" id="myButton">Xem đơn hàng</button> 
                    </form>

                    <table class="table">
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Người đặt</th>
                            <th>Ngày đặt</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                        </tr>
                        <%

                            ArrayList<Order> list;
                            String formattedTotal = "";
                            list = (ArrayList<Order>) request.getAttribute("OrdersList");
                            for (Order order : list) {
                                int total = 0;
                        %>
                        <tr>
                            <th><%= order.getOrderID()%></th>
                            <th><%= AccountDAO.getAccountNameByID(order.getAccID()) %></th>
                            <th><%= order.getOrderdate()%></th>
                                <%
                                    ArrayList<OrderDetail> Orderlist = OrderDAO.getOrderDetail(order.getOrderID());
                                    for (OrderDetail o : Orderlist) {
                                        int plantTotal = o.getPrice() * o.getQuantity();
                                        total = total + o.getPrice() * o.getQuantity();
                                    }
                                    NumberFormat nf = NumberFormat.getInstance();

                                    formattedTotal = nf.format(total);%>                   
                            <th><%= formattedTotal%> VNĐ</th>
                            <th><%= status[order.getStatus()]%> <%= order.getOrdership() == null ? "" : order.getOrdership()%></th>
                            <th><%= order.getDiscount() == null ? "" : order.getDiscount()%></th>
                            <th>
                                <%
                                    if (order.getStatus() == 1) {
                                %>
                            <th>
                                <a href="orderDetailServlet?OID=<%= order.getOrderID()%>"><button class="btn btn-primary">Xem chi tiết</button></a>
                                <a href="completedOrdersServlet?orderID=<%= order.getOrderID()%>"><button class="btn btn-danger"><i class="fa fa-check"></i></button></a>
                                <a href="cancelOrdersServlet?orderID=<%= order.getOrderID()%>"><button class="btn btn-danger"><i class="fa fa-remove"></i></button></a> 
                            </th> 

                            <%
                            } else {
                            %>
                            <th>
                                <a href="orderDetailServlet?OID=<%= order.getOrderID()%>"><button class="btn btn-primary">Xem chi tiết</button></a></th>    
                            </th>
                            <%
                                }
                            %>
                            </th>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <%
            }
        %>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>


        <!--code js cho menu-->   
        <script type="text/javascript">
                                    jQuery(document).ready(function () {
                                        jQuery("#open-menu").click(function () {
                                            if (jQuery('#page-container').hasClass('show-menu')) {
                                                jQuery("#page-container").removeClass('show-menu');
                                            } else {
                                                jQuery("#page-container").addClass('show-menu');
                                            }
                                        });
                                    });
        </script>

    </body>
</html>
