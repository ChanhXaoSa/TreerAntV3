<%-- 
    Document   : blog3
    Created on : Mar 24, 2023, 1:12:03 PM
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
                            <h1>Cây phú quý: đặc điểm, tác dụng, ý nghĩa, cách trồng và chăm sóc cây – Chậu trồng cây</h1>

                            <p>Được xem là cây mang lại những may mắn, tài lộc cho gia chủ Cây phú quý còn có tác dụng trang trí cho
                                không gian sống trở nên tươi mới, điều hòa, thanh lọc không khí bảo vệ sức khỏe cho gia chủ. Vậy để
                                hiểu hơn về cây phú quý chúng ta cùng tìm hiểu chi tiết về đặc điểm, tác dụng, ý nghĩa, cách trồng
                                và chăm sóc cây trong nội dung dưới đây.</p>

                            <h4>Đặc điểm của cây Phú Qúy</h4>
                            <li>
                                Tên tiếng Anh: Aglaonema Red
                            </li>
                            <p>Là một giống cây có nguồn gốc từ Indonesia, năm 1982 nhà thực vật học người Indonesia ông Grogori đã
                                tạo ra giống cây phú quí này bằng cách lai tạo. Sau nhiều nghiên cứu và lai tạo thực nghiệm nhà khoa
                                học này đã chuyển đổi màu xanh tự nhiên của lá sang màu sắc đỏ hồng.</p>


                            <img src="img/plant/Cay phu quy 1.jfif" alt="Cây phú quý" class="img_Blog">

                            <p>Theo quan niệm phong thủy cây Phú Qúy mang lại sự may mắn, giàu sang và phú quý đúng như tên gọi của
                                nó. Cây phú quý có thân màu trắng hồng, lá màu xanh bóng đôi khi ửng vàng, viền ngoài của lá màu đỏ
                                chạy bao quanh mang ý nghĩa của sự giàu sang và ý thức cầu tiến trong cuộc sống.</p>


                            <img src="img/plant/Cay phu quy 2.jfif" alt="Cây phú quý" class="img_Blog">

                            <p>Trên thế giới tên khoa học của cây phú quý có nguồn gốc từ Hy Lap mang ý nghĩa là sáng đẹp. Còn ở
                                phương Đông gọi cây này là cây phong thủy, cây phú quý mang ý nghĩa may mắn, tốt lành. Vì vậy cây
                                Phú Quý được nhiều người lựa chọn trồng và mua tặng nhau vào các dịp tết, mừng thọ vì nó đại diện
                                cho lời chúc phú quý thịnh vượng cho gia chủ.</p>

                            <p>Xét về mệnh: cây Phú Qúy có màu đỏ được xếp vào hành Hỏa, theo quy luật tương sinh tương khắc ngũ
                                hành thì cây này hợp với người có tuổi thuộc hành Hỏa hoặc hành Thổ(vì hỏa sinh thổ). Có rất nhiều
                                người đặc biệt là dân kinh doanh rất quan tâm yếu tố phong thủy trước khi quyết định chưng bất kỳ
                                cây nào trong nhà bởi tin rằng nó sẽ làm mình may mắn hoặc lụi bại.</p>

                            <h4>Cây Phú Quý dùng để trang trí</h4>

                            <p>Bên cạnh việc gọi là loài cây phong thủy thì đối với những người không chơi phong thủy, cây phú quý
                                còn được sử dụng để trang trí trong gia đình. Cây phú quý có thể trồng trong đất và trồng thủy canh.
                                Cây thường dùng trang trí nội thất, trang trí văn phòng, bàn làm việc…</p>

                            <p>Theo báo cáo của Nasa về thực vật trồng trong nhà có tác dụng lọc sạch không khí, hấp thụ chất hữu cơ
                                dễ bay hơi gây bệnh cho con người, giảm bớt khói bụi.</p>

                            <img src="img/plant/Cay phu quy 3.jfif" alt="Cây phú quý" class="img_Blog">

                            <p>Cây Phú Qúy thủy canh: bản thân cây trồng trong chậu đã đẹp nhưng khi trồng thủy canh lại càng đẹp
                                hơn do bộ rễ dày đan xen nhau có màu trắng ngả vàng nhìn rất thích mắt. Cây Phú Qúy thủy sinh có thể
                                sống ổn định trong môi trường nước cứ mỗi 1 tuần bạn nên nhỏ vào nước vài giọt dinh dưỡng để cây
                                luôi tươi tốt.</p>

                            <p>Lưu ý trong môi trường ẩm ướt lá của cây thường hay bị úng thối vì vậy nếu phát hiện tình trạng này
                                bạn nên nhổ bỏ ngay để tránh lây lan ra các vùng lá khác. Sau đó mang phơi cây dưới ánh nắng nhẹ
                                khoảng 2 tiếng là được.</p>

                            <h4>Một số điểm cần chú ý khi chăm sóc cây Phú Quý </h4>

                            <p>Cây phú quý có thể nhân giống bằng củ, giâm từ lá nhưng phương pháp cấy mô là nhanh và hiệu quả nhất.
                                Thời gian trồng đến khi ra hoa của cây cấy mô là 2 – 2.5 tháng, cây thủy canh là giâm cây giống cắt
                                từ các thân cây trưởng thành môi trường đất để cho ra rễ có thể bón các loại phân để tạo rễ càng
                                nhiều càng tốt.</p>

                            <h4>Đối với cây phú quý thủy sinh</h4>

                            <p>Là loại cây ưa bóng, có sự phát triển mạnh về bộ rễ và nhanh ra lá mới. Chính vì vậy, cần thường để ý
                                đến việc cung cấp nước cho cây, tránh tình trạng để cho cây khô héo, có thể dẫn đến cây chết.</p>

                            <p>Tuy là cây ưa bóng nhưng thỉnh thoảng cũng nên được đưa ra hứng nắng nhẹ vào buổi sáng, khoảng 2 giờ,
                                tránh ánh nắng gay gắt trực tiếp buổi trưa. Làm như vậy giúp cho cây sinh trưởng và phát triển tốt.
                            </p>


                            <p>Cây thường bị bệnh thối lá do đặt ở vị trí quá ít ánh sáng và ẩm thấp. Khi cây mặc bệnh đó, bạn hãy
                                cắt hết phần thối, rồi dùng nước sạch để rửa toàn bộ cây, chú ý nên rửa kỹ các phần bị thối, sau đó
                                rửa sạch lại bình và thay nước mới trong bình. Đưa cây ra nơi có vị trí thoáng mát và hứng nắng vào
                                buổi sáng, giúp cây nhanh phục hồi trờ lại.</p>

                            <h4>Đối với cây phú quý trồng chậu đất</h4>

                            <li>Nên chọn những chậu cảnh có kích thước thích hợp và có đĩa đệm bên dưới để giúp cho việc cây thoát
                                nước tốt hơn, đảm bảo được bộ rễ phát triển tốt hơn và thuận lợi khi di chuyển.</li>
                            <li>Khi đặt những chậu Phú Quý trong phòng chúng ta vẫn phải đảm bảo đủ ánh sáng và lượng nước cho cây
                                để giúp cây sinh trưởng và phát triển tốt.</li>
                            <li>Đặt cây nơi có vị trí thoáng mát, gần nơi có ánh sáng tự nhiên, nếu trong không gian chặt hẹp và ít
                                ánh sáng quá, người ta có thể sử dụng đèn ánh sáng ban ngày giúp cây có thể quang hợp như môi trường
                                ngoài trời.</li>
                            <li>Đối với cây này lượng nước tươi cũng không cần nhiều, chỉ khi nào thấy đất khô thì tưới một ít nước
                                nhằm giữ ẩm, giúp cho cây được xanh hơn và đảm bảo quá trình sinh trưởng tốt.</li>
                            <p>Trên đây là những thông tin hữu ích về cây phú quý, hy vọng sẽ giúp bạn quyết định có nên trồng cây
                                hay không cũng như liệu nên trồng và chăm sóc cây như thế nào.</p>
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
