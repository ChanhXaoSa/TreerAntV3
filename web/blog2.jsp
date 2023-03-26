<%-- 
    Document   : blog2
    Created on : Mar 24, 2023, 1:11:53 PM
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
                            <h1>Ý nghĩa, cách trồng và chăm sóc cây hoa giấy để cây luôn ra hoa</h1>
                            <p>Hoa giấy có cách trồng và cách chăm sóc như thế nào? Hãy cùng Bách hóa XANH tìm hiểu các thông tin về
                                ý nghĩa, cách trồng và chăm sóc cây hoa giấy để cây luôn ra hoa nhé!</p>
                            <h4>1. Giới thiệu về cây hoa giấy</h4>

                            <img src="img/plant/Hoa giay 3.jfif" alt="Cây dừa cảnh" class="img_Blog">

                            <p>Cây hoa giấy là loại hoa có nét đẹp giản dị, ngoài ra nó còn có tên gọi khác là cây bông giấy hay móc
                                diều (tên khoa học là Bougainvillea spectabilis, tên tiếng Anh là Bougainvillea, Paper Flower), loài
                                hoa này thuộc họ thực vật Nyctaginaceae. Tên của loài hoa này được đặt dựa trên đặc điểm bên ngoài
                                của nó, đó là nét đẹp mỏng manh nhưng kiên cường bởi sức chịu hạn khá tốt, cho hoa quanh năm; hơn
                                nữa cánh hoa của loài hoa này trông khá giống những tờ giấy mềm mại, mỏng manh.</p>

                            <p>Theo nhiều nghiên cứu thì hoa giấy có nguồn gốc từ Brazil (Nam Châu Mỹ) và sau này du nhập đến các
                                nước khác đặc biệt là những nước có khí hậu nhiệt đới (cây dễ thích nghi) và lai tạo ra nhiều loại
                                khác (hoa giấy Thái Lan, hoa giấy Mỹ,…). Bởi nước ta cũng nằm trong vùng khí hậu nhiệt đới nên rất
                                dễ dàng trồng và được trồng ở nhiều nơi trên cả nước để làm cảnh, lấy bóng mát (làm thành giàn cho
                                cây leo),…</p>

                            <h4>2. Đặc điểm hoa giấy</h4>

                            <p>Cây hoa giấy thuộc dạng cây thân gỗ và có thể mọc leo, vươn dài và khả năng mọc khá nhanh với nhiều
                                cành và có gai. Lá cây có màu xanh thẫm (xanh quanh năm), hình trái xoan (thuôn ở phần đỉnh lá, phần
                                gốc lá lại tròn, hơi cong) và mọc so le.</p>

                            <p>Hoa giấy mọc thành chùm ở đầu ngọn cành; tuy có nhiều màu nhưng thực chất đó là những lá bắc hình
                                thành nên (lá bắc có dạng lá và nhiều màu tạo nên các màu sắc của hoa giấy), hoa hình ống dài bên
                                trong (màu trắng hoặc hơi vàng) thường được lá bắc xếp 3 chiếc một bao bọc lấy. Quả của cây hoa giấy
                                tuy hiếm thấy nhưng đặc điểm nhận dạng đó là quả bế tròn và có màu nâu.</p>

                            <img src="img/plant/Hoa giay 2.jfif" alt="Cây dừa cảnh 2" class="img_Blog">

                            <p>Cây hoa giấy là cây dễ trồng, dễ chăm sóc, tuy nhiên bạn cũng nên chú ý một số đặc điểm sau đây để dễ
                                dàng trồng và chăm sóc cây nhé!</p>

                            <h4>3.Ý nghĩa, lợi ích cây hoa giấy</h4>
                            <h4>Ý nghĩa phong thủy</h4>

                            <p>Đặc điểm hình dáng của cây hoa giấy như đã phân tích ở trên là cây dạng leo, có nhiều cành nên trông
                                rất xum xuê chính vì vậy mà trong phong thủy, loại cây này tượng trưng cho sự đủ đầy, chở che, hạnh
                                phúc vẹn tròn. Cây hoa giấy có hoa mang nhiều loại màu sắc tươi sáng nên còn tượng trưng cho những
                                may mắn, phát tài, phát lộc cho gia đình. Ngoài ra, theo quan niệm dân gian thì hoa giấy có tác dụng
                                xua đuổi tà ma, ngăn chặn điềm xấu.</p>

                            <h4>Ý nghĩa trong tình yêu</h4>

                            <p>Cây hoa giấy mang vẻ đẹp giản dị, thanh thuần và sức sống mãnh liệt trong điều kiện khắc nghiệt nên
                                trong tình yêu loài cây này mang ý nghĩa tình yêu giản dị, bền lâu và chân thành.</p>

                            <h4>Ý nghĩa về màu sắc hoa giấy</h4>

                            <p>Cây hoa giấy có rất nhiều màu sắc, mỗi màu sắc sẽ mang một ý nghĩa đặc biệt của riêng nó, cụ thể:
                                <br><br>
                                - Hoa giấy màu đỏ: Thể hiện tính cách cương quyết, mạnh mẽ, khát vọng vươn lên. <br>
                                - Hoa giấy màu hồng: Biểu tượng cho vẻ đẹp nhẹ nhàng, nữ tính và chút trữ tình. <br>
                                - Hoa giấy màu tím: Vốn dĩ màu tím là màu đặc trưng của sự thủy chung nên hoa giấy màu này rõ ràng
                                <br>
                                biểu tượng cho sự thủy chung và tạo nên một vẻ đẹp lãng mạn thu hút mọi ánh nhìn. <br>
                                Hoa giấy màu trắng: Là biểu tượng cho sự tinh khiết, thanh thuần. <br> <br>
                                Ngoài ra, bạn còn có thể chọn màu sắc cây hoa giấy dựa vào mệnh của gia chủ, bạn hãy chọn những màu
                                sắc may mắn cho mệnh của mình là được nhé (ví dụ: người mệnh kim có thể chọn màu sắc phong thủy của
                                hoa giấy tương sinh là màu vàng).
                            </p>

                            <img src="img/plant/Hoa giay 1.jfif" alt="Cây hoa giấy 3" class="img_Blog">

                            <h4>Lợi ích của hoa giấy</h4>
                            <p>Cây hoa giấy được trồng ở nhiều nơi và có nhiều lợi ích trong cuộc sống của chúng ta như: Trồng để
                                làm cây bonsai; trang trí cảnh quan nhà,… Cụ thể là:</p>

                            <h4>Trồng làm cây bonsai</h4>
                            <p>Với những người yêu thích nghệ thuật và đam mê cây cảnh thì cách trồng này rất phù hợp bởi cây hoa
                                giấy là dạng cây leo, có nhiều cành nên rất dễ tạo dáng. Ngoài ra, màu sắc của cây hoa giấy cũng đa
                                dạng nên bạn có thể tạo ra những cây bonsai rất đẹp.</p>

                            <h4>Trang trí cho cảnh quan ngôi nhà bạn</h4>
                            <p>Cây hoa giấy được trồng phổ biến ở tất cả các miền bởi nó rất dễ trồng, dễ chăm và có sức sống dẻo
                                dai. Đối với các gia đình, họ thường trồng cây hoa giấy để tạo thêm bóng mát hoặc tô điểm cảnh quan
                                của ngôi nhà thêm ấn tượng, gần gũi thiên nhiên như trồng thành giàn trước cổng nhà, trồng ở trong
                                vườn,…</p>

                            <h4>Trang trí cho các công trình cảnh quan đô thị</h4>
                            <p>Với đặc tính là loài cây dễ uốn thành nhiều kiểu (dạng vòm hoặc trồng thành dải rồi cắt tỉa,…) và khả
                                năng thích nghi, chịu được điều kiện khắc nghiệt nên cây hoa giấy thường được trồng trong nhiều cảnh
                                quan của đô thị (trồng từng cây trên dải phân cách, vỉa hè,…).</p>

                            <h4>4. Cách trồng và chăm sóc hoa giấy</h4>
                            <h4>Kỹ thuật trồng</h4>

                            <p>Chuẩn bị trước khi trồng <br> <br>
                                Trước khi trồng bạn cần chuẩn bị cành giâm và đất trồng để cây có thể phát triển thuận lợi và sớm
                                trổ hoa. <br> <br>
                                Chuẩn bị cành giâm: Bạn nên chọn cành đã ra 1-2 năm với chiều dài đoạn chọn để giâm là khoảng 20cm
                                và mỗi đoạn có 2 mắt cây hoặc hơn. <br> <br>
                                Đất trồng: Bạn hãy chọn những loại đất tơi xốp (có thể pha với ít đất cát và trấu để tạo độ tơi
                                xốp), giàu dinh dưỡng nhưng không nên quá ẩm vì cây hoa giấy chịu hạn tốt và có thể bón thêm phân
                                chuồng hoại mục. <br> <br>
                            </p>

                            <p>Cách trồng <br><br>

                                Chọn thời điểm trồng mát mẻ, thuận lợi cho cây phát triển như vào mùa thu, 2 tháng đầu mùa xuân và
                                thời điểm mặt trời đã dịu hơn trong ngày. <br> <br>

                                Cành: Phần gốc bạn xử lý bằng cách cắt vát và bôi vôi chống nấm bệnh; phần đầu ngọn bạn buộc ni lông
                                giúp giữ nước cho cành. Giâm cành trong đất sâu 6 -10 cm, nghiêng góc 15 độ, các cành cách nhau 20cm
                                để cây có không gian phát triển. <br> <br>
                                Bạn nên 2-3 ngày một lần tưới nước, giữ cho cây được thoáng mát và có đủ ánh sáng mặt trời để quang
                                hợp.</p>

                            <h4>Kỹ thuật chăm sóc</h4>

                            <p>Kỹ thuật chăm sóc cũng góp phần giúp cây phát triển tốt và nhanh trổ hoa, bạn hãy chú ý các vấn đề
                                sau: <br><br>

                                Tưới nước vừa đủ: Cây hoa giấy chịu hạn tốt nên bạn không cần tưới nước quá nhiều tránh ngập úng
                                cây, chỉ nên tưới vừa đủ để giữ đất ẩm. <br><br>
                            </p>

                            <p>Cây hoa giấy có sức sống dẻo dai, ít khi bị sâu bệnh nhưng đôi khi vẫn xảy ra tình trạng có sâu bệnh.
                                Bạn có thể xử lý như sau nếu có tình trạng cây bị sâu bệnh: Mua thuốc bảo vệ thực vật về phun cho
                                cây, xử lý đất trồng và cắt tỉa cây thường xuyên.</p>

                            <p>Bón phân thường xuyên</p>

                            <p>Để thúc cho hoa nhanh nở thì bạn nên bón phân 2 tháng/lần là đã cung cấp đủ chất cho cây phát triển.
                                Bạn có thể chọn loại phân có tỉ lệ NPK là 1:1:1 hoặc 2:1:2 (loại này bạn không nên bón từ lúc mới
                                trồng nhé) hoặc có thể sử dụng phân bón hữu cơ hoặc phân bón chậm tan sẽ tối ưu cho cây hơn.</p>

                            <p>Cắt tỉa hoa giấy</p>

                            <p>Bạn nên cắt tỉa các cành thừa, lá vàng, hay bị gãy,…Mục đích của việc cắt tỉa cây hoa giấy là để kích
                                thích nở hoa và giúp cây có dáng đẹp. Ngoài ra, sau khi hoa giấy hết mùa ra hoa thì bạn cũng nên cắt
                                tỉa để đón lứa hoa mới nhanh hơn. Bạn cũng nên chú ý cây hoa giấy có gai nên cần cẩn thận và đeo
                                găng tay để bảo vệ mình nhé.</p>

                            <p>Điều cần biết sau khi cây nở hoa</p>

                            <p>Cây hoa giấy ra hoa đẹp nhất là thời điểm mùa hè nên trước đó bạn hãy chú ý chăm sóc theo các hướng
                                dẫn trên để hoa nở nhiều và đẹp hơn nhé (ví dụ như căn thời gian tỉa cây để kịp ra hoa đúng mùa,…).
                                Ngoài ra còn cách để ép cây nhanh ra hoa đó là ngừng tưới nước cho cây trong khoảng 4 ngày rồi sau
                                đó tưới trở lại, để cây hoa giấy tập trung cho ra nhiều chồi nách thì bạn nên ngắt bỏ các chồi ngọn.
                            </p>

                            <p>Đổi chậu cho cây</p>

                            <p>Nếu bạn trồng cây hoa giấy ở chậu thì nhớ thỉnh thoảng nên đổi chậu cho cây bời vì tốc độ sinh trưởng
                                của cây hoa giấy khá nhanh (sau khoảng 1 năm thì cây đã lớn hơn nhiều). Khi chuyển chậu bạn chú ý
                                cẩn thận tránh làm cây bị tổn thương phần rễ nữa nhé.</p>
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
