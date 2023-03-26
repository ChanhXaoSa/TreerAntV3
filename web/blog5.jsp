<%-- 
    Document   : blog5
    Created on : Mar 24, 2023, 1:12:14 PM
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
                            <h1>Cách trồng hoa dạ yến thảo trang trí trên ban công</h1>

                            <p>Ban công là không gian mà ai cũng muốn được thư giãn sau một ngày làm việc mệt mỏi và căng thẳng. Với
                                một chậu hoa dạ yến thảo, ban công của bạn sẽ trở nên đẹp, sinh động và rực rỡ.</p>

                            <h4>Hoa dạ yến thảo và ý nghĩa</h4>

                            <p>Cây còn có tên gọi khác là cây mẫu đơn linh chi, mẫu đơn tây, loa kèn ngắn, có hoa to, hoa có cánh
                                đơn, nhiều cánh, cánh hoa xếp lại với nhau hoặc xuất hiện những răng cưa không giống nhau, hoa có
                                màu đỏ, trắng, hồng, tím có những đốm, vệt lưới nhỏ.</p>


                            <img src="img/plant/Cay da yen thao 1.jfif" alt="Cây Dạ Yến Thảo" class="img_Blog">

                            <p>Ưu điểm của giống hoa này là cho hoa nhiều và thân có tính năng buông rủ nên trồng ở ban công rất
                                đẹp. Dạ yến thảo có hoa liên tục, hết đợt này đến đợt khác, dễ tìm các loại giống và có một mùi thơm
                                rất đặc biệt. Thời kỳ hoa nở từ tháng 5 tới tháng 10 dáng hoa phong phú, đa dạng, là một trong các
                                loại cây phong thủy chịu nhiệt, lạnh khá dễ sống, ưa sáng và đòi hỏi tưới nước thường xuyên nhưng
                                lượng nước vừa phải, nếu chăm sóc đầy đủ có thể ra hoa quanh năm, hết đợt này đến đợt khác.</p>

                            <p>Dạ yến thảo không chỉ đẹp mà còn có ý nghĩa thay cho lời nhắn nhủ rằng bạn luôn ở trong trái tim tôi
                                và tôi sẽ luôn đồng hành bên bạn. Hoa còn thể hiện cho tình yêu mềm mại nhưng lại có sức sống mãnh
                                liệt luôn vươn lên phía trước.</p>

                            <img src="img/plant/Cay da yen thao 2.jfif" alt="Cây Dạ Yến Thảo" class="img_Blog">

                            <h4>Cách trồng chậu hoa dạ yến thảo</h4>
                            <p>Chuẩn bị</p>

                            <li>Đất trồng cây dạ yến thảo phải là đất tơi xốp.</li>
                            <li>Chậu phải là chậu máng có móc sắt treo ban công, chậu treo, chậu kẹp lan can vì cơ bản mình trồng
                                loài hoa này chủ yếu là để hoa rũ xuống nên cần treo trên cao. Bạn cần chọn những chậu hoa có thể
                                đặt trên hoặc có móc cố định chắc chắn vào thanh ngang trên lan can ban công để những cành hoa có
                                thể buông xuống, mềm mại và tự nhiên.</li>
                            <li>Hạt giống hoặc cây giống: Hoa Dạ yến thảo có nhiều màu sắc nên bạn có thể tùy chọn theo sở thích.
                            </li>
                            <li>Bình tưới nước và các dụng cụ làm vườn khác.</li>

                            <p>Gieo hạt</p>
                            <li>Cho đất vào khoảng lưng chừng mặt chậu, gieo hạt lên trên, không cần phủ đất lên hạt.</li>
                            <li>Ở giai đoạn này tưới nước là rất cần thiết vì hạt cần độ ẩm để nảy mầm, bạn nên dùng bình xịt để ở
                                chế độ phun sương không sẽ bị vùi mất hạt nhé. Nên tưới nước 2 lần/ngày.</li>
                            <li>Bạn nên để hạt hoa ở nơi bóng râm, thoáng mát và cẩn thận kiến hay côn trùng tha mất hạt nhé.</li>

                            <p>Giai đoạn cây non</p>
                            <li>Khi cây nảy mầm bạn cần quan tâm hơn tới độ ẩm vì nếu cây bị úng nước sẽ chết nhanh hơn cả khi bị
                                thiếu nước. Lúc đầu khi cây còn non bạn nên đặt chậu tại nơi mát, đợi cây đâm chồi mới, bén rễ và
                                cao khoảng 10cm thì chuyển cây ra chỗ có ánh nắng.</li>
                            <li>Lưu ý ở giai đoạn này là khi tưới đừng để đọng nước trên lá dễ làm lá bị thối.</li>

                            <p>Giai đoạn cây trưởng thành và ra hoa</p>

                            <li>Khi cây cao 20cm thì ngắt ngọn cây sẽ ra nhiều nhánh chùm kín chậu. Bạn nên thường xuyên ngắt các
                                hoa héo, lá vàng úa, cành khô vì để lâu sẽ dễ khiến cây bị úng. Để hoa có thể chơi lâu hơn bạn cần
                                lưu ý ngắt các nhánh già để cây đẻ thêm nhánh mới.</li>
                            <li>Để cây nơi có nhiều ánh sáng sẽ ra nhiều hoa hơn và vào thời kỳ cây sinh trưởng, nên bón phân mỗi
                                tháng 1 lần. Sau khi hoa nở bạn cần ngắt bỏ cả cuống hoa thì chồi nách sẽ phát triển và hoa tiếp tục
                                nở.</li>

                            <img src="img/plant/Cay da yen thao 3.jfif" alt="Cây dạ yến thảo" class="img_Blog">

                            <h3>Cách chăm sóc cây dạ yến thảo</h3>

                            <p>Dạ yến thảo là cây ưa sáng, ưa ẩm, háu ăn. Bạn nên tưới nước thường xuyên và vừa phải, không nhiều
                                quá nhưng cũng không để đất khô quá. Khi tưới thiếu nước cây biểu hiện héo rũ, bổ sung nước lại cũng
                                sẽ rất khó phục hồi do lá mỏng, hoa nhiều, thân rỗng.</p>

                            <p>Dạ yến thảo không chịu úng vì vậy bạn nên đặt chậu hoa ở nơi không chịu mưa trực tiếp, nếu trời nắng
                                to hoặc mưa to, bạn nên “di dời” cây vào trong nhà để đảm bảo cây và hoa được tốt tươi lâu hơn.
                                Ngoài ra, tránh đặt chậu cây nơi gió lớn vì cây hoa dễ bị tổn thương.</p>

                            <p>Khi cây quá già, vào ngày mát bạn có thể cắt bớt thân ngọn, giữ gìn các phần thân, thay đất hoặc chậu
                                to hơn, được bổ sung dinh dưỡng cây sẽ bật mầm lộc và trong thời gian ngắn lại tiếp tục cho nhé.</p>

                            <img src="img/plant/Cay da yen thao 1.jfif" alt="Cây dạ yến thảo" class="img_Blog">

                            <p>Bạn cũng có thể kết hợp nhiều màu sắc của dạ yến thảo hoặc kết hợp với một số hoa khác để thêm sự đa
                                dạng về màu sắc và thêm sinh động.</p>

                            <p>Loài hoa đáng yêu này sẽ khiến cho ban công nhà bạn nổi bật và vực dậy tinh thần của cả gia đình sau
                                một ngày đi học đi làm.</p>

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
