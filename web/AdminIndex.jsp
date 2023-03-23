<%-- 
    Document   : AdminIndex.jsp
    Created on : Feb 26, 2023, 2:27:19 AM
    Author     : Triệu
--%>

<%@page import="Treer.dao.OrderDAO"%>
<%@page import="Treer.dao.PlantDAO"%>
<%@page import="Treer.dao.AccountDAO"%>
<%@page import="Treer.dto.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Homepage</title>
        <!-- css style -->
        <link rel="stylesheet" href="css/jquery-ui.min.css>" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/bootstrap4.min.css" type="text/css">
        <link rel="stylesheet" href="css/styleAdmin.css" type="text/css"/>
    </head>
    <body>
        <%
            String name = (String) session.getAttribute("name");
            int id = (int) session.getAttribute("id");
            if (name == null) {
        %>
        <h2 style="color: red">You are not login yet!</h2>
        <%
        } else if (AccountDAO.getAccountsWithAccID(id).getRoleID() == 1) {
        %>
        <h2 style="color: red">You don't have permision to enter to this url</h2>
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
                            <a href="mainController?action=viewCSKH" class="nav-links d-block"><i class="fa fa-comments pr-2"></i> CHĂM SÓC KHÁCH HÀNG</a>
                        </li>
                        <li class="nav-item">
                            <a href="index.jsp" class="nav-links d-block"><i class="fa fa-list pr-2"></i> TRANG CHỦ</a>
                        </li>
                        <li class="nav-item">
                            <a href="mainController?action=logout" class="nav-links d-block"><i class="fa fa-arrow-left"></i> ĐĂNG XUẤT</a>
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
                <div class="row">
                    <div class="col-lg-3">
                        <div class="card card-left-account">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6>Tài Khoản Đã Đăng Kí</h6>
                                        <h3 style="color: green;"><%= AccountDAO.countAccountByRole(1)%></h3>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3">                       
                        <div class="card card-left-account">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6>Tổng Số Cây</h6>
                                        <h3 style="color: green"><%= PlantDAO.countTotalPlant()%></h3>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="card card-left-account">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6>Lượt Bán</h6>
                                        <h3 style="color: green "><%= OrderDAO.countOrderByStatus(2)%></h3>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  

                    <div class="col-lg-3">
                        <div class="card card-left-account">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6>Doanh Thu</h6>
                                        <h3 style="color: green "><%= OrderDAO.sumOrderByStatus(2)%> VND</h3>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>  
                            </div>
                        </div>
                    </div>  
                </div>

                <!--==========================-->
                <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-header">
                                <h6>Tài Khoản Trong Trang Web</h6>
                            </div>
                            <div class="card-body">
                                <canvas id="myChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card card-left-account">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6>Tài Khoản Đang Hoạt Động</h6>
                                        <h3 style="color: #69C3FF"><%= AccountDAO.countAccountByStatus(1, 1)%></h3>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-left-account">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6>Tài Khoản Bị Cấm</h6>
                                        <h3 style="color: #FFA1B5"><%= AccountDAO.countAccountByStatus(0, 1)%></h3>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-header">
                                <h6>Số Cây Trong Trang Web</h6>
                            </div>
                            <div class="card-body mx-auto text-center">
                                <canvas id="myChartTwo"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card card-left-account">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6>Số Cây Đang Có</h6>
                                        <h3 style="color: #69C3FF"><%= PlantDAO.countTotalPlant()%></h3>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-left-account">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6>Số Cây Đã Bán</h6>
                                        <h3 style="color: #FFA1B5"><%= OrderDAO.countOrderByStatus(2)%></h3>
                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-user"></i>
                </div>
            </div>
        </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-header">
                                <h6>Lượt Giao Dịch Trên Trang Web</h6>
                            </div>
                            <div class="card-body mx-auto text-center">
                                <canvas id="myChartthree"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card card-left-account">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6>Đã Giao</h6>
                                        <h3 style="color: #69C3FF"><%= OrderDAO.countOrderByStatus(2)%></h3>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-left-account">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6>Đang Chờ</h6>
                                        <h3 style="color: #FFA1B5"><%= OrderDAO.countOrderByStatus(1)%></h3>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-left-account">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <h6>Đã Hủy</h6>
                                        <h3 style="color: rgb(255, 205, 86)"><%= OrderDAO.countOrderByStatus(3)%></h3>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% }%>











        <!-- Js Plugins -->
        <!--<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>-->
        <script src="js/chart.js"></script>
        <script src="js/jquery-3.2.1.slim.min.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap4.min.js"></script>
        <script src="js/mainAdmin.js"></script>

        <script>
            const myChart = document.getElementById('myChart').getContext('2d');
            const chart = new Chart(myChart, {
                type: 'doughnut',
                data: {
                    labels: ['Tài Khoản Đang Hoạt Động', 'Tài Khoản Bị Khoá'],
                    datasets: [{
                            label: '# Số lượng',
                            data: [<%= AccountDAO.countAccountByStatus(1, 1)%>, <%= AccountDAO.countAccountByStatus(0, 1)%>],
                            backgroundColor: [
                                'rgba(54, 162, 235, 0.6)',
                                'rgba(255, 99, 132, 0.6)'
                            ],
                            borderColor: [
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 99, 132, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    title: {
                        display: true,
                        text: 'My Pie Chart'
                    }
                }
            });
        </script>

        <script>
            const myChartTwo = document.getElementById('myChartTwo').getContext('2d');
            const Chart2 = new Chart(myChartTwo, {
                type: 'pie',
                data: {
                    labels: ['Tổng Số Cây', 'Số Cây Đã Bán'],
                    datasets: [{
                            label: '# Số lượng',
                            data: [<%= PlantDAO.countTotalPlant()%>, <%= OrderDAO.countOrderByStatus(2)%>],
                            backgroundColor: [
                                'rgba(54, 162, 235, 0.6)',
                                'rgba(255, 99, 132, 0.6)'
                            ],
                            borderColor: [
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 99, 132, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        title: {
                            display: true,
                            text: 'My Pie Chart'
                        }
                    }
                }
            });
        </script>

        <script>
            const ctx2 = document.getElementById('myChartthree').getContext('2d');
            const myChartthree = new Chart(ctx2, {
                type: 'polarArea',
                data: {
                    labels: ['Đã Giao', 'Đang Chờ', 'Đã Hủy'],
                    datasets: [{
                            label: '# Số lượng',
                            data: [<%= OrderDAO.countOrderByStatus(2)%>, <%= OrderDAO.countOrderByStatus(1)%>, <%= OrderDAO.countOrderByStatus(3)%>],
                            backgroundColor: [
                                'rgba(54, 162, 235, 0.6)',
                                'rgba(255, 99, 132, 0.6)',
                                'rgb(255, 205, 86)'
                            ],
                            borderColor: [
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 99, 132, 1)',
                                'rgb(255, 305, 86)'
                            ],
                            hoverOffset: 4
                        }]
                },
                options: {
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        title: {
                            display: true,
                            text: 'My Pie Chart'
                        }
                    }
                }
            });
        </script>
    </body>
</html>
