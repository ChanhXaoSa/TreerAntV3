<%-- 
    Document   : blog6
    Created on : Mar 24, 2023, 1:12:21 PM
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
                            <h1>Hoa mười giờ trồng trong nhà được không? Cách chăm sóc hoa thế nào ?</h1>

                            <p>Hoa mười giờ hay hoa 10 giờ là loại hoa nhỏ thường mọc theo dọc bên đường tại các làng quê Việt
                                Nam,
                                là một hình ảnh vô cùng thân thuộc và gần gũi. Ngày nay, hoa mười giờ lại càng được yêu thích và
                                trở
                                thành một trong những loại cây cảnh phổ biến. Vậy hoa mười giờ trồng trong nhà được không? Cách
                                trồng và chăm sóc cây thế nào?</p>

                            <h4>Đặc điểm hoa mười giờ</h4>
                            <p>Hoa 10 giờ hay còn được biết đến là hoa tí ngọ hay hoa lệ nhi, là loại hoa có nguồn gốc từ Nam Mỹ
                                và
                                thường mọc ở đồng cỏ tại các làng quê Việt Nam. Hoa mười giờ có tên khoa học là Portulaca
                                grandiflora, tên tiếng anh là Sun plant và thuộc họ rau sam. Tên gọi của hoa xuất phát từ đặc
                                điểm
                                nở hoa vào lúc 8 – 10 giờ sáng mùa hè của loại hoa này.</p>

                            <img src="img/plant/Hoa muoi gio 1.jpg" alt="Hoa mười giờ" class="img_Blog">

                            <p>Cây hoa mười giờ là loại hoa thuộc dạng thân thảo, mọng nước, là loại cây sống hằng năm dễ trồng.
                                Cây
                                có chiều cao từ 10 – 30cm, phân nhánh nhiều, thân cây có màu hồng nhạt, giòn. Lá cây có màu xanh
                                nhạt, nhỏ, hình lông chim và không có răng cưa, lá cây thường mọc đối xứng ở các nhánh thân cây.
                            </p>

                            <p>Hoa mười giờ thường mọc ở đầu ngọn và nách lá, các cánh hoa xếp chồng lên nhau, cánh hoa mềm mại
                                với
                                nhiều màu khác nhau: hồng, vàng, trắng, đỏ,… và khi hoa nở rộ (vào khoảng 10 giờ sáng) thì còn
                                ánh
                                lên những nhị hoa vàng óng như tô điểm thêm cho nền xanh của lá.</p>

                            <p>Mười giờ là loại hoa thường mọc hoang ở các cánh đồng cỏ, là loại hoa thường nở vào mùa hè
                                (khoảng 10
                                giờ sáng), có khả năng chịu lạnh kém, cây thường bị lụi tàn vào mùa đông, ưa ẩm.</p>

                            <h3>Ý nghĩa hoa mười giờ</h3>

                            <p>Việc trồng hoa cây cảnh trước và trong nhà đối với người Việt hiện nay không chỉ đáp ứng về mặt
                                thẩm
                                mỹ mà còn đòi hỏi rất cao về yếu tố phong thủy. Bởi khi lựa chọn được hoa phù hợp với ngũ hành
                                tương
                                sinh, gia chủ và các thành viên trong nhà sẽ gặp nhiều may mắn, tài lộc, thu hút vượng khí, xua
                                đuổi
                                vận xui.</p>

                            <img src="img/plant/Hoa muoi gio 2.jpg" alt="Hoa mười giờ" class="img_Blog">

                            <p>Không nhiều gia chủ lựa chọn hoa mười giờ trồng trước nhà nhưng theo các tài liệu liên quan tới
                                phong
                                thủy, trồng hoa mười giờ trước nhà rất tốt. Điển hình là hoa mười giờ tượng trưng cho tình yêu
                                đôi
                                lứa sắt son, thủy chung và sự hi sinh cho người mình thương. </p>

                            <p>Hình ảnh hoa mười giờ nhỏ nhắn, vươn mình lên giữa cánh đồng hoa dại để nở khoe sắc, nở những
                                bông
                                hoa tươi thắm nhất. Mặc dù là một loại hoa nhỏ nhắn nhưng lại có sức sống mãnh liệt, chính vì
                                thế mà
                                hoa 10 giờ còn được xem là biểu tượng cho sức sống mãnh liệt, là niềm tin luôn hướng đến tương
                                lai,
                                hướng đến cuộc sống tốt đẹp hơn.</p>

                            <h4>Hoa mười giờ trồng trong nhà được không?</h4>

                            <p>Hoa mười giờ với màu sắc rực rỡ, nổi bật đem đến cuộc sống vui tươi, giúp mọi người cảm thấy
                                thoải
                                mái, yêu đời,… Hoa còn xua tan đi những điều khó chịu, áp lực, căng thẳng trong cuộc sống và
                                mang
                                lại bầu không khí trong lành.</p>

                            <p>Xét về yếu tố phong thủy, cây cũng mang ý nghĩa tốt, tích cực và đặc biệt cây rất dễ trồng, dễ
                                chăm
                                sóc nên hoa mười giờ tại các khuôn viên trường học, công viên và trước cổng nhà, cửa sổ, vườn
                                nhà, …
                            </p>

                            <img src="img/plant/Hoa muoi gio 3.jfif" alt="Hoa mười giờ" class="img_Blog">

                            <p>Đặc biệt, ngày nay việc trồng hoa mười giờ còn được sáng tạo cực kỳ độc đáo và tạo nên những tác
                                phẩm
                                vô cùng ấn tượng. Như trồng hoa trồng trong chai nhựa, trồng hoa mười giờ bonsai hay làm tháp 3
                                tầng
                                trồng hoa mười giờ giúp không gian vừa đẹp lại lạ mắt.</p>

                            <h3>Cách trồng hoa mười giờ trong chai nhựa</h3>

                            <p>Hiện nay, hoa 10 giờ là loại cây thường thấy ở ven đường tại các đồng quê với nhiều sắc màu khác
                                nhau. Tuy nhiên, bạn có thể nhân giống cây về trồng để treo trong nhà để giúp tô điểm thêm không
                                gian nhà mình. Dưới đây là cách trồng cây ra nhiều hoa mà bạn có thể tham khảo:</p>

                            <p>Cách nhân giống</p>

                            <li>Hoa 10 giờ thường được nhân giống bằng cách giâm cành hoặc gieo hạt. Tùy vào môi trường mà bạn
                                có
                                thể lựa chọn cách nhân giống khác nhau:</li>

                            <p>Trồng bằng hạt</p>

                            <p>Để nhân giống hoa mười giờ bằng hạt thì bạn nên thực hiện theo các bước dưới đây:</p>

                            <li>Mười giờ là loài hoa ưa nắng, vì thế khi gieo hạt bạn nên chọn những nơi có ánh sáng cả ngày để
                                giúp
                                cho cây phát triển tốt hơn. Ngoài ra, nên gieo hạt vào khoảng tháng 2 – tháng 4. Vì lúc này thời
                                tiết ấm áp, thích hợp để cho cây phát triển, tuyệt đối không gieo hạt vào khoảng mùa đông, vì
                                lúc
                                này cây sẽ lạnh và dễ bị lụi.</li>

                            <li>Gieo hạt giống xuống đất và phủ lên trên một lớp mùn để giữ được độ ẩm cho hạt giống nảy mầm.
                                Gieo
                                xong thì nên tưới nước cho cây, chỉ nên tưới vừa đủ.</li>

                            <p>Đối với cách nhân giống này, bạn cần lưu ý có thể ươm hạt ra khay rồi đem đi cấy ra đất hoặc gieo
                                trực tiếp vào chậu:</p>

                            <li>Ươm hạt ở khay: Cần trải đều đất ra khay ươm hoặc chậu, sau đó gieo hạt lên bề mặt và phủ thêm
                                một
                                lớp đất mỏng hoặc mùn để giữ cho đất ẩm giúp hạt nảy mầm. Sau khoảng 7 – 15 ngày, cây sẽ nảy mầm
                                và
                                bạn có thể bứng cây trồng ra luống hoặc trồng vào chậu.</li>

                            <li>Gieo hạt trực tiếp vào chậu: Hạt sau khi mua về thì ủ trong nước ấm từ 3 – 4 giờ, và đem đi gieo
                                vào
                                chậu. Sau khoảng từ 50 – 70 ngày thì sẽ cho ra hoa. Trong quá trình cây nảy mầm thì bạn nên chăm
                                sóc
                                để cho ra hoa đẹp và đều hơn.</li>

                            <p>Trồng bằng giâm cành</p>
                            <p>Nếu bạn đang còn chưa biết cách giâm cành hoa mười giờ thì hãy tham khảo ngay quy trình dưới đây:
                            </p>

                            <li>Lựa chọn cành giâm: Nên chọn phần cuối của thân hoặc đầu ngọn để nhân giống giúp cây phát triển
                                tốt
                                nhất. Lưu ý không nên chọn những cành nhánh quá non hoặc quá già. Sau đó sử dụng kéo cắt cách
                                đoạn
                                đầu phần thân khoảng 5 – 12cm, phải có ít nhất một mắt ở phần cuối đoạn cắt.</li>
                            <li>Xử lý cành giâm: Cành giâm cần được loại bỏ hết hoa, nụ trên thân. Các lá phía dưới tếp xúc với
                                đất
                                trồng cũng cần được loại bỏ để tránh làm mầm bệnh cho cây.</li>
                            <li>Cấy vào đất: Đặt phần vết cắt vào bầu đất và ấn mạnh xung quanh gốc để đảm bảo cành giâm tiếp
                                xúc
                                với đất tốt, dễ dàng mọc rễ hơn. Khi giâm xong thì thường xuyên tưới nước và đặt cây ở nơi có
                                ánh
                                sáng trực tiếp. Sau khoảng 1 – 2 tuần cây mọc rễ thì bạn có thể gieo trồng ở luống hoặc vào
                                chậu.
                            </li>

                            <h3>Cách chăm sóc hoa mười giờ đẹp quanh năm</h3>
                            <p>Mặc dù là loại cây cảnh dễ trồng và chăm sóc tại nhà nhưng để cây hoa mười giờ ra hoa đẹp quanh
                                năm
                                thì bạn cần phải lưu ý các cách chăm sóc dưới đây:</p>
                            <p>Lựa chọn đất trồng: Hoa mười giờ là loại hoa ưa hạn nên bạn cũng cần lưu ý, lựa chọn đất trồng có
                                khả
                                năng thoát nước cao. Bạn có thể mua đất trồng ở các cửa hàng hoa hoặc trộn theo tỉ lệ: 2/5 đất +
                                2/5
                                cát và 1/5 phân mùn.</p>
                            <p>Tưới nước: Cây hoa mười giờ là loại hoa ưa hạn, phù hợp với khí hậu của Việt Nam nên bạn không
                                cần
                                tưới nước quá nhiều mà chỉ cần đảm bảo độ ẩm cho cây. Lưu ý, tưới nước thì nên tưới vào buổi
                                sáng
                                sớm, không nên tưới vào lúc 8 – 10 giờ vì lúc này là thời điểm cây nở hoa.</p>
                            <p>Vị trí đặt cây: Để cho mười giờ phát triển và ra hoa nhiều, đều thì bạn cũng cần nên lưu ý về vị
                                trí
                                đặt cây. Hoa mười giờ là loại hoa ưa sáng, thích hợp ở những nơi có ánh sáng trực tiếp. Vì thế,
                                bạn
                                nên đặt cây ở những nơi quang đãng: sân thượng, ban công, sân vườn,…</p>
                            <p>Cắt tỉa cành: Khi trồng hoa thì bạn nên thường xuyên cắt tỉa các cành đã già hoặc khô héo cho
                                cây,
                                các này vừa giúp đảm bảo tính thẩm mỹ vừa giúp hạn chế các loại sâu bệnh hại tấn công cây. Ngoài
                                ra,
                                cắt tỉa cành còn giúp cho cây mọc thêm nhiều nhánh non và giúp tạo bông đều và đẹp hơn.</p>
                            <p>Phòng ngừa sâu bệnh: Vì là loại cây thân mọng nước, thuộc họ rau sam nên hoa mười giờ rất dễ bị
                                các
                                loại sâu ăn lá hay ốc sên tấn công. Để phòng ngừa thì bạn nên thường xuyên cắt tỉa cành cây, sử
                                dụng
                                thuốc bảo vệ thực vật để giúp cho cây không bị hư hại.</p>
                            <p>Ngoài ra, khi đến mùa thu hoạch hạt, nếu bạn không cần sử dụng hạt thì cũng nên loại bỏ, tránh để
                                hạt
                                rơi và mọc đè lên phần cây mẹ. Như vậy, sẽ khiến cho cây mẹ chậm phát triển và dễ phát sinh các
                                loại
                                nấm và sâu bệnh hại hơn.</p>
                            <p>Thu hoạch hạt để nhân giống: Sau khi hoa tàn thì cây sẽ kết quả, bạn có thể thu hoạch hạt để nhân
                                giống cho mùa tiếp theo. Sử dụng tay tách phần vỏ bên ngoài để thu hoạt hạt, mỗi quả sẽ cho
                                khoảng
                                từ 3 – 6 hạt, thu hoạch xong thì đem hạt đi phơi nắng bảo quản cho mùa sau.</p>
                            <p>Hy vọng bài viết đã giúp bạn giải tỏa băn khoăn “hoa mười giờ trồng trong nhà được không“. Hơn
                                thế
                                còn giúp bạn biết cách trồng và chăm sóc cây giúp ra hoa đẹp.</p>
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