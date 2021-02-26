<%@page import="com.o4b2.pro.dto.MemberDto"%>
<%@page import="com.o4b2.pro.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<style>
.angg2 {
	padding: 148px 0px;
	background-image: url(resources/img/topimg.jpg);
	background-size: 100%;
}

.angg h3 {
	font-size: 50px;
	color: #fff;
	font-weight: 600;
	margin-bottom: 0;
	text-transform: capitalize;
}
</style>
<title>다치료해 | 병원 예약을 쉽고 빠르게</title>
<jsp:include page="header.jsp" />
<!-- bradcam_area_start  -->
<div class="angg2">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="angg">
					<h3>MYINFO</h3>
					<p>
						<a href="./home">Home /</a> MYINFO
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- bradcam_area_end  -->
<script>
$(function(){
	   var chk ="${msg}";
	   var identy ="${mb.m_id}";
	   
	   if(chk != ""){
	      alert(chk);
	      location.reload(true);
	   }
	   if(identy == ""){
	   $(".home").hide();
	   $(".common").hide();
	   $(".admin").hide();
	   $(".hosH").hide();
	   $("#nUser1").hide();
	   $("#nUser2").hide();
	   $("#nUser3").hide();
	   }
	   else{
	   $(".home").show();
	   $(".common").show();
	   $(".admin").hide();
	   $(".hosH").hide();
	   $(".nUser").hide();
	      if(identy == "admin"){
	         $(".admin").show();
	      }
	   }
	});
</script>
</head>
<body>
	<div class="container" align="center">
		<div class="row">
			<div class="col-sm-12">
				<div class="col-sm-2"></div>
				<div class="col-sm-9">
					<br> <br>
					<h2 class="text-center">회원 정보 수정하기</h2>

					<form action="MemberUpdate" method="post"
						enctype="multipart/form-data">

						<table class="table table-striped">
							<br>
							<tr>
								<td>아이디</td>
								<td><input type="text" value="${mb.m_id}" name="m_id"
									hidden="hidden">${mb.m_id}</td>

							</tr>

							<tr>
								<td>이메일</td>
								<td><input type="email" value="" name="m_mail"
									class="form-control"></td>
							</tr>

							<tr>
								<td>전화</td>
								<td><input type="text" value="" name="m_phone"
									class="form-control"></td>
							</tr>

							<tr>
								<td>패스워드</td>
								<td><input type="password" value="" name="m_pwd"
									class="form-control"></td>
							<tr>
								<br>
								<td colspan="2" class="text-center"><input type="submit"
									value="수정완료" class="btn btn-primary">
						</table>

					</form>

				</div>
			</div>
			<!-- col-sm-12 -->
		</div>
		<!-- row -->
	</div>
	<!-- container end-->
	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>