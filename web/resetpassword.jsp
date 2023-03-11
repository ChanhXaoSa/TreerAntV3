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
        <title>Reset Password</title>
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
                <form class="login-form" action="mainController" method="post" onsubmit="return validateForm()">
                    <input type="text" placeholder="Email" name="txtemail" required="" id="txtemail"/>
                    <button type="submit" value="reset" name="action" 
                            style="background-color: #005030;
                            color: white;
                            text-transform: uppercase;
                            ont-weight: 200">reset password</button> 
                </form>
                <%= (request.getAttribute("WARNING") == null) ? "" : request.getAttribute("WARNING")%>
                <p class="message">Back to login page? <a href="login.jsp">Sign in</a></p>
            </div>

            <script>
                function validateForm() {
                    var email = document.getElementById("txtemail").value;
                    var emailRegex = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,})+$/;
                    if (!emailRegex.test(email)) {
                        alert("Email sai định dạng, hãy nhập lại!!");
                        return false;
                    }
                    return true;
                }
            </script>

        </div>
    </body>
</html>
