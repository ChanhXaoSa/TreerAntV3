<%-- 
    Document   : login
    Created on : Feb 24, 2023, 3:02:22 PM
    Author     : tuank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
                <form class="login-form" action="mainController" method="post">
                    <input type="text" placeholder="username" name="txtemail"/>
                    <input type="password" placeholder="password" name="txtpassword"/>
                    <input type="submit" value="login" name="action" style="
                           background-color: #005030; 
                           color: white; 
                           text-transform: uppercase; 
                           font-weight: 200 ">     
                    
                    <!--Thông báo được hiện lên nếu như sai Email hoặc password-->
                    <font style="color: red; border-width: 0;"><%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%></font>
                    <p class="message">Not registered? <a href="regis.jsp">Create an account</a></p>              
                </form>
            </div>
        </div>
    </body>
</html>
