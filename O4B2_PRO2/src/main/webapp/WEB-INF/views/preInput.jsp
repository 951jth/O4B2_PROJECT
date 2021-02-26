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

<img src="resources/img/o4b2_logo.png" width="100px" height="100px">
<div class="container-fluid">
		<h2>처방등록</h2>
		<form action="preInputProc" enctype="multipart/form-data"
			method="post">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>병원이름 :</th>
						<th><input type="text" name="p_hname" value="${pDto.p_hname}"
							readonly="readonly"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>진료과목:</th>
						<th><input type="text" name="p_major" value="${pDto.p_major}"
							readonly="readonly">
							<input type="hidden" name="me_num" value="${pDto.me_num}">
						<th>
					</tr>
					<tr>
						<th>의사이름</th>
						<th><input type="text" name="p_dname" value="${pDto.p_dname}"
							readonly="readonly"></th>
							<input type="hidden" name="d_num" value="${pDto.d_num}">
					</tr>
					<tr>
						<th>병원아이디</th>
						<th><input type="text" name="h_id" value="${pDto.h_id}"></th>
					</tr>
					<tr>
						<th>환자아이디</th>
						<th><input type="text" name="m_id" value="${pDto.m_id}"></th>
					</tr>
					<tr>
						<th>처방사진</th>
						<th><input type="file" placeholder="처방전사진" name="p_image" 
						id="p_image">
						<input class="upload-name" value="파일선택"
										readonly>
						<input type="hidden"
								id="filecheck" value="0" name="filecheck">
						</th>						
					</tr>
					<!-- 데이터피커 -->
								<div class="form-group">

									<label class="control-label" for="datepicker">방문날짜</label>

									<p>날짜 선택</p>
								<input type="text" name="date" id="dateT"
									hidden="hidden" value=""><input type="date"
									class="form-control" id="date" pattern="yyyy-MM-dd" name="p_date">
								</div>
				<!-- 데이터피커 -->
				</tbody>
			</table>
			<div class="form-group">
				<label for="comment">Comment:</label>
				<textarea class="form-control" rows="10" id="comment"
					name="p_comment"></textarea>
				<input type="submit" value="전송">
			</div>
		</form>

</div>

<script type="text/javascript">
	$("#p_image").on('change',function(){
		var files = $("#p_image")[0].files;
		var fileName = "";
		
		for(var i = 0; i < files.length; i++){
			fileName += files[i].name + " ";
		}
		console.log("파일네임값:" + fileName);
		$(".upload-name").val(fileName);
		console.log(fileName);
		if(fileName != ""){
			$("#filecheck").val(1);
		}	
	})
	$("#date").on('change', function() {
		$("#dateT").val($("#date").val());
	});
</script>