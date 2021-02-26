<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
		console.log("메세지값:" + chk);
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
			$(".refuseOn").hide();
			$(".refuseOff").hide();
			if (identy == "admin") {
				$(".admin").show();
			}
		} else if (hosid != "") {
			$(".hosH").show();
			$(".common").hide();
			$(".admin").hide();
			$(".home").hide();
			$(".nUser").hide();
			$(".refuseOn").hide();
		} else {
			$(".home").hide();
			$(".common").hide();
			$(".admin").hide();
			$(".hosH").hide();
			$(".nUser").show();
		}
	});
	
	function refuse(me_num){
		console.log("me_num: "+ me_num);
		var refuseOff = "refuseOff-" + me_num;
		var refuseOn = "refuseOn-" + me_num;
		//var me_num = me_num;
		//console.log("refuseOn:" + refuseOn);
		$('#' + refuseOff).hide();
		$('#' + refuseOn).show();
	}
	
</script>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- bradcam_area_start  -->
	<div class="bradcam_area breadcam_bg_2 bradcam_overlay">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text">
						<h3>CLICINC</h3>
						<p>
							<a href="./home">Home /</a> CLICINC
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
					<h3>과거 진료 내역</h3>
					<hr>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>병원명</th>
								<th>진료과 / 의사명</th>
								<th>환자ID</th>
								<th>진료예약일시</th>
								<th>예약상태</th>
								<th>거부사유</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="complete" items="${completeMedi}">
								<tr class="table table-hover">
									<td>${completeHos}</td>
									<td>${complete.me_major}/ ${completeDoc}</td>
									<td>${complete.m_id}</td>
									<td>${complete.m_date}</td>
									<td>${complete.me_pattern}</td>				
									<td>${complete.me_creason}</td>
									<c:if test="${complete.me_pattern == '진료완료'}">
										<c:if test="${hb.h_id != null}">
										<td>
											<button class="btn btn-primary btn-sm text-light">
											<a href="./preInput?me_num=${complete.me_num}" 
											target="_blank" class=" text-light"
											onclick="window.open(this.href, 'popup', 'width=500, height=500, location=no,status=no,scrollbars=yes'); return false;">
												처방등록</a>
											</button>
										</td>
										</c:if>
									</c:if>
								</tr>
								
							</c:forEach>
						</tbody>
					</table>
					<br> <br> <br>
					<h3>예약 확인</h3>
					<hr>

					<table class="table table-hover">
						<thead>
							<tr>
								<th>병원명</th>
								<th>진료과 / 의사명</th>
								<th>환자ID</th>
								<th>진료예약일시</th>
								<th>예약상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="rese" items="${reseMedi}">
								<tr>
									<td>${reseHos}</td>
									<td>${rese.me_major}/ ${reseDoc}</td>
									<td>${rese.m_id}</td>
									<td>${rese.m_date}</td>
									<td>${rese.me_pattern}</td>
									<td class="home">
										<button type="button" class="btn btn-primary btn-sm">
											<a href="./urecancel?me_num=${rese.me_num}" target="_blank" class=" text-light"
												onclick="window.open(this.href, 'popup', 'width=570, height=420, location=no,status=no,scrollbars=yes'); return false;">
												예약취소</a>
										</button>
									</td>
									<td class="refuseOff" id="refuseOff-${rese.me_num}">
										<button type="button" class="btn btn-primary btn-sm text-light" onclick="refuse(${rese.me_num})">
											예약거부
										</button>
									</td>
									<td class="refuseOn" id="refuseOn-${rese.me_num}">
										<form action="refuse" method="post">
											<input type="hidden" name="me_num" value="${rese.me_num}">
											<input type="text" name="me_creason" placeholder="거부사유를 작성해 주세요.">
											<input type="submit" value="전송">
										</form>
									</td>
									<td class="hosH">
									<button type="button" class="btn btn-primary btn-sm">
									<a href="./resePermit?me_num=${rese.me_num}" class="text-light">진료완료</a></button>
									</td>			
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>