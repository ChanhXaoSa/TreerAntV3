<%-- 
    Document   : blog4
    Created on : Mar 24, 2023, 1:12:08 PM
    Author     : tuank
--%>

<%@page import="Treer.dao.PlantDAO"%>
<%@page import="Treer.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="css/blog_details.css">
    </head>

    <body>
        <header> 
            <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fa fa-chevron-up"></i></button>   
                <c:import url="header.jsp"></c:import>
            </header>

            <section class="body_details">
                <div>
                    <div class="left">
                        <div class="card">
                            <h1>Hướng dẫn cách chăm sóc cây kim tiền chi tiết nhất</h1>

                            <p>Trong bài viết sau đây Cây cảnh store sẽ giới thiệu đến các bạn một số kỹ thuật trồng và cách chăm
                                sóc cây kim tiền không quá phức tạp, để đảm bảo cây luôn xanh tốt và mang lại nhiều may mắn cho gia
                                chủ.</p>

                            <p>Những ai yêu thích trồng loại cây này có thể tham khảo qua phần bài viết bên dưới để có thêm kinh
                                nghiệm.</p>

                            <h4>Đôi nét về cây kim tiền</h4>

                            <p>Cây kim tiền còn có một tên gọi khác là cây phát tài, đây là một loài thực vật có hoa trong họ thiên
                                nam tinh và nguồn gốc tổ tiên từ vùng nhiệt đới Châu Á.</p>


                            <img src="img/plant/Cay kim tien 1.jpg" alt="Cây Kim Tiền" class="img_Blog">

                            <p>Cây kim tiền là dạng cây mọng nước, rễ chùm, sống lâu năm. Thân cây ngắn, vươn thẳng và xoè sang hai
                                bên đối xứng với nhau, đặc biệt ở phần gốc cây thường sẽ phình to.</p>

                            <p>Lá cây có hình bầu dục, thon dài tuy nhiên cuống lá lại ngắn, phiến lá dày màu xanh thẫm, sáng bóng
                                toát lên vẻ đẹp sang trọng và đầy sức sống.</p>

                            <p>Loại cây này đang rất được ưa chuộng hiện nay vì nó có ý nghĩa rất lớn về mặt phong thuỷ là đem lại
                                tài lộc, may mắn cho gia chủ của mình. Chính vì thế mà cây kim tiền thường được sử dụng làm cây cảnh
                                trong văn phòng công sở, phòng khách, phòng hội họp, nhà hàng, khách sạn hoặc dùng làm quà tặng
                                trong các dịp lễ tết, thăng chức, khai trương…</p>

                            <p>Tiếp theo hãy cùng Cây cảnh store tìm hiểu về các cách chăm sóc cây kim tiền cũng như kỹ thuật trồng
                                loại cây này như thế nào trong phần nội dung dưới đây.</p>

                            <h4>Kỹ thuật trồng cây kim tiền</h4>

                            <p>Cây kim tiền là loại cây dễ sống nên việc trồng khá đơn giản và không đòi hỏi quá nhiều kỹ thuật.</p>

                            <li>Chọn đất trồng cây</li><br>
                            <img src="img/plant/Cay kim tien 2.png" alt="Cây Kim Tiền" class="img_Blog">
                            <p>Cây kim tiền thích nghi được với nhiều loại đất, đặc biệt chúng sinh trưởng phát triển tốt trên loại
                                đất chua có độ PH từ 5,5 – 6,5.</p>

                            <p>Nên các bạn có thể chọn loại đất có độ mùn xốp, màu mỡ và thoát nước nhanh để trồng.</p>
                            <p>Bạn cũng có thể trộn đất phù sa chung mùn trấu, xỉ than tổ ong nghiền nhỏ với tỉ lệ 1/3 để tạo độ
                                thông thoáng cho đất. Hoặc mua loại đất vi sinh ngoài cửa hàng cây cảnh về trồng để giúp tối ưu tốt
                                cho cây mà không cần phải chăm sóc quá nhiều.</p>

                            <li>Chọn chậu trồng cây</li>

                            <p>Các bạn nên chọn những kiểu chậu có kích thước lớn để trồng cây kim tiền, bởi vì giống cây này có bộ
                                rễ rất khoẻ và phát triển mạnh nên cần một không gian đủ lớn.</p>

                            <p>Nếu ngay từ đầu các bạn chọn chậu lớn thì sẽ đỡ mất công chuyển chậu sau này nếu cây lớn không có đủ
                                diện tích để rễ phát triển.</p>

                            <li>Vị trí đặt cây</li>

                            <img src="img/plant/Cay kim tien 3.jpg" alt="Cây Kim Tiền" class="img_Blog">

                            <p>Để cây có thể sinh trưởng và phát triển tốt nên đặt cây ở những vị trí thông thoáng, nhiều gió, ánh
                                sáng đầy đủ nhưng không quá gắt.</p>

                            <p>Một số vị trí bạn có thể đặt cây kim tiền như ban công, hiên nhà, cạnh cửa sổ…</p>

                            <h4>Hướng dẫn cách chăm sóc cây kim tiền chi tiết nhất</h4>

                            <p>Tuy là loại cây dễ sống, dễ trồng và không cần đòi hỏi phải chăm sóc quá kỹ lưỡng. Tuy nhiên các bạn
                                cần lưu ý một số vấn đề sau đây trong quá trình chăm sóc cây kim tiền để chúng thực sự khỏe mạnh và
                                phát triển tốt.</p>

                            <p>Thời điểm cây nở hoa là thời điểm phát huy mạnh mẽ tính phong thuỷ của nó nhất.</p>

                            <h4>Đối với cây phú quý trồng chậu đất</h4>

                            <li>Tưới nước</li>

                            <p>Là loại cây mọng nước nhưng cây kim tiền lại có khả năng chịu hạn rất kém. Vì vậy yêu cầu lượng nước
                                tưới phải vừa đủ, không cần quá nhiều.</p>
                            <p>Nếu cây đặt trong nhà thì chỉ cần tưới 1 lần/1 tuần là đủ. Đặc biệt nếu đặt ở phòng có máy lạnh thì
                                nên giảm lượng nước tưới xuống một chút.</p>
                            <p>Còn nếu cây được đặt ở ngoài trời thì tuỳ vào thời tiết mà có thể điều chỉnh số lần tưới vào khoảng
                                2-3 lần/1 tuần.</p>
                            <p>Lưu ý khi tưới tốt nhất nên dùng bình xịt lên lá, thân, đất để toàn cây đều được tươi mát. Không nên
                                tưới quá nhiều nước bởi phần lớn cây kim tiền chết đều là do thừa nước chứ ít khi nào chết do thiếu
                                nước. Vì thế chỉ cần tưới đủ ẩm trong đất có trong chậu là được.</p>
                            <li>Ánh sáng</li>
                            <p>Loài cây kim tiền rất thích ánh nắng nhưng chúng vẫn có thể phát triển bình thường trong điều kiện
                                bóng râm. Vì vậy các bạn hoàn toàn có thể đặt cây trong nhà, lâu lâu có thể mang ra ngoài để cây hấp
                                thụ ánh nắng, tuy nhiên tuyệt đối không nên đặt cây dưới ánh sáng mặt trời trực tiếp và nên có lưới
                                che để tránh nước mưa. Bởi khi bị sối nước quá nhiều cây sẽ bị thối và vàng lá, thậm chí là chết
                                cây.</p>

                            <li>Nhiệt độ và độ ẩm</li>
                            <p>Đây là loại cây chịu được nhiệt độ tương đối cao và nhiệt độ tối ưu để cây kim tiền phát triển tốt
                                nhất là từ 25-270C.</p>
                            <p>Nếu đặt cây ở nhiệt độ dưới 180C trong khoảng thời gian dài thì cây sẽ có hiện tượng rụng lá và rơi
                                vào trạng thái ngủ đông. Và nếu nhiệt độ càng xuống thấp thì cây kim tiền sẽ chết.</p>
                            <p>Còn về độ ẩm thì cây kim tiền có thể phát triển tốt ở cả môi trường có độ ẩm thấp lẫn độ ẩm cao.</p>

                            <li>Bón phân</li>
                            <p>Để cây phát triển xanh tốt và tránh sâu bệnh, bạn nên bón phân cho cây khoảng 1 lần sau 2-3 tháng.
                                Đặc biệt là giai đoạn cây chuẩn bị đẻ nhánh, lúc này bạn nên bón thúc và sử dụng loại phân bón NPK
                                mua ở các cửa hàng bán cây cảnh để bổ sung dinh dưỡng cho cây.</p>

                            <li>Vệ sinh lá, cắt tỉa phần thối héo</li>
                            <p>Vệ sinh lá thường xuyên sẽ giúp cây dễ “thở” và dễ quang hợp hơn, từ đó cây sẽ được phát triển một
                                cách toàn diện nhất.</p>
                            <p>Cách vệ sinh lá đúng cách là sử dụng khăn ướt nhẹ nhàng lau sạch phần bụi bẩn bám vào lá, thân và cả
                                phần xung quanh chậu.</p>
                            <p>Đối với những vùng có lá hoặc nhánh bị héo, úa, vàng, thối thì bạn nên dùng kéo để loại bỏ càng sớm
                                càng tốt, tránh để chúng lây lan sang những nhánh cây khác.</p>

                            <li>Cách chăm sóc cây kim tiền phòng trừ sâu bệnh</li>
                            <p>Cây kim tiền thường gặp một số bệnh như lá trắng bệch do thiếu ánh sáng hoặc vàng lá, thối rể do thừa
                                nước, úng nước…</p>
                            <p>Lúc này để khắc phục bệnh, bạn hãy mang cây ra ngoài ánh sáng như ban công, cửa sổ, hành lang…nơi có
                                môi trường thông thoáng và nhiệt độ cao, cây sẽ nhanh thoát nước hơn hoặc dừng hẳn việc tưới nước để
                                cân bằng lại tình trạng thoát nước của cây.</p>

                            <h3>Tổng kết cách chăm sóc cây kim tiền</h3>
                            <p>Trên đây là một số cách chăm sóc cây kim tiền cơ bản nhưng rất hiệu quả, giúp cây sinh trưởng phát
                                triển tốt, mang ý nghĩa đem lại nhiều tài lộc, may mắn cho gia chủ.</p>
                            <p>Chỉ cần bạn dành ra một chút thời gian để chăm sóc, quan tâm thì việc cây phát triển xanh tốt là điều
                                rất dễ dàng.</p>

                        </div>
                    </div>

                    <div class="right">
                        <div class="card">
                            <h2>About Me</h2>
                            <div class="picture"><a href="index.jsp"><img src="img/Logo.jpg" alt="Logo"
                                                                          style="width: 90%; height: auto;"></a></div>
                            <p>Một trang web mua bán cây cảnh</p>
                            <h3>Thông tin cửa hàng</h3>
                            <p>- Cửa hàng tại TP.HCM</p>
                            <p>- Địa chỉ: <a href="https://goo.gl/maps/MXV6y2QfXaHgrYMg8" style="text-decoration: none">Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành
                                    Phố Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam</a></p>
                            <p>SĐT: </p>
                        </div>
                        <div class="card">
                            <h3>Sản phẩm mới</h3>

                            <table style="width: 100%; height: auto;">
                            <%
                                ArrayList<Plant> list;
                                list = PlantDAO.printNewPlant();
                                for (int i = 0; i < 3 && i < list.size(); i++) {
                                    Plant p = list.get(i);
                            %>
                            <tr>
                                <th class="col-3">
                                    <img src="<%= p.getImgpath()%>" alt="<%= p.getName()%>" style="width: 100%; height: auto">
                                </th>
                                <th class="col-9" >
                                    <a href="productDetailServlet?PID=<%= p.getId()%>" style="text-decoration: none;"><p style="margin-left: 10px"><%= p.getName()%></p></a>
                                </th>
                            </tr>
                            <%

                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <!-- Js Plugins -->
        <script src="js/main.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.slicknav.js"></script> 
    </body>

</html>