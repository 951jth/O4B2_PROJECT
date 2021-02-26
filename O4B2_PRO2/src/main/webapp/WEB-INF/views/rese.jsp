<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!-- 데이터피커 시작 -->
<!-- datepicker 는 jquery 1.7.1 이상 bootstrap 2.0.4 이상 버전이 필요함 -->
<!-- jQuery가 먼저 로드 된 후 datepicker가 로드 되어야함.-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>

<div class="content">
	<div class="container">
		<div class="row">

			<div
				class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb30 text-center">
				<h2>진료예약</h2>

			</div>
		</div>
		<div class="row">

			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb30">
				<div class="tour-booking-form">
					<form action="reseIn" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
								<h4 class="tour-form-title">진료예약서</h4>
							</div>
							<input type="hidden" name="hId" value="${h_id}">
							<div class="col-xl-12 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="control-label required" for="select">병원찾기</label>
									<div class="hos">
										<input type="text" class="form-control" name="hosName"
											value="${h_name}" readonly="readonly" style="width: 100%">
									</div>
								</div>
							</div>
							<!-- 데이터피커 -->
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="control-label" for="">방문날짜</label>
									<input type="text" name="date" id="dateT"
									hidden="hidden"><input type="date" name="date"
									class="form-control" id="date" pattern="yyyy-MM-dd">
								</div>
									
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<label class="control-label" for="">방문시간</label>
								<div class="form-group">
								<select name="me_time" class="form-control">
									<option value="1">(오전9시~10시)09:00 ~ 10:00</option>
									<option value="2">(오전10시~11시)10:00 ~ 11:00</option>
									<option value="3">(오전11시~12시)11:00 ~ 12:00</option>
									<option value="4">(오후1시~2시)13:00 ~ 14:00</option>
									<option value="5">(오후2시~3시)14:00 ~ 15:00</option>
									<option value="6">(오후3시~4시)15:00 ~ 16:00</option>
									<option value="7">(오후4시~5시)16:00 ~ 17:00</option>
									<option value="8">(오후5시~6시)17:00 ~ 18:00</option>
								</select>
								</div>
					
							</div>
							
							<!-- 데이터피커 -->
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="control-label required" for="select">종류</label>
									<div class="select">
										<select id="major" name="major" class="form-control"
											style="font-size: 12px">
											<option value="" selected disabled>방문하실 과를 선택해 주세요.</option>
											<c:if test="${im}">
												<option value="내과">내과</option>
											</c:if>
											<c:if test="${ent}">
												<option value="이비인후과">이비인후과</option>
											</c:if>
											<c:if test="${os}">
												<option value="정형외과">정형외과</option>
											</c:if>
											<c:if test="${ps}">
												<option value="성형외과">성형외과</option>
											</c:if>
											<c:if test="${dm}">
												<option value="피부과">피부과</option>
											</c:if>
										</select>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="control-label required" for="select">의사선생님</label>
									<div class="select">
										<select id="doc" name="d_num" class="form-control"
											style="font-size: 12px">
											<option value="">찾으시는 의사선생님을 선택해 주세요</option>
											<c:forEach var="docList" items="${docList}">
												<option value="${docList.d_num}">${docList.d_name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt30">
								<h4 class="tour-form-title">신상정보입력</h4>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<input type="text" name="userId" hidden="hidden"
										value="${mb.m_id}"> <label class="control-label"
										for="name">이름</label> <input id="name" name="name" type="text"
										placeholder="이름" class="form-control" required
										readonly="readonly" value="admin">
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="control-label" for="phone"> 전화번호</label> <input
										id="phone" name="phone" type="text" placeholder="-없이 입력"
										class="form-control" required>
								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="control-label" for="textarea">내원전 참고사항</label>
									<textarea class="form-control" id="textarea" name="textarea"
										rows="4" placeholder="의사선생님이 알아야 할 것을 작성해 주세요"></textarea>
								</div>
							</div>
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<button type="submit" name="singlebutton"
									class="btn btn-primary">예약하기</button>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
		<div class="row">
			<div
				class="col-lg-12 col-md-12 col-sm-12 col-xs-12  text-center mt20">
				Created for <a href="" target="_blank">O4B2</a>
			</div>
		</div>
	</div>
</div>
<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
<script type="text/javascript">
	$(function() {
		var chk = "${msg}";
		if (chk != "") {
			alert(chk);
			location.reload(true);
		}
		$(".home").show();
		$(".common").show();
		$(".admin").hide();
		$(".hosH").hide();
		$(".nUser").hide();
		if (identy == "admin") {
			$(".admin").show();
		}
		
	});
	
	$("#date").on('change', function() {
		$("#dateT").val($("#date").val());
	});
</script>
