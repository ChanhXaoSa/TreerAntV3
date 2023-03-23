<%-- 
    Document   : AboutUs
    Created on : Mar 4, 2023, 7:17:01 PM
    Author     : Ducbui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/AboutUs.css"/>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>

        <!--bắt đầu header-->
        <header>
            <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-chevron-up"></i></button>   
                <c:import url="header.jsp"></c:import>
            </header>
            <!--kết thúc header-->

            <!--bắt đầu body-->
            <div class="about-section">
                <h1 class="title">Xin chào! Chúng tôi là Treer</h1>
            </div>

            <div class="container">
                <div class="row">
                    <div class="paragraph col-md-6">
                        <div class="">
                            <h3 class="title1">Về Treer</h3>
                        </div>
                        <p class="para">
                            Treer – chúng tôi là đơn vị hoạt động chuyên nghiệp trong lĩnh vực mua bán cây cảnh,… Điểm mạnh của Treer 
                            so với đối thủ đó là Treer mặc dù bản chất vẫn là một trang thương mại, chuyên mua bán cây cảnh, nhưng mặt 
                            website cũng cung cấp một lượng lớn những thông tin, kiến thức chuyên sâu dành cho người yêu cây cảnh.
                            Treer là một website chuyên cung cấp các loại cây cảnh đa dạng và chất lượng. Với mục đích mang lại không 
                            gian xanh tươi mát và tạo điểm nhấn cho không gian sống, Treer cam kết cung cấp những cây cảnh được chăm sóc 
                            và trồng trọt với tình yêu và chuyên môn cao.
                        </p>
                        <p class="para">
                            Chúng tôi luôn cập nhật các sản phẩm mới nhất và đang được yêu thích nhất trong thị trường cây cảnh. Bạn có thể tìm thấy 
                            các loại cây cảnh phong phú và đa dạng như cây cảnh nội thất, cây cảnh ngoại thất, hoa và nhiều loại cây cảnh khác nữa. 
                            Với Treer, bạn sẽ không chỉ có được các sản phẩm cây cảnh chất lượng.
                        </p>
                    </div>

                    <div class="paragraph col-md-6">
                        <div class="">
                            <h3 class="title1">Bạn cần Treer giúp gì?</h3>
                            <p>Vui lòng nhập thông tin theo mẫu bên dưới, chúng tôi sẽ liên lạc với bạn sớm nhất có thể:</p>
                        </div>
                        <div>
                            <form class="abtus" action="mainController" method="post" >
                                <label for="fname">Email của bạn</label>
                                <input type="text" class="fname" name="txtemail" placeholder="Email của bạn là..." required="">
                                <label for="fname">Tên của bạn</label>
                                <input type="text" Class="fname" name="txtname" placeholder="Tên của bạn là..." required="">
                                <label for="fname">Chủ đề</label>
                                <input type="text" class="fname" name="txttitle" placeholder="Chủ đề của bạn là..." required="">
                                <label for="subject">Nội dung</label><br>
                                <textarea type="text" class="ndung" name="txtmsg" placeholder="Nội dung của bạn là..." ></textarea>
                                <button class="gui" type="submit" name="action" value="gui" >Gửi</button>
                                <%= (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING")%>
                            </form>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="question">
                        <h1>Một số câu hỏi thường gặp</h1>
                    </div>
                    <div class="ques_txt">
                        <div class="ques">
                            <h5>[Thành viên mới] Làm sao để đăng ký tài khoản</h5>
                            <p>Vào phần đăng nhập ở trên và ấn tạo tài khoản</p>
                        </div>
                        <div class="ques">
                            <h5>[Thành viên mới] Làm sao để tra cứu đơn hàng</h5>
                            <p>Bạn cần vào trang Cá nhân > xem đơn hàng</p>
                        </div>
                        <div class="ques">
                            <h5>[Thành viên mới] Làm sao để chỉnh sửa thông tin cá nhân</h5>
                            <p>Bạn cần vào trang Cá nhân > thông tin cá nhân và chỉnh sửa</p>
                        </div>
                        <div class="ques">
                            <h5>[Cảnh báo lừa đảo] Nên và không nên làm để tránh nhận phải đơn hàng ảo/giả mạo</h5>
                            <h6>Nên và không nên làm gì?</h6>
                            <h6>KHÔNG NÊN:</h6>
                            <p>Không nên nhận hàng / thanh toán khi chưa kiểm tra thông tin</p>
                            <p>Nhận hàng và thanh toán khi đang nghi ngờ tính xác thực của đơn hàng</p>
                            <p>Không chia sẻ thông tin cá nhân, thông tin đơn hàng, thông tin thanh toán cho bất kỳ ai</p>
                            <h6>NÊN:</h6>
                            <p>Kiểm tra thông tin trước khi nhận hàng / thanh toán</p>
                            <p>Hạn chế nhờ người nhận thay, nếu nhận thay cũng cần phải kiểm tra kỹ thông tin trước khi nhận / thanh toán</p>
                        </div>
                        <div class="ques">
                            <h5>[Cảnh báo lừa đảo] Mua sắm an toàn cùng Treer</h5>
                            <p>1. Chỉ thực hiện giao dịch trên website của Treer</p>
                            <p>2. Hãy thận trọng với những tin nhắn đáng ngờ (email)</p>
                            <p>3. Không bao giờ chia sẻ mật khẩu của bạn</p>
                            <p>4. Cẩn thận với các thông tin tuyển dụng</p>
                            <p>5. Kiểm tra kỹ thông tin đơn hàng trước khi nhận</p>
                        </div>
                        <div class="ques">
                            <h5>[Thành viên mới] Làm sao để mua hàng / đặt hàng trên ứng dụng Treer?</h5>
                            <p>Bấm nút thêm vào giỏ hàng ở các mặt hàng > vào giỏ hàng > chọn mua hàng > điền thông tin nhận hàng > thanh toán</p>
                        </div>
                    </div>
                </div>
            </div>
            <!--kết thúc body-->  
            
            <script>
                
            </script>
            
            <!--bắt đầu footer-->
            <footer>        
            <c:import url="footer.jsp"></c:import>
        </footer>
        <!--kết thúc footer-->
    </body>
</html>
