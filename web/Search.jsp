<%-- 
    Document   : Search
    Created on : Feb 22, 2023, 12:03:25 AM
    Author     : tuank
--%>

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
            %>

            <div class="row" style="margin-top: 3%">                 
                <h3>Kết quả tìm kiếm <%= request.getParameter("txtsearch") == null ? "" : request.getParameter("txtsearch")%> 
                    <%= cate.getCateID() == 14 ? "" : cate.getCateName()%></h3>

                <c:forEach items="${PList}" var="o">
                    <div class="col-sm-3">
                        <ul class="best-seller-items">
                            <li class="best-seller-items-detail">
                                <div class="product_top">
                                    <a href="productDetailServlet?PID=${o.id}" class="product_thumb">
                                        <img src="${o.imgpath}" alt="hoa ban">
                                    </a>
                                </div>
                            </li>
                            <li class="best-seller-items-detail">
                                <div class="product_info">
                                    <a href="productDetailServlet?PID=${o.id}" class="product_name">${o.name}</a>
                                    <div class="product_price">
                                        <span style="text-decoration: line-through; color: gray;"> ${o.price==o.sale? "" :o.price} </span>
                                        <span style="color: red; font-weight: bold"> ${o.sale} VND</span>
                                    </div>
                                </div>
                            </li>
                            <li class="best-seller-items-detail">
                                <a href="#" class="buy">Mua ngay</a><br />
                            </li>
                        </ul>
                    </div>
                </c:forEach>                       

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
