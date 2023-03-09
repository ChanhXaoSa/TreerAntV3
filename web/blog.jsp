<%-- 
    Document   : Blog
    Created on : Feb 24, 2023, 3:59:57 PM
    Author     : tuank
--%>

<%@page import="Treer.dao.BlogDAO"%>
<%@page import="Treer.dto.Blog"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Blog</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- css style -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css>" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/blog.css" type="text/css">
    </head>



    <body>
        <header> 
            <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-chevron-up"></i></button>   
                <c:import url="header.jsp"></c:import>
            </header>

            <section>
            <c:import url="blogpart.jsp"></c:import>
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
