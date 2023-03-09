<%-- 
    Document   : regis
    Created on : Feb 24, 2023, 3:02:29 PM
    Author     : tuank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="css/login_regis.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
    </head>
    <body>
        
        <form action="homeServlet" method="post">
            <button style="border-radius: 5px"><i class="fa fa-home" style="font-size: 50px"></i></button>                                          
        </form>
        
        <div class="login-page">
            <div>
                <style>
                    body {
                        background-image: url('img/login.webp');
                        background-repeat: no-repeat;
                        background-attachment: fixed;
                        background-size: cover;
                    }
                </style>
            </div>

            <div class="form">     
                <form class="register-form" action="mainController" method="post">                   

                    <!--nhập email-->
                    <input type="text" 
                           name="txtemail" 
                           placeholder="email"    
                           value="<%= (request.getAttribute("email") == null) ? "" : request.getAttribute("email")%>" 
                           required=""
                           />
                    
                    <!--Nhập tên-->
                    <input type="text" 
                           name="txtname" 
                           placeholder="name" 
                           value="<%= (request.getAttribute("fullname") == null) ? "" : request.getAttribute("name")%>" 
                           required=""/>
                    
                    <!--Nhập Passwords-->
                    <input type="password" 
                           name="txtpassword" 
                           placeholder="password"
                           required="" 
                           />          

                    <!--nhập phone-->
                    <input type="text" 
                           name="txtphone"
                           placeholder="phone"
                           value="<%= (request.getAttribute("phone") == null) ? "" : request.getAttribute("phone")%>" 
                           required="" 
                           />

                    <!--nút regis-->
                    <input type="submit" 
                           value="register" 
                           name="action" 
                           style="
                           background-color: #005030;
                           color: white;
                           text-transform: uppercase;
                           font-weight: 200"/>

                    <!--Thông báo hiện lên nếu email đã được đăng kí-->
                    <font style="color: red"><%= (request.getAttribute("ERROR") == null) ? "" : request.getAttribute("ERROR")%></font>
                    <p class="message"> I have an account <a href="login.jsp">Sign in</a></p>
                </form>
            </div>
        </div>
    </body>
</html>
