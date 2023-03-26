<%-- 
    Document   : header
    Created on : Feb 22, 2023, 12:31:42 AM
    Author     : tuank
--%>

<%@page import="java.util.HashMap"%>
<%@page import="Treer.dao.AccountDAO"%>
<%@page import="Treer.dao.PlantDAO"%>
<%@page import="Treer.dto.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

        <title>header</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- css style -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">       
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css>" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">

    </head>

    <body>
        <nav class="icon-menu-bar"> 
            <ul>
                <h2><button class="close_menu_bar" style="
                            margin-bottom: 0%;
                            margin-left: 85%;
                            background-color: #005030;
                            border: none;
                            margin-left: 85%;
                            background-color: #005030;
                            color: white;
                            "><i class="fa fa-times"></i></button></h2>


                <%
                    ArrayList<Categories> catelist;
                    catelist = PlantDAO.printallCategories();
                    HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
                    int demcart=0;
                    if (cart==null) {
                            demcart = 0;
                        } else demcart = cart.size();
                    if (catelist != null && !catelist.isEmpty()) {
                        int count = 0;
                        for (Categories categories : catelist) {
                            if (count == 10) {
                                break;
                            }
                %> 
                <li>
                    <a href="categoriesServlet?cid=<%= categories.getCateID()%>"><i class="fa fa-tree"></i><%= categories.getCateName()%></a>
                </li>
                <%
                            count++;
                        }
                    }
                    String name = (String) session.getAttribute("name");
                    String email = (String) session.getAttribute("email");

                %>
            </ul>
        </nav>

        <!-- Header Section Begin -->
        <header>
            <div class="menu_desktop">
                <div class="container">
                    <% if (name!=null) {
                    %>
                    <div class="col-lg-12 welcome-username" ><span class="username">Chào mừng trở lại, <a target="_blank" href="mainController?action=switchPage" style="text-decoration: none; color: #fff"><%= name %></a></span></div>
            <%
                }
            %>
                    <div class="row align-items-center">
                        <div class="col-lg-3">
                            <div class="header-left justify-content-between">
                                <div class="iconmenu-desktop">
                                    <a href="#" class="model-menu-title">Danh mục sản phẩm</a>
                                    <span class="model-menu-icon">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </span>
                                </div>
                                <div class="logo">
                                    <a href="homeServlet" title="Top Logo">
                                        <img src="img/Logo-removebg-preview.png" class="img-fluid" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="header_center">
                                <form class="search-top-header text-center" method="post" action="mainController">
                                    <div class="input-group">

                                        <input type="text" class="form-control" name="txtsearch"
                                               placeholder="Bạn vui lòng nhập tên sản phẩm"
                                               value="<%= (request.getParameter("txtsearch") == null) ? "" : request.getParameter("txtsearch")%>">

                                        <span class="input-group-btn">
                                            <button class="btn button-search" 
                                                    type="submit"
                                                    value="search" 
                                                    name="action">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </span>

                                    </div>
                                </form>
                                <div class="menu-ngang">
                                    <nav class="navbar navbar-expand-lg navbar-light pb-0">
                                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                            <ul class="navbar-nav mr-auto">
                                                <li class="nav-item dropdown">                                       
                                                    <a target="_blank" href="blogServlet" class="nav-link " title="Tin tức" style="color: #fff;">Tin tức</a>                             
                                                </li>
                                                <li class="nav-item dropdown">
                                                    <a target="_blank" href="AboutUs.jsp" class="nav-link " title="Về chúng tôi" style="color: #fff;">Về chúng tôi</a>
                                                </li>

                                                <li class="nav-item dropdown">
                                                    <a target="_blank" href="Auction.jsp" class="nav-link " title="Đấu giá" style="color: #fff;">Đấu giá</a>
                                                </li>

                                                <li class="nav-item dropdown">
                                                    <%
                                                        if (name == null) {
                                                    %>

                                                    <%
                                                    } else {
                                                    %>
                                                    <a target="_blank" href="mainController?action=switchPage" class="nav-link " title="Về chúng tôi" style="color: #fff;">Trang cá nhân</a>
                                                    <%
                                                        }
                                                    %>

                                                </li>
                                            </ul>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="auth-buttons justify-content-center">
                                <%
                                    if (name == null) {
                                %>
                                <a href="login.jsp" class="btn btn-outline-primary">Đăng nhập</a>
                                <%
                                } else {
                                %>
                                <a href="mainController?action=logout" class="btn btn-outline-primary">Đăng xuất</a>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="col-lg-1 pr-0">
                            <div class="header-right">                       
                                <div class="cart">
                                    <a href="mainController?action=viewcart">
                                        <div class="demsotrongcart"><%= demcart == 0 ? "" : demcart %></div>
                                        <div class="row text-center">
                                        <i class="fa fa-shopping-cart cart-icon col-lg-12"></i>
                                        <p class="col-lg-12">Giỏ hàng</p>
                                        </div>
                                    </a>
                                </div>                           
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </header>
        <!-- Header Section End -->

        <!-- Js Plugins -->  
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.slicknav.js"></script> 
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/main.js"></script>

        <!--code hiển thị bảng danh mục sản phẩm-->
        <script>
            const icon_menu_bar = document.querySelector('.icon-menu-bar');
            const iconmenu_desktop = document.querySelector('.iconmenu-desktop');
            const close_menu_bar = document.querySelector('.close_menu_bar');
            iconmenu_desktop.addEventListener('click', function () {
                icon_menu_bar.classList.toggle('visible');
            })
            close_menu_bar.addEventListener('click', function () {
                icon_menu_bar.classList.toggle('visible');
            })
        </script>  
    </body>
</html>
