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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#tableset {
	background-image: url(resources/img/backH.jpg);
	background-repeat: no-repeat;
	background-size: 1920px 1280px;
	width: 100%;
}

.hcate {
	color: white;
	font-size: 22px;
	text-align: center;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	font-family: KoPubWorldDotumPB;
	font-size: px;
	font-weight: normal;
	font-stretch: normal;
	font-style: normal;
	line-height: 0.8;
	letter-spacing: 4px;
}

.hname {
	color: #6de6ff;
	font-size: 58px;
	text-align: center;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	font-family: KoPubWorldDotumPB;
	font-size: 64px;
	font-weight: bold;
	font-stretch: normal;
	font-style: normal;
	line-height: 0.8;
	letter-spacing: 4px;
}

.hadd {
	color: white;
	text-align: center;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	font-family: KoPubWorldDotumPB;
	font-weight: normal;
	font-stretch: normal;
	font-style: normal;
}

.text0 {
	color: #6de6ff;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	font-family: KoPubWorldDotumPB;
	font-weight: bold;
	font-stretch: normal;
	font-style: normal;
}

.text1 {
	color: white;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	font-family: KoPubWorldDotumPB;
	font-weight: normal;
	font-stretch: normal;
	font-style: normal;
}

.text3 {
	color: #2697f8;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	font-family: KoPubWorldDotumPB;
	font-weight: bold;
	font-stretch: normal;
	font-style: normal;
}

.doctor_list {
	width: 100%;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
}

.doctor_list>ul {
	margin: -25px 0 0 -25px;
}

.doctor_list>ul>li {
	width: 50%;
	padding: 25px 0 0 25px;
	display: inline-block;
	vertical-align: top;
	box-sizing: border-box;
}

.doctor_list .doctor_In {
	padding: 30px 20px;
	background-color: #fff;
	border: 1px solid #dbdbdb;
	padding: 30px 20px;
}

.doctor_list .doctor_In>.boxin {
	display: flex;
	display: -ms-flexbox;
	justify-content: space-between;
}

.doctor_list .doctor_In .photo {
	width: 192px;
	min-width: 192px;
	height: 242px;
	border: 1px solid #eaeaea;
	box-sizing: border-box;
}

.doctor_list .doctor_In .photo img {
	width: 190px !important;
	min-width: 190px;
	height: 240px !important;
	min-height: 240px;
}

.doctor_list .doctor_In .txtArea {
	width: 100%;
	max-width: 325px;
	padding-left: 0;
	box-sizing: border-box;
	position: relative;
}

.doctor_list .doctor_In .txtArea .name {
	padding: 10px 0 18px;
	border-bottom: 1px solid #dbdbdb;
	line-height: 1.3;
}

.doctor_list .doctor_In .txtArea .name>* {
	display: inline-block;
	vertical-align: bottom;
}

.doctor_list .doctor_In .txtArea .name>strong {
	font-size: 26px;
	color: #111;
}

.doctor_list .doctor_In .txtArea .name>span {
	padding: 0 0 3px 15px;
	font-size: 16px;
	color: #555;
}

.doctor_list .doctor_In .txtArea .department {
	padding-top: 22px;
	line-height: 1.3;
}

.doctor_list .doctor_In .txtArea .department>* {
	font-size: 16px;
	display: inline-block;
	vertical-align: top;
}

.doctor_list .doctor_In .txtArea .department>strong {
	padding-right: 4px;
	font-weight: 400;
	color: #252525;
}

.doctor_list .doctor_In .txtArea .department>span {
	color: #555;
}

.container-fluid2 {
	padding: 0px 50px 50px 0px;
}
</style>
<script type="text/javascript">
$(function(){
	   var chk ="${msg}";
	   var identy ="${mb.m_id}";
	   var hosid ="${hb.h_id}";
	   
	   if(chk != ""){
	      alert(chk);
	      location.reload(true);
	   }
	   if(identy != ""){
	   $(".home").show();
	   $(".common").hide();
	   $(".admin").hide();
	   $(".hosH").hide();
	   $(".nUser").hide();
	   if(identy == "admin"){
	         $(".admin").show();
	      }
	   }
	   else if(hosid != ""){
		   $(".hosH").show();
		   $(".common").show();
		   $(".admin").hide();
		   $(".home").hide();
		   $(".nUser").hide();
	   }
	   else{
	   $(".home").hide();
	   $(".common").hide();
	   $(".admin").hide();
	   $(".hosH").hide();
	   $(".nUser").show();  
	   }
	});
</script>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<div class="container-fluid p-3 my-3 bg-Secondary text-white">
		<div class="container" id="tableset">
			<div class="row">
				<div class="col-md-12">
					<br> <br> <br> <br>
					<h5 class="hcate">${hos.h_major}</h5>
					<br>
					<h2 class="hname">${hos.h_name}</h2>
					<br>
					<h5 class="hadd">${hos.h_addr}</h5>
					<br> <br> <br> <br>
					<div class="row">
						<div class="col-md-2"></div>
						<br>
						<div class="col-md-2">
							<h5 class="text0">병원정보</h5>
						</div>
						<div class="col-md-2">
							<h5 class="text1">대표전화</h5>
							<br>
							<h5 class="text1">진료시간</h5>
							<br>
							<h5 class="text1">입원진료</h5>
						</div>
						<div class="col-md-4">
							<h5></h5>
							<h5 class="text1">0${hos.h_call}</h5>
							<br>
							<h5 class="text1">평일 09 : 00 ~ 18 : 00 &nbsp;&nbsp; 토요일 10 :
								00 ~ 17 : 00 &nbsp;&nbsp; 일 . 공휴일 휴진</h5>
							<br>
							<h5 class="text1">불가능</h5>
							<br> <br>
						</div>
						<div class="col-md-2">
							<br> <br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container p-3 my-3">
		<br> <br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-2">
				<h2 class="text3">의료진정보</h2>
				<br> <br>
				<h5></h5>
			</div>
			<br>
			<div class="col-md-2">
				<h5 class="text3"></h5>
				<br> <br>

				<h5></h5>
			</div>
			<br>
			<div class="col-md-4"></div>
			<div class="col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-md-2"></div> 
			<div class="doctor_list">
				<ul>
					<c:forEach var="doc" items="${dList}">
						<li>
							<div class="doctor_In">
								<div class="boxin">
									<img src="resources/upload/${doc.d_dimage}" id="imgbox" style="height:150px; widht:150px;">
									<div class="txtArea">
										<div class="name">
											<strong>${doc.d_name}</strong>
										</div>
										<div class="department">
											<strong>진료과 :</strong><span>${doc.d_major}</span><br>
											<p>코맨트 : ${doc.d_comment}</p>
											<br>
											<button class="btn-btn-primary" onclick="location.href='deleteDoctor?d_num=${doc.d_num}'">
											의사삭제</button>
										</div>
									</div>
								</div>
							</div>
							
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="col-md-2"></div>
		</div>
		<br> <br>

		<div class="row">
			<div class="col-md-10"></div>
			<div class="col-md-2 btn-group">
				<button type="button" class="btn btn-secondary">
					<a class="text-light" href="sBoardList">게시글목록</a>
				</button>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="Footer.jsp"></jsp:include>
	</footer>
</body>
</html>