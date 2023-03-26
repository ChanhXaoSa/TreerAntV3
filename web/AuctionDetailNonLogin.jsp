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
        <c:import url="header.jsp"></c:import>
        <%
            Auction auc = null;
            if (request.getAttribute("auctionDetailNote") != null) {
                auc = (Auction) request.getAttribute("auctionDetailNote");
            }
            ArrayList<AuctionDetail> detailList = new ArrayList<>();
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
        %>
        <div class="container">
            <a href="Auction.jsp" style="text-decoration: none; color: #fff;"><div class="btn btn-primary mt-3">Quay lại danh sách đấu giá</div></a>
            <%                if (auc != null) {
                    detailList = AuctionDetailsDAO.getAllAutionDetailsByID(auc.getAuctionId());
                }
                NumberFormat nf = NumberFormat.getInstance();
                nf.setGroupingUsed(true);
            %>
            <div class=" auction-section">
                <div class="auction-show wrapper row">
                    <div class="col-lg-4 col-md-6 col-sm-12 auction-plant-info">
                        <div class="">
                            <img src="<%= AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getImgPath()%>"
                                 class="card-img-top" alt="Product Image">
                            <div class="card-body">
                                <h3 class="product-details-name"><%= AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getPlantAuctionName()%></h3>
                                <p><%= AuctionPlantDao.getPlantwithPID(auc.getPlantId()).getDescription()%></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-6 col-sm-12 auction-plant-player">
                        <div class="auction-plant-player-control">
                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Thông tin</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Lịch sử đấu giá</button>
                                </li>
                            </ul>
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                    <div class="product-bid">
                                        <h3 style="color: red" id="countdown<%= auc.getAuctionId()%>"></h3>
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
                                                document.getElementById("countdown<%= auc.getAuctionId()%>").innerHTML = "Kết thúc sau " + days<%= auc.getAuctionId()%> + " ngày, "
                                                        + hours<%= auc.getAuctionId()%> + " giờ "
                                                        + minutes<%= auc.getAuctionId()%> + " phút " + seconds<%= auc.getAuctionId()%> + " giây ";

                                                // Nếu thời gian đã hết, dừng đếm ngược
                                                if (distance<%= auc.getAuctionId()%> < 0) {
                                                    clearInterval(timer<%= auc.getAuctionId()%>);
                                                    document.getElementById("countdown<%= auc.getAuctionId()%>").innerHTML = "Kết thúc!";
                                                }
                                            }, 1000); // Cập nhật mỗi giây
                                        </script>
                                        <h5>Lượt Tham Gia: <%= detailList.size()%></h5>
                                        <h5>Khởi Điểm: <%= nf.format(auc.getStatingPrice())%> VNĐ</h5>
                                        <h5>Hiện Tại: <%= nf.format(auc.getEndPrice())%> VNĐ</h5>
                                        <h5>Bước Giá Tối Thiểu : <%= nf.format(auc.getBid())%> VNĐ</h5>

                                        <%

                                            if (auc.getStatus() == 1) {
                                        %>
                                        <a href="login.jsp" class="btn btn-success">Đăng nhập để tham gia đấu giá</a>
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
                                </div>
                                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                                    <div class="bid-infomation">
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>Tên</th>
                                                        <th>Số tiền</th>
                                                        <th>Thời gian</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%

                                                        if (!detailList.isEmpty()) {
                                                            int count = 0;
                                                            for (AuctionDetail detail : detailList) {
                                                                String fullName = AccountDAO.getAccountNameByID(detail.getAccountID()).replaceAll("(?<=\\b\\w{1})\\w", "*");
                                                                String[] nameParts = fullName.split(" ");
                                                                String firstName = nameParts[nameParts.length - 1];
                                                                String hiddenName = "*".repeat(nameParts[0].length()) + " * " + firstName;
                                                    %>
                                                    <tr>
                                                        <td><%= hiddenName%></td>
                                                        <td><%= nf.format(detail.getBidprice())%> VNĐ</td>
                                                        <td><%= detail.getBidtime()%></td>
                                                    </tr>
                                                    <%
                                                                count++;
                                                                if (count == 7) {
                                                                    break;
                                                                }
                                                            }
                                                        }
                                                    %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
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
