<%@page import="com.o4b2.pro.dto.HospitalDto"%>
<%@page import="com.o4b2.pro.dao.HospitalDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>다치료해 | 병원 예약을 쉽고 빠르게</title>
<jsp:include page="header.jsp" />
<!-- bradcam_area_start  -->
<div class="bradcam_area breadcam_bg_2 bradcam_overlay">
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
<!-- bradcam_area_end  -->
</head>

	<br>
	<br>
	<div class="container" align="center">
		<div class="row">
			<div class="col-sm-12">
				<div class="col-sm-2"></div>
				<div class="col-sm-9">
					<br>
					<br>
					<h2 class="text-center">병원 정보 수정하기</h2>

					<form action="HospitalUpdate" method="post" enctype="multipart/form-data">

						<table class="table table-striped">
							<br>
						
							
							<tr>
								<td>아이디</td>
								<td><input type="text" value="${hb.h_id}" name="h_id"
									hidden="hidden">${hb.h_id}</td>
							</tr>
							
							<tr>
								<td>병원대표</td>
								<td><input type="text" value="" name="h_repre"
									class="form-control"></td>
							</tr>

							<tr>
								<td>비밀번호</td>
								<td><input type="password" value="" name="h_pwd"
									class="form-control"></td>
							</tr>
							
							<tr>
								<td>사업자등록번호</td>
								<td><input type="text" value="" name="h_cn"
									class="form-control"></td>
							</tr>
							
							<tr>
								<td colspan="2" class="text-center"> <input type="submit"
									 value="수정완료" class="btn btn-primary"></td>
							</tr>

						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>