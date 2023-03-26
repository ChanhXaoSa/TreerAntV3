<%-- 
    Document   : Auction
    Created on : Mar 3, 2023, 4:16:45 AM
    Author     : Triệu
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="Treer.dao.AuctionWinnerDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="Treer.dto.Plant"%>
<%@page import="Treer.dao.AuctionPlantDao"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Treer.dto.DateTimeFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="Treer.dao.AuctionDetailsDAO"%>
<%@page import="Treer.dto.AuctionDetail"%>
<%@page import="Treer.dao.AuctionDAO"%>
<%@page import="Treer.dao.AccountDAO"%>
<%@page import="Treer.dao.PlantDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Treer.dto.Auction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--CSS stylesheet-->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">       
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css>" type="text/css">
        <link rel="stylesheet" href="css/styleAuction.css" type="text/css">
    </head>
    <body>
        <a href="mainController?action=ReloadActionPage" class="reloadAuctionPage">
            <div class="btn btn-primary"><i class="fa fa-refresh"></i></div>
        </a>
        <c:import url="header.jsp"></c:import>
        <%
            if (session.getAttribute("name") == null) {
                request.getRequestDispatcher("AuctionNonLogin.jsp").forward(request, response);
            }
            String name = (String) session.getAttribute("name");
            String sId = session.getAttribute("id").toString();
            int id = Integer.parseInt(sId);
            ArrayList<Auction> list = AuctionDAO.getAllAuctions();
            try {
                if (request.getAttribute("listAuction") == null) {
                    list = AuctionDAO.getAllAuctions();
                } else {
                    list = (ArrayList<Auction>) request.getAttribute("listAuction");
                }
            } catch (Exception e) {
                list = AuctionDAO.getAllAuctions();
            }
            ArrayList<AuctionDetail> detailList = new ArrayList<>();
            HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
            for (Auction auc : list) {
                if (AuctionDAO.checkAuctionTimeEnd(auc.getAuctionId())) {
                    detailList = AuctionDetailsDAO.getAllAutionDetailsByID(auc.getAuctionId());
                    if (!detailList.isEmpty()) {
                        PlantDAO.insertAuctionPlant(AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getPlantAuctionName(),
                                auc.getEndPrice(), AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getDescription(),
                                AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getImgPath());
                        Plant winPlant = PlantDAO.getLastPlantForAuction();
                        AuctionWinnerDAO.insertWinner(winPlant.getId(), detailList.get(0).getAccountID(), auc.getAuctionId());
                        AuctionDAO.EndAuctionbyEndTime(auc.getAuctionId());
                        detailList.clear();
                    } else {
                        AuctionDAO.EndAuctionbyEndTime(auc.getAuctionId());
                    }
                }
            }
            try {
                if (request.getAttribute("listAuction") == null) {
                    list = AuctionDAO.getAllAuctions();
                } else {
                    list = (ArrayList<Auction>) request.getAttribute("listAuction");
                }
            } catch (Exception e) {
                list = AuctionDAO.getAllAuctions();
            }

        %>
        <div class="container">
            <form action="mainController" method="POST" class="auction-tag">
                <button type="submit" value="allAuctionShow" name="action" class="btn btn-light">Tất cả đấu giá</button>
                <button type="submit" value="processingAuctionShow" name="action" class="btn btn-light">Đấu giá đang diễn ra</button>
                <button type="submit" value="endAuctionShow" name="action" class="btn btn-light">Đấu giá đã kết thúc</button>
                <input type="hidden" value="<%= id%>" name="accountId">
                <button type="submit" value="joinedAuctionShow" name="action" class="btn btn-light">Đấu giá bạn đã tham gia</button>
            </form>
            <%
                String bigger = (String) request.getAttribute("bigger");
                int aucIDpidOK = 0;
                try {
                    aucIDpidOK = (int) request.getAttribute("aucIDpidOK");
                } catch (Exception e) {
                    aucIDpidOK = 0;
                }

                if (bigger == "bigger") {
            %>
            <p style="color: red" class="col-lg-12">Vui lòng đặt số tiền lớn hơn giá trị hiện có</p>
            <%  request.setAttribute("bigger", null);
            } else if (bigger == "ok") {
                request.setAttribute("bigger", null);
            %>  
            <p style="color: blue" class="col-lg-12">Đặt thành công</p>
            <% }%>
            <div class="row d-flex">
                <%                if (list != null)
                        for (Auction auc : list) {
                            detailList = AuctionDetailsDAO.getAllAutionDetailsByID(auc.getAuctionId());
                            NumberFormat nf = NumberFormat.getInstance();
                            nf.setGroupingUsed(true);
                            int dem = 1;
                            if (dem % 4 == 0) {
                %>
            </div><div class="row d-flex">
                <%
                    }
                    dem++;
                %>
                <div class="col-lg-3 col-md-4 col-sm-6 text-center p-3">
                    <div class="auction-plant-info d-flex flex-column justify-content-between">
                        <a href="mainController?action=ViewAuctionDetail&auctionDID=<%= auc.getAuctionId()%>">
                            <img src="<%= AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getImgPath()%>"
                                 class="card-img-top" alt="Product Image" height="250px">
                        </a>
                        <div class="card-body">
                            <a href="mainController?action=ViewAuctionDetail&auctionDID=<%= auc.getAuctionId()%>" style="text-decoration: none">
                                <h5 class="product-details-name"><%= AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getPlantAuctionName()%></h5>
                            </a>
                            <%

                                if (!detailList.isEmpty()) {

                            %>
                            <p>Bids : <%= detailList.size()%></p>
                            <%

                            } else {
                            %>
                            <p>Bids : 0</p>
                            <% }%>
                            <p><%= nf.format(auc.getEndPrice())%> VNĐ</p>
                            <h5 style="color: red" id="countdown<%= auc.getAuctionId()%>"></h5>
                            <script>
                                // Thiết lập thời gian kết thúc (đơn vị: giây)
                                var timeSec<%= auc.getAuctionId()%> = <%= AuctionDAO.getTimeAutionByID(auc.getAuctionId())%>;
                                var endTime<%= auc.getAuctionId()%> = new Date().getTime() + timeSec<%= auc.getAuctionId()%> * 1000; // Thời gian kết thúc sau một giờ

                                // Cập nhật thời gian đếm ngược mỗi giây
                                var timer<%= auc.getAuctionId()%> = setInterval(function () {
                                    // Tính toán khoảng cách giữa thời gian hiện tại và thời gian kết thúc
                                    var now<%= auc.getAuctionId()%> = new Date().getTime();
                                    var distance<%= auc.getAuctionId()%> = endTime<%= auc.getAuctionId()%> - now<%= auc.getAuctionId()%>;

                                    // Tính toán số giờ, phút, giây còn lại
                                    var days<%= auc.getAuctionId()%> = Math.floor(distance<%= auc.getAuctionId()%> / (1000 * 60 * 60 * 24));
                                    var hours<%= auc.getAuctionId()%> = Math.floor((distance<%= auc.getAuctionId()%> % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                    var minutes<%= auc.getAuctionId()%> = Math.floor((distance<%= auc.getAuctionId()%> % (1000 * 60 * 60)) / (1000 * 60));
                                    var seconds<%= auc.getAuctionId()%> = Math.floor((distance<%= auc.getAuctionId()%> % (1000 * 60)) / 1000);

                                    // Hiển thị thời gian đếm ngược trên trang web
                                    document.getElementById("countdown<%= auc.getAuctionId()%>").innerHTML = days<%= auc.getAuctionId()%> + " Ngày, " +
                                            hours<%= auc.getAuctionId()%> + ":"
                                            + minutes<%= auc.getAuctionId()%> + ":" + seconds<%= auc.getAuctionId()%>;

                                    // Nếu thời gian đã hết, dừng đếm ngược
                                    if (distance<%= auc.getAuctionId()%> < 0) {
                                        clearInterval(timer<%= auc.getAuctionId()%>);
                                        document.getElementById("countdown<%= auc.getAuctionId()%>").innerHTML = "Kết thúc!";
                                    }
                                }, 1000); // Cập nhật mỗi giây
                            </script>
                            <% if (auc.getStatus() == 1) {%>
                            <form action="mainController?action=setAuctionDetail" method="POST">
                                <input type="hidden" value="<%= id%>" name="accountId">
                                <input type="hidden" value="<%= auc.getAuctionId()%>" name="auctionID">
                                <input type="hidden" value="<%= auc.getEndPrice()%>" name="lastBid">
                                <input type="number" name="auctionPrice" 
                                       value="<%= auc.getEndPrice()%>" placeholder="Giá đặt" step="<%= auc.getBid()%>"
                                       class="form-control" >
                                <button type="submit" class="btn btn-danger mt-2">Đặt Ngay</button>
                            </form>
                            <% } else { %>
                            <%
                                try {

                                    if (AuctionWinnerDAO.getAuctionWinnerByAuctionID(auc.getAuctionId()).getAccountID()
                                            == id) {
                            %>
                            <p class="winner"><span class="winner-name">Bạn</span> đã thắng!</p> 
                            <%
                                    }
                                } catch (Exception e) {
                                }
                            %>
                            <a class="action-auction-button" href="mainController?action=ViewAuctionDetail&auctionDID=<%= auc.getAuctionId()%>">
                                <div class="btn btn-primary">Xem Chi Tiết</div>
                            </a>
                            <% } %>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <div class="footer-space"></div>
        <c:import url="footer.jsp"></c:import>

        <!--JS plugins-->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.slicknav.js"></script> 
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/Auction.js"></script>
    </body>
</html>
