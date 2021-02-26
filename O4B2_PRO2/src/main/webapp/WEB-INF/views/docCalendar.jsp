<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html lang="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<html>
<head>
<meta charset="UTF-8">
<title>예약확인</title>
</head>
<script>
	$(function() {
		var chk = "${msg}";
		var identy = "${mb.m_id}";
		var hosid = "${hb.h_id}";

		if (chk != "") {
			alert(chk);
			location.reload(true);
		}
		if (identy != "") {
			$(".home").show();
			$(".common").show();
			$(".admin").hide();
			$(".hosH").hide();
			$(".nUser").hide();
			if (identy == "admin") {
				$(".admin").show();
			}
		} else if (hosid != "") {
			$(".hosH").show();
			$(".common").hide();
			$(".admin").hide();
			$(".home").hide();
			$(".nUser").hide();
		} else {
			$(".home").hide();
			$(".common").hide();
			$(".admin").hide();
			$(".hosH").hide();
			$(".nUser").show();
		}
	});
</script>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- bradcam_area_start  -->
	<div class="bradcam_area breadcam_bg_2 bradcam_overlay">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text">
						<h3>CALENDAR</h3>
						<p>
							<a href="./home">Home /</a> CALENDAR
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bradcam_area_end  -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div style="margin: 50px 100px">
					<h3>의사 스케줄</h3>
					<hr>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>의사명</th>
								<th><input type="text" name="h_id" hidden="hidden"
									value="${hb.h_id}"> <select class="doc" name="d_name"
									id="selDoc">
										<option value="" selected disabled>의사를 선택해주세요.</option>
										<c:forEach var="doc" items="${dName}">
											<option value="${doc}">${doc}</option>
										</c:forEach>
								</select></th>
								<th>날짜 선택</th>
								<th><input type="text" name="date" id="dateT"
									hidden="hidden" value=""><input type='date'
									class="form-control" id="date" pattern="yyyy-MM-dd"></th>
								<th><input type="button" value="검색" onclick="schedule()"></th>
							</tr>
						</thead>
						<tbody>
							<tr class="table table-hover">
								<td>9시 ~ 10시</td>
								<td colspan="4">
									<div id="cal9" style="display:none">
									</div>
								</td>
							</tr>
							<tr class="table table-hover">
								<td>10시 ~ 11시</td>
								<td colspan="4">
									<div id="cal10" style="display:none">
									</div>
								</td>
							</tr>
							<tr class="table table-hover">
								<td>11시 ~ 12시</td>
								<td colspan="4">
									<div id="cal11" style="display:none">
									</div>
								</td>
							</tr>
							<tr class="table table-hover">
								<td colspan="5"
									style="text-align: center; background-color: silver;">점 심
									시 간</td>
							</tr>
							<tr class="table table-hover">
								<td>1시 ~ 2시</td>
								<td colspan="4">
									<div id="cal13" style="display:none">
									</div>
								</td>
							</tr>
							<tr class="table table-hover">
								<td>2시 ~ 3시</td>
								<td colspan="4">
									<div id="cal14" style="display:none">
									</div>
								</td>
							</tr>
							<tr class="table table-hover">
								<td>3시 ~ 4시</td>
								<td colspan="4">
									<div id="cal15" style="display:none">
									</div>
								</td>
							</tr>
							<tr class="table table-hover">
								<td>4시 ~ 5시</td>
								<td colspan="4">
									<div id="cal16" style="display:none">
									</div>
								</td>
							</tr>
							<tr class="table table-hover">
								<td>5시 ~ 6시</td>
								<td colspan="4">
									<div id="cal17" style="display:none">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
<script src="resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript">
	function schedule() {
		var text = "예약 명단 : "
		$.ajax({
			url : "docCalSel",
			type : "post",
			data : {
				h_id : "${hb.h_id}",
				d_name : $("#selDoc").val(),
				date : $("#dateT").val(),
			},
			dataType : "json",
			success : function(result) {
				for ( var i=0; i<result.docCal9.length; i++) {
					text += result.docCal9[i] + " / ";
				}
				if(text == "예약 명단 : "){
					$("#cal9").hide();
				}
				else{
					$("#cal9").html(text);
					$("#cal9").show();
				}
				text = "예약 명단 : "
				for ( var i=0; i<result.docCal10.length; i++) {
					text += result.docCal10[i] + " / ";
				}
				if(text == "예약 명단 : "){
					$("#cal10").hide();
				}
				else{
					$("#cal10").html(text);
					$("#cal10").show();
				}
				text = "예약 명단 : "
				for ( var i=0; i<result.docCal11.length; i++) {
					text += result.docCal11[i] + " / ";
				}
				if(text == "예약 명단 : "){
					$("#cal10").hide();
				}
				else{
					$("#cal11").html(text);
					$("#cal11").show();
				}
				text = "예약 명단 : "
				for ( var i=0; i<result.docCal13.length; i++) {
					text += result.docCal13[i] + " / ";
				}
				if(text == "예약 명단 : "){
					$("#cal10").hide();
				}
				else{
					$("#cal13").html(text);
					$("#cal13").show();
				}
				text = "예약 명단 : "
				for ( var i=0; i<result.docCal14.length; i++) {
					text += result.docCal14[i] + " / ";
				}
				if(text == "예약 명단 : "){
					$("#cal10").hide();
				}
				else{
					$("#cal14").html(text);
					$("#cal14").show();
				}
				text = "예약 명단 : "
				for ( var i=0; i<result.docCal15.length; i++) {
					text += result.docCal15[i] + " / ";
				}
				if(text == "예약 명단 : "){
					$("#cal10").hide();
				}
				else{
					$("#cal15").html(text);
					$("#cal15").show();
				}
				text = "예약 명단 : "
				for ( var i=0; i<result.docCal16.length; i++) {
					text += result.docCal16[i] + " / ";
				}
				if(text == "예약 명단 : "){
					$("#cal10").hide();
				}
				else{
					$("#cal16").html(text);
					$("#cal16").show();
				}
				text = "예약 명단 : "
				for ( var i=0; i<result.docCal17.length; i++) {
					text += result.docCal17[i] + " / ";
				}
				if(text == "예약 명단 : "){
					$("#cal10").hide();
				}
				else{
					$("#cal17").html(text);
					$("#cal17").show();
				}
				alert("검색 완료");
			},
			error : function(error) {
				console.log(error);
				alert("검색 실패");
			}
		});
	}
	$("#date").on('change', function() {
		$("#dateT").val($("#date").val());
	});
</script>
</html>