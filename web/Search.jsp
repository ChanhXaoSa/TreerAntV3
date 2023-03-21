<%-- 
    Document   : Search
    Created on : Feb 22, 2023, 12:03:25 AM
    Author     : tuank
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="Treer.dto.Categories"%>
<%@page import="Treer.dao.PlantDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Treer.dto.Plant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Treer</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- css style -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css>" type="text/css">
    </head>

    <body>
        <header>

            <c:import url="header.jsp"></c:import>
            </header>

            <section style="width: 80%; margin: 0 auto" >    

            <%
                int CateID;
                try {
                    String cateID = request.getParameter("cid");
                    CateID = Integer.parseInt(cateID);
                } catch (Exception e) {
                    CateID = 14;
                }

                Categories cate = PlantDAO.getCategorieswithCateID(CateID);
                ArrayList<Plant> plist = null;
                plist = (ArrayList<Plant>) request.getAttribute("PList");
            %>

            <div class="row" style="margin-top: 3%">                 
                <h3>Kết quả tìm kiếm <%= request.getParameter("txtsearch") == null ? "" : request.getParameter("txtsearch")%> 
                    <%= cate.getCateID() == 14 ? "" : cate.getCateName()%></h3>

                <%
                    for (Plant plant : plist) {
                %>
                    <div class="col-sm-3">
                        <ul class="best-seller-items">
                            <li class="best-seller-items-detail">
                                <div class="product_top">
                                <a href="productDetailServlet?PID=<%= plant.getId() %>" class="product_thumb">
                                    <img src="<%= plant.getImgpath() %>" alt="hoa ban">
                                    </a>
                                </div>
                            </li>
                            <li class="best-seller-items-detail">
                                <div class="product_info">
                                <a href="productDetailServlet?PID=<%= plant.getId() %>" class="product_name"><%= plant.getName()%></a>
                                    <div class="product_price">
                                    <%-- Format o.price and o.sale using NumberFormat --%>
                                    <%                                        
                                        int price = plant.getPrice();
                                        int sale = plant.getSale();
                                        String formattedPrice = "";
                                        String formattedSale = "";

                                        NumberFormat nf = NumberFormat.getInstance();
                                        nf.setGroupingUsed(true);
                                        formattedPrice = nf.format(price);
                                        formattedSale = nf.format(sale);

                                    %>
                                    <span style="text-decoration: line-through; color: gray;"> <%= price == sale ? "" : formattedPrice%> </span>
                                    <span style="color: red; font-weight: bold"> <%= formattedSale%> VND</span>
                                    </div>
                                </div>
                            </li>
                            <li class="best-seller-items-detail">
                                <a href="#" class="buy">Mua ngay</a><br />
                            </li>
                        </ul>
                    </div>
                <%
                    }
                %>

            </div>
        </section>

        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>

        <!-- Js Plugins -->
        <script src="js/main.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>

    </body>
</html>
