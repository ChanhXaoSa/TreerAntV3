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
            <%                if (list != null)
                    for (Auction auc : list) {
                        detailList = AuctionDetailsDAO.getAllAutionDetailsByID(auc.getAuctionId());
                        NumberFormat nf = NumberFormat.getInstance();
                        nf.setGroupingUsed(true);
            %>
            <div class="card auction-section">
                <div class="auction-show wrapper row">
                    <div class="col-md-4 auction-plant-info">
                        <div class="">
                            <img src="<%= AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getImgPath()%>"
                                 class="card-img-top" alt="Product Image">
                            <div class="card-body">
                                <h3 class="product-details-name"><%= AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getPlantAuctionName()%></h3>
                                <p><%= AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getDescription()%></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 auction-plant-player">
                        <div class="product-bid">
                            <h4>Kết thúc vào <%= auc.getEndTime()%> </h4>
                            <h5>Giá khởi điểm: <%= nf.format(auc.getStatingPrice())%> VNĐ</h5>
                            <h5>Giá hiện tại: <%= nf.format(auc.getEndPrice())%> VNĐ</h5>
                            <h5>Bước giá tối thiểu : <%= nf.format(auc.getBid())%> VNĐ</h5>

                            <%

                                if (auc.getStatus() == 1) {
                            %>
                            
                            <p>vui lòng <a href="login.jsp">đăng nhập</a> để tham gia đấu giá này</p>

                            <% } else {%>
                            <p class="auction-end"> Phiên đấu giá đã kết thúc </p>
                            <% if (detailList.isEmpty()) {
                            %>
                            <p class="winner">Chưa có người tham gia phiên đấu giá này</p>
                            <%
                            } else {
                                String fullName = AccountDAO.getAccountNameByID(AuctionDetailsDAO.getMaxAutionDetailsByID(auc.getAuctionId()).get(0).getAccountID()).replaceAll("(?<=\\b\\w{1})\\w", "*");
                                String[] nameParts = fullName.split(" ");
                                String firstName = nameParts[nameParts.length - 1];
                                String hiddenName = "*".repeat(nameParts[0].length()) + " * " + firstName;
                            %>
                            <p class="winner"><span class="winner-name"><%= hiddenName%> </span>
                                đã thắng cuộc đấu giá</p>
                                <%
                                        }

                                    } %>
                        </div>
                        <div class="bid-infomation">
                            <p style="text-align: center; font-weight: 600">LỊCH SỬ ĐẤU GIÁ</p>
                            <%

                                if (!detailList.isEmpty()) {
                                    int count = 0;
                                    for (AuctionDetail detail : detailList) {
                                        String fullName = AccountDAO.getAccountNameByID(detail.getAccountID()).replaceAll("(?<=\\b\\w{1})\\w", "*");
                                        String[] nameParts = fullName.split(" ");
                                        String firstName = nameParts[nameParts.length - 1];
                                        String hiddenName = "*".repeat(nameParts[0].length()) + " * " + firstName;
                            %>
                            <p class="bid-information-users"><%= hiddenName%> vừa đặt <%= nf.format(detail.getBidprice())%> VNĐ vào lúc <%= detail.getBidtime()%></p>
                            <%
                                        count++;
                                        if (count == 7) {
                                            break;
                                        }
                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
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
