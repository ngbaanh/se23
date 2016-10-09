<%@page import="model.bean.Category"%>
<%@page import="model.bean.DiscSeries"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.Const"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Xem danh sách các bộ đĩa</title>
<jsp:include page="_bootstrap.jsp" />

<style>
fieldset.list_choice {
	border: 1px groove #ddd;
	padding: 0 10px 10px 10px;
	margin: auto;
}

legend.list_choice {
	width: auto;
	padding: 0 10px;
	border-bottom: none;
}

#panel_list_choice {
	box-shadow: 0 -2px 2px 0 rgba(0, 0, 0, 0.2), 0 6px 5px 0
		rgba(0, 0, 0, 0.3);
	padding: 10px;
	margin: 0 0 20px 0;
}
</style>

<script type="text/javascript">
function filter_by_type(picked_type) {
	document.getElementById("input_picked_type").value = picked_type.value;
	document.getElementById("form_picked_type").submit();
}
</script>

</head>
<jsp:include page="_header.jsp" />
<body>
	<jsp:include page="_top.jsp" />
	<div class="container" style="margin-top: 20px">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="HomePage">Trang chủ</a></li>
				<li class="active">Xem danh sách</li>
			</ol>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon glyphicon glyphicon-search"></span>
					<input type="text" class="form-control" placeholder="tìm kiếm">
				</div>
			</div>
			<div class="col-md-3 col-md-offset-1">
				<div class="input-group">
					<form id="form_picked_type" action="/SE23/ViewDiscSeriesList" method="post">
						<input id="input_picked_type" name="cateId" type="text" class="hidden">
					</form>
					<select name="PickedType" onChange="filter_by_type(this)" class="form-control">
						<option value="0">Chọn thể loại</option>
						<%
						int cateId = (int) request.getAttribute("cateId");
						ArrayList<Category> listCategories = (ArrayList<Category>) request.getAttribute("listCategories");
						for (int i = 0; i < listCategories.size(); i++) {
							Category category = listCategories.get(i);
							if (cateId == category.getCategoryId()) {
								%>
								<option value="<%=category.getCategoryId()%>" selected>
									<%=category.getCategoryName()%>
								</option>
								<%
							} else {
								%>
								<option value="<%=category.getCategoryId()%>">
									<%=category.getCategoryName()%>
								</option>
								<%
							}
							
						}
						%>
					</select>
				</div>
			</div>
			<div class="col-md-2">
				<label class="pull-right">Trang:</label>
			</div>
			<div class="col-md-2">
				<div class="dropdown">
					<%
					int currentPage = (int) request.getAttribute("destPage");
					int maxPage = (int) request.getAttribute("maxPage");
					%>
			  		<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
			  			<%=currentPage %>/<%=maxPage %>
			  			<span class="caret"></span>
			  		</button>
			  		<ul class="dropdown-menu">
			  		<%
					for (int i = 0; i < maxPage; i++) {
						%>
						<li>
							<form action="/SE23/ViewDiscSeriesList" method="post">
								<input name="destPage" value="<%=i + 1%>" class="hidden">
								<input type="submit" class="btn btn-link" value="<%=i + 1%>/<%=maxPage%>">
							</form>
						</li>
						<%
					}
					%>
			  		</ul>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>STT</th>
						<th>Tên bộ đĩa</th>
						<th>Thể loại</th>
						<th>SL</th>
						<th>Thao tác</th>
					</tr>
				</thead>
				<tbody>
				<%
				ArrayList<DiscSeries> listDiscSeries = (ArrayList<DiscSeries>) request.getAttribute("listDiscSeries");
				
				int startPosition = Const.ITEMS_PER_PAGE * (currentPage - 1);
				
				for (int i = 0; i < listDiscSeries.size(); i++) {
					DiscSeries discSeries = listDiscSeries.get(i);
					%>
					<tr>
						<td><%=i + 1 + startPosition%></td>
						<td><%=discSeries.getDiscSeriesName()%></td>
						<td><%=discSeries.getCategory().getCategoryName()%></td>
						<td><%=discSeries.getRemainingDisc()%>/<%=discSeries.getTotalDisc()%></td>
						<!-- Trigger the modal with a link inside table -->
						<td><a href="#" data-toggle="modal" data-target="#detail_target_disc_series">Xem</a></td>
					</tr>
					<%
				}
				%>
				</tbody>
			</table>

			<!-- Modal: List all disks of the target disk series -->
			<div id="detail_target_disc_series" class="modal fade" role="dialog">
				<div class="modal-dialog modal-lg">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-body" style="height: 500px;">
							<iframe src="/SE23/ViewDiscSeriesDetail" style="width: 100%; height: 100%; border: none;">
							</iframe>
						</div>
					</div>

				</div>
			</div>
			<!-- End Modal -->
		</div>

		<div class="row" id="panel_list_choice">
			<fieldset class="list_choice">
				<legend class="list_choice">Danh sách chọn</legend>

				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>STT</th>
							<th>Mã đĩa</th>
							<th>Tên</th>
							<th>Giá/DVD/Tuần</th>
							<th>Số tuần thuê</th>
							<th>Thành tiền (VNĐ)</th>
							<th>Thao tác</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>123</td>
							<td>Avatar 1</td>
							<td>30000</td>
							<td><select><option>2</option></select></td>
							<td>60000</td>
							<td><a href="#">Xóa</a></td>
						</tr>
						<tr>
							<td>2</td>
							<td>115</td>
							<td>Mario 3</td>
							<td>25000</td>
							<td><select><option>1</option></select></td>
							<td>25000</td>
							<td><a href="#">Xóa</a></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td>Tổng</td>
							<td>85000</td>
							<td></td>
						</tr>
					</tbody>
				</table>

				<div class="row-fluid text-center">
					<button type="button" class="btn btn-default text-center">Đặt
						thuê</button>
				</div>
			</fieldset>
		</div>
	</div>
</body>
</html>