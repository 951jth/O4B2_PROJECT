<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<title>처방전 등록</title>
</head>
<style>
#tableBox {
	float: none;
	margin: 0 auto
}
</style>
<script type="text/javascript">
	$(function(){
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
	});
	function pView(p_num,me_num){
		console.log(p_num);
		var me_json = {"p_num" : p_num};
		var me_num = me_num;
		$.ajax({
			url: "pView",
			type: "get",
			data: me_json,
			dataType: "json",
			success: function(data){
				console.log(data);
				var p_hname = data.p_hname;
				var p_dname = data.p_dname;
				var p_major = data.p_major;
				var h_id = data.h_id;
				var m_id = data.m_id;
				var p_comment = data.p_comment;
				var p_image = "resources/upload/" + data.p_image;
				
				$("#p_dname").val(p_dname);
				$("#p_major").val(p_major);
				$("#p_hname").val(p_hname);
				$("#h_id").val(h_id);
				$("#m_id").val(m_id);
				$("#me_num").val(me_num);
				$("#p_image").attr("src",p_image);
				$("#p_comment").html(p_comment);
			},
			error: function(error){
				alert("처리실패");
				console.log(error);
			}
		})
		
	}
</script>
<body>
	<header
		style="border-bottom: 1px solid black; position: absolute; left: 0; top: 0; width: 100%">
		<img src="resources/img/o4b2_logo.png"
			style="width: 70px; height: 40px; margin: 5px 0 0 5px;">
	</header>
	<aside
		style="border-right: 1px solid black; position: absolute; left: 0; top: 50px; width: 25%; height: 100%; text-align: center;">
		<table class="table table-striped"
			style="border-bottom: 1px solid black; width: 100%; margin: 10px auto; padding-bottom: 10px;">
			<c:if test="${mb.m_id != null}">
				<tr>
					<th>환자ID</th>
					<td id="m_id"></td>
				</tr>
			</c:if>
			<c:if test="${hb.h_id != null}">
				<tr>
					<th>병원ID</th>
					<td>${hb.h_name}</td>
				</tr>
			</c:if>
		</table>
		<div style="margin-top: 5px; inline-block; text-aling: center;">
			<!-- 
			<p>
				<input type="text" class="form-control" placeholder='처방전 검색'
					onfocus="this.placeholder = ''"
					onblur="this.placeholder = '처방전 검색'">
			</p>
			 -->
			<hr>
			<c:forEach var="vitem" items="${pList}">
				<tr>
					<br>
					<th>진료과목:<input type="text" name="p_major"
						value="${vitem.p_major}" readonly="readonly"></th>
					</p>
					<th>진료번호:<input type="text" name="me_num"
						value="${vitem.me_num}" readonly="readonly"></th>
					</br>
					<br>
					<th>병원이름:<input type="text" name="p_hname"
						value="${vitem.p_hname}" readonly="readonly"></th>
					</p>
					<th>의사이름:<input type="text" name="p_dname"
						value="${vitem.p_dname}" readonly="readonly"></th>
					</br>
					<th><button class="btn btn-primary"
							onclick="pView(${vitem.p_num},${vitem.me_num})">상세보기</button>
						<c:if test="${hb.h_id == vitem.h_id}">
							<button class="btn btn-primary"
							onclick="location.href='deletePre?p_num=${vitem.p_num}'">삭제하기</button>
						</c:if>
							</th>
						<hr>
				</tr>
			</div>
			</c:forEach>
				<div class="btn-area">
				<div class="paging">${pPaging}</div>
		</div>
	</aside>
	<section
		style="position: absolute; top: 45px; left: 25%; width: 75%; height: 100%; text-align: center;">
		<h2>처 방 전 서 식</h2>
		<div
			style="border: 1px solid black; width: 80%; height: 80%; margin: auto;">
			<h2>처&nbsp;&nbsp;&nbsp;방&nbsp;&nbsp;&nbsp;전</h2>
			<div class="col-md-12">
		<img src="resources/img/o4b2_logo.png"
						style="height: 100px; width: 100px;">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<img src="resources/img/o4b2_logo.png" id="p_image"
								style="height: 250px; width: 250px;">
						</div>
						<table class="table table-striped col-md-6" id="tableBox">
								<tr>
									<th>병원이름 : <input type="text" name="p_hname" id="p_hname"
										 readonly="readonly"></th>
								</tr>
								<tr>
									<th>진료과목 : <input type="text" name="p_major" id="p_major"
										 readonly="readonly"> <input
										type="hidden" name="me_num" value="${pDto.me_num}">
									</th>
								</tr>
								<tr>
									<th>의사이름 : <input type="text" name="p_dname" id="p_dname"
										 readonly="readonly"></th>
								</tr>
								<tr>
									<th>병원아이디 : <input type="text" name="h_id" id="h_id"
										readonly="readonly"></th>
								</tr>
								<tr>
									<th>환자아이디 : <input type="text" name="m_id" id="m_id"
										readonly="readonly"></th>
								</tr>
								<tr>
									<th>진료번호 : <input type="text" name="me_num" id="me_num"
										readonly="readonly"></th>
								</tr>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						</p>
						</p>
						<div class="form-group">
							<textarea class="form-control" rows="10" id="p_comment"
								name="p_comment"></textarea>
						</div>
					</div>
				</div>
			</div>
	</section>
</body>
</html>