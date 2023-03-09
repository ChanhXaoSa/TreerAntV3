<%-- 
    Document   : personalWishList
    Created on : Mar 4, 2023, 8:58:15 PM
    Author     : tuank
--%>

<%@page import="Treer.dao.WishListDAO"%>
<%@page import="Treer.dto.WishList"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="personalheader.jsp"></c:import>
            <div class="main-body-content w-100 ets-pt">
                <div class="table-responsive bg-light">
                    <div class="container" style="text-align: center">
                        <table class="table">
                            <tr>
                                <th class="col-1"><br>Mã cây</th>
                                <th class="col-3"><br>Ảnh</th>
                                <th class="col-4"><br>Tên sản phẩm</th>
                                <th class="col-4"><br></th>
                            </tr>
                        <%
                            int accid = (int) session.getAttribute("accid");
                            ArrayList<WishList> wlist = WishListDAO.printallWishList(accid);
                            for (WishList wishList : wlist) {
                        %>
                        <tr>
                            <th><%= wishList.getPID()%></th>
                            <th><img style="height: 200px; width: auto" src="<%= WishListDAO.getPlantImgByID(wishList.getPID())%>" alt="alt"/></th>
                            <th><a class="btn-close" href="productDetailServlet?PID=<%= wishList.getPID()%>" style="text-decoration: none" ><%= WishListDAO.getPlantNameByID(wishList.getPID()) %></a></th>
                            <th><a class="btn-close" href="wishlistpersonalServlet?PlantID=<%= wishList.getPID()%>" style="text-decoration: none" >Xóa cây khỏi danh sách</a></th>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>  
            </div>
        </div>
    </body>
</html>
