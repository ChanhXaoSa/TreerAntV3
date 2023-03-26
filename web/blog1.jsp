<%-- 
    Document   : blog1
    Created on : Mar 24, 2023, 12:49:04 PM
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
                            <h1>Ý nghĩa và cách trồng cây dừa cảnh phong thủy</h1>
                            <p>Cây dừa cảnh là một trong những loại cây phong thủy mang đến may mắn,
                                bình yên cho gia chủ. Đây là một loại cây dễ trồng và chăm sóc, bạn có
                                thể trồng trong vườn hoặc trong nhà đều rất thích hợp.</p>
                            <h4>1. Cây dừa cảnh là cây gì?</h4>

                            <img src="img/plant/Cay dua canh 1.jpg" alt="Cây dừa cảnh" class="img_Blog">

                            <p>Cây dừa cảnh thuộc giống cây họ dừa, chúng được lai giữa cây dừa và cây
                                cau nên có những đặc điểm giống hai loại cây này. Thân cây dừa cảnh có kích
                                thước khá nhỏ, thân mỗi cây có bán kính khoảng 10cm và mọc thành nhiều nhánh
                                con, tỏa thành chùm. Phần gốc cây thường có u lớn khi cây phát triển tốt. Lá
                                cây dừa cạn mảnh, nhỏ và ngắn. Cây dừa cảnh còn được gọi bằng một số tên khác
                                như cây cau vàng, cây cau cọ, cây dừa nước cảnh,…</p>

                            <p>Cây dừa cảnh khi được trồng dưới đất lâu năm cây có thể
                                cao đến 1m và sẽ cho ra hoa màu trắng sữa hoặc trắng ngà. Hoa thường
                                mọc thành từng cụm và tỏa hương thơm dịu nhẹ. Quả của cây dừa cảnh
                                khá giống với quả cau, màu xanh khi còn non và dần ngả sang vàng
                                sậm khi chín. Quả của cây dừa cảnh ăn được nhưng vị khá chát và ngọt nhẹ.</p>

                            <h4>2. Ý nghĩa của cây dừa cảnh trong phong thủy</h4>

                            <p>Cây dừa cảnh ngoài khả năng ngăn bụi, cung cấp oxi và tạo thêm mảng xanh trong
                                nhà, trong văn phòng hoặc công ty, chúng còn mang ý nghĩa về mặt phong thủy.</p>

                            <p>Cây dừa cảnh giúp tăng cường dương khí và giảm âm khí từ bên ngoài vào. Thế nên,
                                rất nhiều công ty và cửa hàng kinh doanh đặt 2 chậu cây dừa cảnh tại cửa ra vào hoặc
                                đặt cây dừa cảnh trong công ty, cửa hàng. Như vậy, cây dừa cảnh không những giúp
                                trang trí cho khuôn viên công ty, cửa hàng mà còn giúp thu hút sự may mắn, thuận
                                lợi trong công việc. Ngoài ra, thân cây dừa cảnh thẳng đứng, gốc to và vững chãi,
                                tàu lá xum xuê cũng mang ý nghĩa thịnh vượng trong kinh doanh.</p>

                            <img src="img/plant/Cay dua canh 2.jpg" alt="Cây dừa cảnh 2" class="img_Blog">

                            <p>Cây dừa cảnh được trồng trong nhà mang ý nghĩa của sự bình yên, xua đuổi những
                                điều xúi quẩy không hay. Bên cạnh đó, cây dừa cảnh giúp các thành viên trong
                                gia đình gặp nhiều may mắn, tài lộc.</p>

                            <h4>3.Cây dừa cảnh hợp mệnh nào, tuổi nào?</h4>

                            <p>Cây dừa cảnh có thân gỗ do đó, cây rất hợp với người mệnh Mộc.
                                Cây dừa cảnh sẽ mang lại tài vận, may mắn và sự bình an đến người mệnh Mộc.</p>

                            <p>Những tuổi có mệnh tương ứng, sẽ phù hợp trồng cây tương ứng. Do đó, những tuổi thuộc mệnh Mộc sẽ phù hợp
                                trồng cây dừa cạn, gồm:
                                Kỷ Hợi (1959, 2019), Mậu Thìn (1988), Nhâm Tý (1972), Kỷ Tỵ (1989), Canh Dần (1953, 2010), Quý Sửu (1973),
                                Tân
                                Dậu (1981)</p>

                            <h4>4.Cách bày trí cây dừa cảnh tốt cho phong thủy</h4>

                            <p>Để cây dừa cảnh vận khí tốt, người ta thường đặt 2 chậu dừa cảnh đối xứng ở cửa ra vào.
                                Như thế, dừa cảnh sẽ tăng dương khí và đẩy lùi âm khí, mang đến sự thuận lợi, may mắn.
                                Đây là nơi đặt cây dừa cảnh tốt cho phong thủy tại những nơi diễn ra hoạt động kinh doanh, buôn bán.</p>

                            <p>Đối với nhà ở, cây dừa cảnh nên được đặt trong vườn nhà hoặc phòng khách gần cửa ra vào hoặc
                                dưới chân cầu thang để cây có thể mang đến sự bình an, may mắn cho gia đình của gia chủ. Đối
                                với những cây có kích thước để bàn, bạn cũng có thể đặt trên bàn làm việc để tăng khả năng tập
                                trung và giúp công việc được diễn ra suôn sẻ.</p>

                            <img src="img/plant/Cay dua canh 3.png" alt="Cây dừa cảnh 3" class="img_Blog">

                            <h4>5.Cách trồng và chăm sóc cây dừa cảnh phong thủy</h4>
                            <h4>Cách trồng cây dừa cảnh</h4>
                            <p>Bước 1: Chọn giống</p>
                            <p>Việc chọn giống cây quyết định rất nhiều đến khả năng sinh trưởng của cây sau này.
                                Cây dừa cảnh tốt và khỏe mạnh là cây có thân thẳng tắp, rắn chắc, tàu lá xum xuê,
                                lá xanh ươm, không có sâu hay bệnh tật.</p>

                            <p>Bước 2: Chuẩn bị đất</p>
                            <p>Cây dừa cảnh không kén đất trồng, tuy nhiên chúng rất thích những loại đất dinh dưỡng. Do đó, bạn có thể
                                mua
                                đất phù sa, trộn với đất thịt và xơ dừa hoặc mùn cưa để tăng dinh dưỡng và tạo độ tơi xốp cho đất.</p>

                            <p>Bước 3: Trồng cây</p>
                            <p>Bạn trải đất khoảng 3/2 chậu cây, sau đó tạo một một lỗ trống vừa phải để đặt cây vào. Sau khi đặt cây vào
                                một cách cẩn thận, bạn lấp đất kín rễ và một phần thân cây. Bạn dùng lực nén để nén đất chặt vừa phải để đất
                                không bị đổ ra ngoài, không nén quá chặt sẽ khiến rễ cây bị gây áp lực.</p>

                            <p>Bước 4: Tưới cây</p>
                            <p>Tiếp đến, bạn tưới cây ở dạng phun sương để tạo độ ẩm cho cây ở mức vừa phải.</p>

                            <h4>Cách chăm sóc</h4>

                            <p>Cây dừa cảnh rất ưa ánh sáng, do đó, bạn nên đặt cây ở chỗ có nhiều ánh sáng để cây phát triển một cách tốt
                                nhất.</p>
                            <p>Cây dừa cảnh cần được bón phân định kỳ 2 lần/năm. Bạn nên bón phân cho cây vào đầu mùa mưa và cuối mùa mưa.
                                Bên cạnh đó, bạn có thể pha phân với bùn rồi bón lên cây hoặc rải xung quanh gốc cây dừa.</p>
                            <p>Độ ưa nước của cây dừa cảnh ở mức trung bình, do đó, bạn có thể tưới nước cho cây mỗi ngày ở mức vừa phải.
                                Vào mùa khô, bạn có thể tưới nước nhiều lần trong ngày.</p>
                            <p>Khi cây đủ 2 năm tuổi, bạn nên xịt thuốc trừ sâu để ngăn ngừa sâu bọ, đặc biệt là bọ cánh cứng đến phá cây,
                                gây tổn hại cho cây.</p>
                            <p>Bách hóa XANh hy vọng từ những thông tin trên, bạn sẽ biết thêm được nhiều ý nghĩa phong thủy cũng như cách
                                trồng và chăm sóc cây dừa cảnh.</p>

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
