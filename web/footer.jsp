<%-- 
    Document   : footer
    Created on : Feb 22, 2023, 12:31:48 AM
    Author     : tuank
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>footer</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- css style -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css>" type="text/css">
    </head>
    
    <body>
        <!-- Footer Section -->
        <footer>  
            <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-chevron-up"></i></button>
            <div style="text-align: center">
                <div class="social-icons" style="display: inline-block">
                    <ul class="list-unstyled list-inline listicon float-right mt-0">
                        <li class="list-inline-item">
                            <a target="_blank" href="#" title="Faceboook" class="face"><i
                                    class="fa fa-facebook" re="nofollow"></i></a>
                        </li>
                        <li class="list-inline-item">
                            <a target="_blank" rel="nofollow" href="#" title="Twitter" class="twitter"><i
                                    class="fa fa-twitter"></i></a>
                        </li>
                        <li class="list-inline-item">
                            <a target="_blank" rel="nofollow" href="#" title="Instagram"
                               class="instagram"><i class="fa fa-instagram"></i></a>
                        </li>
                        <li class="list-inline-item">
                            <a rel="nofollow" href="#" title="Email" class="mail-envelope"><i
                                    class="fa fa-envelope-o"></i></a>
                        </li>
                        <li class="list-inline-item">
                            <a target="_blank" rel="nofollow" href="#" title="Youtube" class="youtube"><i
                                    class="fa fa-youtube-play"></i></a>
                        </li>
                        <li>
                            <p class="tel-topheader text-center">Tel (099) 9999 9999</p>     
                        </li>
                    </ul>
                </div>  
            </div>
            

            <p>© 2023 Example Company, Inc. All rights reserved.</p>
            <p><a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a></p>
        </footer>
        <!-- Footer Section end -->

        <!-- Js Plugins -->
        <script src="js/main.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>

        <!--code về lại đầu trang-->
        <script>
                // back to top
                // Get the button:
                let mybutton = document.getElementById("myBtn");

                // When the user scrolls down 20px from the top of the document, show the button
                window.onscroll = function () {
                    scrollFunction();
                };

                function scrollFunction() {
                    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                        mybutton.style.display = "block";
                    } else {
                        mybutton.style.display = "none";
                    }
                }

                // When the user clicks on the button, scroll to the top of the document
                function topFunction() {
                    document.body.scrollTop = 0; // For Safari
                    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
                }
        </script>

    </body>
</html>
