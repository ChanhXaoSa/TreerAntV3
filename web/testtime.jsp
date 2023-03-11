<%-- 
    Document   : testtime
    Created on : Mar 11, 2023, 11:28:28 PM
    Author     : Triệu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> <html> <head> 	<title>Date and Time Picker Example</title> 	<!-- Thêm đường dẫn tới các file CSS của Bootstrap --> 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 	<!-- Thêm đường dẫn tới file CSS cho DateTimePicker --> 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"> </head> <body> 	<div class="container mt-5"> 		<!-- Tạo input cho DateTimePicker --> 		<div class="form-group"> 			
                <label for="datetimepicker">Ngày và giờ:</label> 			<div class='input-group date' id='datetimepicker'> 				<input type='text' class="form-control" /> 				<span class="input-group-addon"> 					<span class="glyphicon glyphicon-calendar"></span> 				</span> 			</div> 		</div> 	</div> 	<!-- Thêm đường dẫn tới các file JavaScript của Bootstrap và Moment.js --> 	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script> 	<!-- Thêm đường dẫn tới file JavaScript cho DateTimePicker --> 	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script> 	<!-- Khởi tạo DateTimePicker --> 	<script> 		$(function () {
        $('#datetimepicker').datetimepicker({format: 'DD/MM/YYYY HH:mm:ss'});
    });</script> </body> </html> 
