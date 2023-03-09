<%-- 
    Document   : Auction
    Created on : Mar 3, 2023, 4:16:45 AM
    Author     : Triệu
--%>

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
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/styleAuction.css" type="text/css">
    </head>
    <body>
        <a href="mainController?action=ReloadActionPage" class="reloadAuctionPage">
            <div class="btn btn-primary"><i class="fa fa-refresh"></i></div>
        </a>
        <c:import url="header.jsp"></c:import>
        <%
            String name = (String) session.getAttribute("name");
            String sId = session.getAttribute("id").toString();
            int id = Integer.parseInt(sId);
            AuctionDAO.EndAuctionbyEndTime();
            ArrayList<Auction> list = AuctionDAO.getAllAuctions();
            for (Auction auc : list) {
                AuctionDAO.EndAuctionbyEndTime();
            }
            ArrayList<AuctionDetail> detailList = AuctionDetailsDAO.getAllAutionDetails();
        %>
        <div class="container">
            <%
                if (list != null)
                    for (Auction auc : list) {
            %>
            <div class="row">
                <div class="col-sm-7">
                    <div class="card">
                        <img src="<%= AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getImgPath()%>"
                             class="card-img-top" width="620px" height="500px" alt="Product Image">
                        <div class="card-body">
                            <h3 class="product-details-name"><%= AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getPlantAuctionName()%></h3>
                            <p><%= AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getDescription()%></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="product-bid">
                        <h3>Kết thúc vào <%= auc.getEndTime()%> </h3>
                        <h5>Khởi Điểm: <%= auc.getStatingPrice()%></h5>
                        <h5>Giá hiện tại: <%= auc.getEndPrice()%></h5>
                        <h5>Bước giá tối thiểu : <%= auc.getBid()%></h5>

                        <% if (auc.getStatus() == 1) {
                        %>
                        <form action="mainController?action=setAuctionDetail" method="POST">

                            <input type="hidden" value="<%= id%>" name="accountId">
                            <input type="hidden" value="<%= auc.getAuctionId()%>" name="auctionID">
                            <input type="hidden" value="<%= auc.getEndPrice()%>" name="lastBid">
                            <div class="form-group row">
                                <input type="number" name="auctionPrice" 
                                       value="<%= auc.getEndPrice()%>" placeholder="Giá đặt" step="<%= auc.getBid()%>"
                                       class="form-control-lg col-lg-8" >
                                <button type="submit" class="btn btn-outline-primary col-lg-4">Đấu giá ngay</button>
                            </div>
                        </form>
                        <%
                            String bigger = (String) request.getAttribute("bigger");
                            if (bigger == "bigger") {
                        %>
                        <p style="color: red">Vui lòng đặt giá trị lớn hơn <%= auc.getEndPrice()%></p>
                        <%  request.setAttribute("bigger", null);
                        } else if (bigger == "ok") {
                            request.setAttribute("bigger", null);
                        %>  
                        <p style="color: blue">Đặt thành công số tiền <%= auc.getEndPrice()%></p>
                        <% }%>

                        <% } else {%>
                        <p> Phiên đấu giá kết thúc </p>
                        <p> Người thắng cuộc đấu giá là <%= AccountDAO.getAccountNameByID(detailList.get(0).getAccountID())%> 
                            Với số tiền <%= detailList.get(0).getBidprice()%> </p>
                            <% } %>
                    </div>
                    <div class="bid-infomation">
                        <%
                            if (detailList != null) {
                                int count = 0;
                                for (AuctionDetail detail : detailList) {
                        %>
                        <p class="bid-information-users"><%= AccountDAO.getAccountNameByID(detail.getAccountID())%> vừa đặt <%= detail.getBidprice()%> vào lúc <%= detail.getBidtime()%></p>
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
            <%                }
            %>
        </div>
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
