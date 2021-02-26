<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<style>
.ang2 {

    padding: 148px 0px;
	
    background-image: url(resources/img/topimg.jpg);
    background-size: 100%;
}
</style>
<head>
<jsp:include page="header.jsp" />
<!-- bradcam_area_start  -->
<div class="ang2">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="bradcam_text">
					<h3>HOSPITAL INFO</h3>
					<p>
						<a href="./home">Home /</a> HOSPITAL INFO
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</head>
<script type="text/javascript">
$(function(){
	   var chk ="${msg}";
	   
	   if(chk != ""){
	      alert(chk);
	      location.reload(true);
	   }
		   $(".hosH").show();
		   $(".common").hide();
		   $(".admin").hide();
		   $(".home").hide();
		   $(".nUser").hide();
	});
</script>
<body>


	<br>
	<br>
	<div class="container" align="center">
		<div class="row">
			<div class="col-sm-12">
				<div class="col-sm-2"></div>
				<div class="col-sm-9">
					<h2 class="text-center">병원 정보 보기</h2>
					<table class="table table-striped">
						<br>
						<tr>
							<td>병원이름</td>
							<td>${hb.h_name}</td>

						</tr>

						<tr>
							<td>병원대표</td>
							<td>${hb.h_repre}</td>

						</tr>

						<tr>
							<td>진료과목</td>
							<td>${hb.h_major}</td>

						</tr>

						<tr>
							<td>주소</td>
							<td>${hb.h_addr}</td>

						</tr>

						<tr>
							<td>아이디</td>
							<td>${hb.h_id}</td>

						</tr>
						<tr>
							<td>사업자등록번호</td>
							<td>${hb.h_cn}</td>

						</tr>
						<tr>
							<td class="text-center" colspan="2"><br> <a
								href="./hosInfoUpdate"><button class="btn btn-primary">정보수정</button></a>
								<a
								href="./hinfo?hId=${hb.h_id}"><button class="btn btn-primary">병원페이지이동</button></a>
							</td>
						</tr>

					</table>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>