<%-- 
    Document   : AdminAuction
    Created on : Mar 7, 2023, 1:08:53 PM
    Author     : Triệu
--%>

<%@page import="Treer.dao.AuctionPlantDao"%>
<%@page import="Treer.dao.AuctionDAO"%>
<%@page import="Treer.dto.Auction"%>
<%@page import="Treer.dao.AccountDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Treer.dto.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Auction Manager Page</title>
        <link rel="stylesheet" href="css/bootstrap4.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css>" type="text/css">
        <link rel="stylesheet" href="css/styleAdmin.css" type="text/css"/>

    </head>
    <body>
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
                <h1 style="margin-left: 20px">Danh sách đấu giá</h1>
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
                    ArrayList<Auction> list = (ArrayList<Auction>) request.getAttribute("auctionList");
                %>
                <% if (request.getAttribute("confirmAucCr") == null) {
                %>
                <a href="mainController?action=confirmCreateNewAuction"><div class="btn btn-danger" style="margin-left: 20px">Tạo đấu giá mới</div></a>
                <%
                } else {
                    request.setAttribute("confirmAucCr", null);
                %>
                <form action="mainController?action=chooseAuctionPlant" method="POST">
                    <button type="submit" class="btn btn-info">Chọn cây cảnh để đấu giá</button>
                </form>
                <% if (request.getAttribute("plantIdChoosen")!=null) {
                    int plantidchoosenget = (int) request.getAttribute("plantIdChoosen");
                            %>
                            <p style="color: red"> Chọn thành công cây <%= AuctionPlantDao.getPlantwithPID(plantidchoosenget).getPlantAuctionName() %> </p>
                <%
                        }
                %>
                <form action="mainController?action=createNewAuction" method="POST">
                    <label for="endTime">Thời gian kết thúc :</label>
                    <input type="datetime-local" 
                           name="aucDate"
                           required=""
                           id="endTime"
                           /><br/>
                    <%
                    int apID=0;
                    if (request.getAttribute("plantIdChoosen")!=null) {
                            apID=(int) request.getAttribute("plantIdChoosen");
                        }
                    %>
                    <input type="hidden" 
                           name="aucPlantID"
                           placeholder="ID Cây Cảnh"
                           value="<%= apID %>" 
                           required=""
                           min="0"
                           />
                    <label>Giá khởi điểm :</label>
                    <input type="number" 
                           name="aucStartedPrice"
                           placeholder="Giá khởi điểm"
                           value="0" 
                           required=""
                           step="10000"
                           min="0"
                           /><br/>
                    <label>Bước nhảy :</label>
                    <input type="number" 
                           name="aucBID"
                           placeholder="Bước nhảy"
                           value="0" 
                           required=""
                           step="10000"
                           min="0"
                           />
                    <button type="submit" class="btn btn-danger">Tạo đấu giá</button>
                </form>
                <%
                    }
                    if (list != null) {
                %>
                <div class="table-responsive bg-light">
                    <br>

                    <!--Bộ lọc cho bảng auction-->
                    <%
                        int accid = (int) session.getAttribute("accid");
                        String button = (String) session.getAttribute("selectedOption");
                        String from = request.getParameter("from");
                        String to = request.getParameter("to");

                        String[] status = {"Đang diễn ra", "Đã kết thúc", "Tất cả"};
                    %>

                    <form action="mainController?action=filterAuctionAdmin" method="post" style="margin-left: 30px">
                        <select name="button">                           
                            <option  value="active" <%= (button == null || button.equals("active")) ? "selected" : ""%>>Đang diễn ra</option>
                            <option  value="inactive" <%= (button == null || button.equals("inactive")) ? "selected" : ""%>>Đã Kết thúc</option>
                            <option  value="all" <%= (button == null || button.equals("all")) ? "selected" : ""%>>Tất cả</option>
                        </select> 

                        <label>từ ngày</label>  
                        <input type="date" name="from" value="<%= from%>">
                        <label>đến ngày</label>
                        <input type="date" name="to" value="<%= to%>">
                        <button type="submit" name="action" id="myButton">Tìm kiếm</button> 
                    </form>
                    <!--Bộ lọc cho bảng auction-END-->

                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Thời Gian Bắt Đầu</th>
                                <th scope="col">Thời Gian Kết Thúc</th>
                                <th scope="col">Tên Cây Cảnh</th>
                                <th scope="col">Giá Khởi Điểm</th>
                                <th scope="col">Giá Kết Thúc</th>
                                <th scope="col">Bước Nhảy Tối Thiểu</th>
                                <th scope="col">Tình Trạng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Auction auc : list) {
                            %>
                            <tr>
                                <th scope="row"><%= auc.getAuctionId()%></th>
                                <th><%= auc.getStartTime()%></th>
                                <th><%= auc.getEndTime()%></th>
                                <th><a href="plantsAuctionManagerServlet?keyword=<%= auc.getPlantId()%>&&searchOption=id"><%= AuctionDAO.getNamePlantWithID(auc.getPlantId())%></a></th>
                                <th><%= auc.getStatingPrice()%></th>
                                <th><%= auc.getEndPrice()%></th>
                                <th><%= auc.getBid()%></th>
                                <th>
                                    <% if (auc.getStatus() == 1) {
                                    %>
                                    <span style="color: green">Đang diễn ra</span>
                                    <a href="mainController?action=changeAuctionStatus&auctionID=<%= auc.getAuctionId()%>">
                                        <i class="fa fa-exchange"></i>
                                    </a>
                                    <%
                                    } else if (auc.getStatus() == 0) {
                                    %>
                                    <span style="color: red">Kết Thúc</span>
                                    <a href="mainController?action=changeAuctionStatus&auctionID=<%= auc.getAuctionId()%>">
                                        <i class="fa fa-exchange"></i>  
                                    </a>
                                    <% }%>
                                </th>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <%
                    }
                %>
            </div>
                <% }%>
                <!-- Js Plugins -->
                <script src="js/jquery-3.2.1.slim.min.js"></script>
                <script src="js/jquery-3.3.1.min.js"></script>
                <script src="js/jquery-ui.min.js"></script>
                <script src="js/jquery.nice-select.min.js"></script>
                <script src="js/jquery.slicknav.js"></script>
                <script src="js/popper.min.js"></script>
                <script src="js/bootstrap4.min.js"></script>
                <script src="js/mainAdmin.js"></script>
                </body>
                </html>
