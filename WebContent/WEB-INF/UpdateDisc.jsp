<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>

	<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<form role="form" class="form-horizontal">
			<div class="form-group">
				<div class="col-xs-4">
					<label>Sửa chi tiết thông tin đĩa</label>
				</div>
				<div class="col-xs-2 col-xs-offset-6">
					<input type="button" class="btn btn-default" value="Đóng" >
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-2">
					<label>Mã đĩa</label>
				</div>
				<div class="col-xs-1 col-xs-offset-0">
					<input type="text" class="form-control" placeholder="124" disabled="readonly">
				</div>
				<div class="col-xs-2 col-xs-offset-3">
					<label>Tình trạng</label>
				</div>
				<div class="col-xs-1 col-xs-offset-0">
					<input type="radio" name="Available" value="notAvailable">N/A<br>
				</div>
				<div class="col-xs-2 col-xs-offset-0">
					<input type="radio" name="Available" value="available" checked="checked">Sẵn sàng<br>
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-2">
					<label>Thuộc bộ đĩa</label>
				</div>
				<div class="col-xs-9 col-xs-offset-0">
					<input type="text" class="form-control" placeholder="Avartar 1" disabled="readonly">
				</div>
			</div>
			<div class="row" style="margin-bottom: 30px">
				<div class="col-xs-2">
					<label>Vị trí<span style="color:red">*</span></label>
				</div>
				<div class="col-xs-9 col-xs-offset-0">
					<input type="text" class="form-control" placeholder="Avartar 1">
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-2">
					<label>Chất lượng</label>
				</div>
				<div class="col-xs-1 col-xs-offset-0">
					<input type="radio" name="Available" value="one">1
				</div>
				<div class="col-xs-1 col-xs-offset-0">
					<input type="radio" name="Available" value="two">2
				</div>
				<div class="col-xs-2 col-xs-offset-0">
					<input type="radio" name="Quality" value="three" checked="checked">3
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-xs-2 col-xs-offset-5">
				<button type="submit" class="btn btn-default">Cập nhật</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>