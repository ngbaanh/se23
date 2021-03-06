<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.bean.Category"%>
<%@ page import="util.Const"%>
<%
	Category category = (Category) request.getAttribute("category");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cập nhật thể loại</title>
<jsp:include page="_bootstrap.jsp" />
<script type="text/javascript">
	function validateForm() {
		var x1 = document.forms["updateForm"]["CategoryName"].value;
		var validated = true;
		if (x1 == null || x1.trim() == "" || x1.length > <%=Const.MAXLENGTH_NAME%>) {
			alert("<%=Const.INVALID_FORM%>");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<form class="form-horizontal" name="updateForm" action="UpdateCategory" method="post">
			<div class="form-group">
				<label class="col-xs-3 control-label">Mã TL</label>
				<div class="col-xs-9">
					<input type="number" class="form-control" name="CategoryId" value="<%=category.getCategoryId() %>" readonly>
				</div>
			</div>
			<div class="form-group">
				<label class="col-xs-3 control-label">Thể loại *</label>
				<div class="col-xs-9">
					<input type="text" class="form-control" name="CategoryName" value="<%=category.getCategoryName()%>">
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-offset-3 col-xs-6">
					<input type="hidden" name="doUpdate">
					<button type="submit" class="btn btn-primary btn-block">Cập nhật</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>