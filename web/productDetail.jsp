<%-- 
    Document   : productDetail
    Created on : Feb 25, 2023, 12:01:04 AM
    Author     : tuank
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="Treer.dto.Reply"%>
<%@page import="java.util.List"%>
<%@page import="Treer.dao.CommentDAO"%>
<%@page import="Treer.dto.Comment"%>
<%@page import="Treer.dao.WishListDAO"%>
<%@page import="Treer.dto.WishList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Treer.dao.PlantDAO"%>
<%@page import="Treer.dto.Plant"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product details</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/product_details.css" rel="stylesheet" type="text/css">

        <!--comment-->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>    
        <header><c:import url="header.jsp"></c:import></header>


            <div class="container">
                <div class="card">
                    <div class="container-fliud">
                        <div class="wrapper row">

                        <%
                            int accid = 0;
                            accid = (int) session.getAttribute("accid");
                            String PID = request.getParameter("PID");
                            int intPID = Integer.parseInt(PID);
                            Plant p = PlantDAO.getPlantwithPID(intPID);

                            boolean check = WishListDAO.checkWishList(accid, intPID);
                        %>

                        <div class="preview col-md-6">

                            <div class="preview-pic tab-content">
                                <div class="tab-pane active" id="pic-1"
                                     style="width: 70%;
                                     height: auto;
                                     margin-left: 20%"><img src="<%= p.getImgpath()%>" /></div>
                                <div class="tab-pane" id="pic-2"><img src="http://placekitten.com/400/252" /></div>
                                <div class="tab-pane" id="pic-3"><img src="http://placekitten.com/400/252" /></div>
                                <div class="tab-pane" id="pic-4"><img src="http://placekitten.com/400/252" /></div>
                                <div class="tab-pane" id="pic-5"><img src="http://placekitten.com/400/252" /></div>
                            </div>

                        </div>
                        <div class="details col-md-6">
                            <h3 class="product-title"><%= p.getName()%></h3>
                            <div class="rating">
                                <div class="stars">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </div>

                            </div>
                            <p class="product-description"><%= p.getDescription()%></p>
                            <h4> 
                                <%
                                    int price = p.getPrice();
                                    int sale = p.getSale();
                                    String formattedPrice = "";
                                    String formattedSale = "";

                                    NumberFormat nf = NumberFormat.getInstance();
                                    nf.setGroupingUsed(true);
                                    formattedPrice = nf.format(price);
                                    formattedSale = nf.format(sale);

                                %>
                                <span style="text-decoration: line-through; font-size: 15px; color: gray">
                                    <%= p.getPrice() == p.getSale() ? "" : formattedPrice + " VND"%> </span>
                                    <span style="color: #FF9F1A"><%= formattedSale %> VND</span>
                            </h4>
                            
                            <i><span><%= p.getStatus() == 1 ? "Còn " + p.getStock() + " sản phẩm" : "Đã hết hàng"%></span></i>
                            <i><span><%= "Đã bán " + p.getSold() + " sản phẩm"%></span></i>
                            <h3><br></h3>
                                <%
                                    if (p.getStatus() == 1 && accid != 0) {
                                %>    
                            <div class="action">
                                <input type="number" value="1" style="text-align: center; width: 20%">                
                                <button class="add-to-cart btn btn-default" type="button">Thêm vào giỏ hàng</button>
                                <%
                                    if (check == true) {%>
                                <a class="like btn btn-default" href="wishlistServlet?PlantID=<%= intPID%>" ><span class="fa fa-heart" style="color: red"></span></a>
                                    <%
                                    } else if (check == false) {%>
                                <a class="like btn btn-default" href="wishlistServlet?PlantID=<%= intPID%>" ><span class="fa fa-heart" style="color: black"></span></a>
                                    <%
                                        }
                                    %>                              
                            </div>
                            <%
                            } else if (p.getStatus() == 0 && accid != 0) {
                            %>
                            <div class="action">
                                <button class="add-to-cart btn btn-default" type="button">Đã hết hàng</button>
                                <%
                                    if (check == true) {%>
                                <a class="like btn btn-default" href="wishlistServlet?PlantID=<%= intPID%>" ><span class="fa fa-heart" style="color: red"></span></a>
                                    <%
                                    } else if (check == false) {%>
                                <a class="like btn btn-default" href="wishlistServlet?PlantID=<%= intPID%>" ><span class="fa fa-heart" style="color: black"></span></a>
                                    <%
                                        }
                                    %>                    
                            <br>
                            <i>Vui lòng liên hệ 0394 XXX XXX để đặt hàng trước</i>
                            </div>  
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>

                <!--Viết 1 comment-->
                <div class="col-md-2">
                    <h1><br></h1>
                    <button onclick="showForm()" class="float-right btn btn-outline-primary ml-2"><i></i>Bình luận sản phẩm</button>
                    <!-- Comment reply form -->
                    <div style="margin-top: 60px">
                        <form id="myForm" style="display:none;" action="mainController" method="post">

                            <input type="hidden" name="PID" value="<%= intPID%>"/>
                            <textarea id="myInput" name="CmtContent" rows="3" required="" style="width: 500px"></textarea>

                            <button name="action" value="createComment" class="btn btn-default">Gửi bình luận</button>
                        </form>
            </div>
                </div>

                <script>
                    function showForm() {
                        var form = document.getElementById("myForm");
                        form.style.display = "block";
                    }
                </script>

                <!--Hiển thị comment-->

                <div class="card">
                    <%
                        List<Comment> comments = CommentDAO.getAllComments(intPID);
                        if (!comments.isEmpty()) {
                            for (Comment comment : comments) {
                                ArrayList<Reply> replist = CommentDAO.getReplies(comment.getId());
                    %>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-2">
                                <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid" style="width: 40%"/>
                                <p class="text-secondary text-center"><%= comment.getTime()%></p>
                            </div>
                            <div class="col-md-10">
                                <p>
                                    <a class="float-left"><strong><%= comment.getUserName()%></strong></a>
                                    <br>
                                </p>
                                <div class="clearfix"><%= comment.getContent()%></div>
                                <p></p>

                                <p>
                                    <a class="float-right btn btn-outline-primary ml-2 reply-btn"> <i class="fa fa-reply"></i>Reply</a>
                                </p>
                                <div class="reply-form" style="display:none;">
                                    <form action="mainController" method="post">    
                                        <input type="hidden" name="PID" value="<%= intPID%>"/>
                                        <input type="hidden" name="CommentID" value="<%= comment.getId()%>"/>                                      
                                        <textarea name="reply-content" class="form-control" placeholder="Type your reply here..."></textarea>
                                        <button type="submit" value="repComment" class="btn btn-primary mt-2" name="action">Gửi bình luận</button>
                                    </form>
                                </div>
                                <script>
                                    $(document).ready(function () {
                                        $(".reply-btn").click(function () {
                                            $(this).parent().siblings(".reply-form").toggle();
                                        });
                                    });
                                </script>
                            </div>
                        </div>  
                        <!--đây là phần rep tin nhắn, nếu có người phản hồi-->
                        <%
                            if (replist.size() != 0) {
                                for (Reply reply : replist) {
                        %>
                        <div class="card card-inner" style="border: 0; padding: 0">
                            <div class="row" style="margin-left: 50px">
                                <div class="col-md-2">
                                    <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid" style="width: 40%"/>
                                    <p class="text-secondary text-center"><%= reply.getTime()%></p>
                                </div>
                                <div class="col-md-10">
                                    <p><strong><%= reply.getUserName()%></strong></p>
                                    <p><%= reply.getContent()%></p>   
                                </div>
                            </div>   
                        </div>
                        <%
                                }
                            }
                        %> 
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <div class="card card-inner" style="border: 0; padding: 0; text-align: center">
                        <p>Chưa có bình luận nào cho sản phẩm này</p>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

            <!--To Work with icons-->
            <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

            <h1><br></h1>
            <h3>Sản phẩm bán chạy</h3>
            <c:import url="productpart.jsp"></c:import>
            </div>

            <footer><c:import url="footer.jsp"></c:import></footer>
    </body>
</html>
