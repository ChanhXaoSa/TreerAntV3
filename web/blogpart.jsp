<%-- 
    Document   : blogpart
    Created on : Feb 26, 2023, 8:26:43 PM
    Author     : tuank
--%>

<%@page import="Treer.dao.BlogDAO"%>
<%@page import="Treer.dto.Blog"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/blogpart.css" type="text/css">
    </head>

    <body>
        <div class="container cta-100 ">
            <div class="container">
                <div class="row blog">
                    <div class="col-md-12">
                        <div id="blogCarousel" class="carousel slide container-blog" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#blogCarousel" data-slide-to="0" class="active">1</li>
                                <li data-target="#blogCarousel" data-slide-to="1">2</li>
                            </ol>
                            <!-- Carousel items -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="row">
                                        <%
                                            ArrayList<Blog> list = BlogDAO.printAlllog();

                                            if (list != null && !list.isEmpty()) {
                                                for (int i = 0; i < 3 && i < list.size(); i++) {
                                                    Blog b = list.get(i);
                                        %>

                                        <div class="col-md-4" >
                                            <div class="item-box-blog">
                                                <div class="item-box-blog-image">

                                                    <!--Image-->
                                                    <figure> <img alt="" src="<%= b.getImgpath()%>" style="width: 100%; height: auto" > </figure>

                                                </div>
                                                <div class="item-box-blog-body">
                                                    <!--Heading-->
                                                    <div class="item-box-blog-heading">
                                                        <a href="<%= b.getLink() %>" tabindex="0" style="text-decoration: none" >
                                                            <h5 style="color: green;"><%= b.getTitle()%></h5>
                                                        </a>
                                                    </div>
                                                    <!--Data-->
                                                    <div class="item-box-blog-data" style="padding: px 15px;">
                                                        <p><i class="fa fa-user-o"></i> Admin, <%= b.getPostdate()%></p>
                                                    </div>
                                                    <!--Text-->
                                                    <div class="item-box-blog-text">
                                                        <p><%= b.getDescription()%></p>
                                                    </div>
                                                    <div class="mt"> <a href="<%= b.getLink() %>" tabindex="0" class="btn bg-blue-ui white read">read more</a> </div>
                                                    <!--Read More Button-->
                                                </div>
                                            </div>
                                        </div>

                                        <%
                                                }
                                            }
                                        %>

                                    </div>
                                    <!--.row-->
                                </div>
                                        
                                <!--.item-->
                                <div class="carousel-item ">
                                    <div class="row">
                                        <%
                                            if (list != null && !list.isEmpty()) {
                                                for (int i = 3; i < 6 && i < list.size(); i++) {
                                                    Blog b = list.get(i);
                                        %>
                                        <div class="col-md-4" >
                                            <div class="item-box-blog">
                                                <div class="item-box-blog-image">

                                                    <!--Image-->
                                                    <figure> <img alt="" src="<%= b.getImgpath()%>" style="width: 100%; height: auto" > </figure>

                                                </div>
                                                <div class="item-box-blog-body">
                                                    <!--Heading-->
                                                    <div class="item-box-blog-heading">
                                                        <a href="<%= b.getLink() %>" tabindex="0" style="text-decoration: none">
                                                            <h5 style="color: green;"> <%= b.getTitle()%> </h5>
                                                        </a>
                                                    </div>
                                                    <!--Data-->
                                                    <div class="item-box-blog-data" style="padding: px 15px;">
                                                        <p><i class="fa fa-user-o"></i> Admin, <%= b.getPostdate()%></p>
                                                    </div>
                                                    <!--Text-->
                                                    <div class="item-box-blog-text">
                                                        <p><%= b.getDescription()%></p>
                                                    </div>
                                                    <div class="mt"> <a href="<%= b.getLink() %>" tabindex="0" class="btn bg-blue-ui white read">read more</a> </div>
                                                    <!--Read More Button-->
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                                }
                                            }
                                        %>

                                    </div>
                                    <!--.row-->
                                </div>
                                <!--.item-->
                            </div>
                            <!--.carousel-inner-->
                        </div>
                        <!--.Carousel-->
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
