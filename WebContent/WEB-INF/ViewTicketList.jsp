<%@page import="model.bean.TicketStatus"%>
<%@page import="model.bo.TicketStatusBO"%>
<%@page import="model.bean.Ticket"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.Const"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="author" content="Tran Thanh Sang">
<title>ViewTicketList</title>
<jsp:include page="_bootstrap.jsp" />
</head>
<%
	int currentPage = 1;
	TicketStatus currentTicketStatus = (TicketStatus) request.getAttribute("ticketStatus");
	String currentStatus = (currentTicketStatus.getStatusId() == -1) ? "Trạng thái" : currentTicketStatus.getStatusName();
	String currentSearchQuery = "";
	currentPage = Integer.parseInt(request.getAttribute("CurrentPage").toString());
	currentSearchQuery = request.getAttribute("CurrentSearchQuery").toString();
	int startIndex = (currentPage - 1) * Const.ITEMS_PER_PAGE + 1;
	int maxPage = Integer.parseInt(request.getAttribute("MaxPage").toString());
%>

<jsp:include page="_header.jsp" />
<body>
	<jsp:include page="_top.jsp" />
	<div class="container-fluid">
		<div style="margin-top: 15px">
			<ol class="breadcrumb">
				<li><a href="#">Quản lí phiếu thuê</a></li>
				<li class="active">Xem danh sách phiếu</li>
			</ol>
			<p>Danh sách các phiếu thuê và các thông tin cơ bản.</p>
		</div>

		<script type="text/javascript">
			$("input#SearchQuery").on(
					"keyup",
					function(e) {
						if (e.which == 13) {
							var searchQuery = $("#SearchQuery").val();
							alert(searchQuery);
							window.location.replace("#?SearchQuery=" + searchQuery);
						}
					});
		</script>
		<div class="row">
			<div class="col-md-4">
				<form name="SearchForm" id="SearchForm" method="get" action="#">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-search"></i>
							</span> <input type="text" class="form-control" placeholder="Tìm kiếm"
								id="SearchQuery" name="SearchQuery" autocomplete="off"
								value="<%=currentSearchQuery%>">
						</div>
				</form>
			</div>
			<div class="col-md-6">
				<p class="text text-muted">Nhập Mã phiếu hoặc tên KH để tìm kiếm</p>
			</div>
			<% if (!"".equals(currentSearchQuery)) { %>
				<div class="col-md-2">
					<a href="#" class="btn btn-default btn-block" onClick="javascript:window.history.back();">Đóng</a>
				</div>
			<%} %>
		</div>	<!-- /.row -->

		<br>
		
		<table class="table table-bordered">
			<tr class="active">
				<th>Thời gian</th>
				<th>Mã phiếu</th>
				<th>Họ tên KH</th>
				<th>Trạng thái</th>
				<th>Thao tác</th>
			</tr>
			<%
				TicketStatusBO ticketStatusBO = (TicketStatusBO) request.getAttribute("ticketStatusBO");
				ArrayList<Ticket> listTickets = (ArrayList<Ticket>) request.getAttribute("listTickets");
				for (Ticket ticket : listTickets) {
			%>
			<tr>
				<td><%=ticket.getStartTime()%></td>
				<td><%=ticket.getTicketId()%></td>
				<td><%=ticket.getCustomerName()%></td>
				<td><%=ticketStatusBO.getStatusName(ticket.getStatusId())%></td>
				<td><a href="ViewTicketDetail?ticketId=<%=ticket.getTicketId()%>">Xem chi tiết</a>
			</tr>
			<%
				}
			%>

		</table>
		<%
			if ("".equals(currentSearchQuery)) {
		%>
		<div class="row">
			<div class="col-md-1 col-md-offset-0">
				<strong class="text text-muted">Trang </strong>
			</div>
			<div class="col-md-2">
				<div class="dropdown">
					<button class="btn btn-default btn-block dropdown-toggle "
						type="button" data-toggle="dropdown">
						<%=currentPage%>
						/
						<%=maxPage%>
						&nbsp; <span class="caret"></span>
					</button>
					<div class="dropdown-menu dropdown-menu-right"
						style="padding: 5px; width: 600px !important;">
						<%
							String pageLink;
								for (int i = 1; i <= maxPage; i++) {
									pageLink = "ViewTicketList?page=" + i
											+ "&StatusId=" + currentTicketStatus.getStatusId();
						%>
						<a
							class="btn <%=(i == currentPage) ? "btn-link disabled" : "btn-default"%> btn-xs"
							style="float: right; width: 40px; margin: 1px;"
							href="<%=pageLink%>"><%=i%></a>
						<%
							}
						%>
					</div>
				</div>
			</div>
			<%
				}

				if ("".equals(currentSearchQuery)) {
			%>

			<div class="col-md-2 col-md-offset-3">
				<strong class="text text-muted">Lọc trạng thái </strong>
			</div>
			<div class="col-md-2">
				<div class="dropdown">
					<button class="btn btn-default btn-block dropdown-toggle"
						type="button" data-toggle="dropdown">
						<%=currentStatus %> <span class="caret"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right">
						<%
							ArrayList<TicketStatus> listTicketStatus = (ArrayList<TicketStatus>) request
										.getAttribute("listTicketStatus");
								if (!listTicketStatus.isEmpty()) {
									for (TicketStatus ticketStatus : listTicketStatus) {
						%>
						<li><a
							href="ViewTicketList?StatusId=<%=ticketStatus.getStatusId()%>&page=<%=currentPage%>"><%=ticketStatus.getStatusName()%></a></li>
						<%
							}
								}
						%>

					</ul>
				</div>
			</div>
			<%
				}
			%>
		</div>

	</div>
</body>
</html>