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
<head>
<jsp:include page="header.jsp" />
<!-- bradcam_area_start  -->
<div class="angg2">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="angg">
					<h3>공지사항</h3>
					<p>
						<a href="./home">Home /</a> 공지사항
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- bradcam_area_end  -->
</head>
<body>


	<br>
	<br>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h2 class="text-center">공지사항 수정하기</h2>
			<p></p>
			<form action="nUpdateProc" method="post"
				enctype="multipart/form-data">
				<div class="table table-responsive">
					<table class="table table-striped">
						<tr>
							<td>제목</td>
							<td><input type="text" class="form-control" name="n_name"
								placeholder="[공지사항]" value="${nDto.n_name}">
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" class="form-control" name="m_id"
								readonly="readonly" value="admin"></td>
						</tr>

						<tr>
							<td>파일첨부</td>
							<td>
								<div class="input-group">
									<input type="file" name="files" id="file" multiple> <input
										type="hidden" id="filecheck" value="0" name="fileCheck">
								</div>
							</td>
						</tr>

						<tr>
							<td>글내용</td>
							<td><textarea rows="10" cols="50" name="n_content"
									class="form-control">${nDto.n_content}</textarea>
								<input type="hidden" value="${nDto.n_num}" name="n_num">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center"><input type="submit"
								value="완료" class="btn btn-primary"> <input type="reset"
								value="취소" class="btn btn-primary"></td>
						</tr>

					</table>


				</div>
			</form>
		</div>
	</div>

	<jsp:include page="Footer.jsp" />
</body>

<script type="text/javascript">
$(function(){
	   var chk ="${msg}";
	   var identy ="${mb.m_id}";
	   var hidenty ="${hb.h_id}";
	   if(chk != ""){
	      alert(chk);
	      location.reload(true);
	   }
	   if(identy == ""){
	   $(".home").hide();
	   $(".common").hide();
	   $(".admin").hide();
	   $(".hosH").hide();
	   }
	   else if(hidenty != ""){
		   $(".hosH").show();
		   $(".common").show();
		   $(".admin").hide();
		   $(".nUser").hide();
		   $(".home").hide();
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
	$("#file").on('change', function() {
		var files = $("#file")[0].files;
		console.log(files);

		var fileName = "";

		for (var i = 0; i < files.length; i++) {
			fileName += files[i].name + " ";
		}
		console.log(fileName);

		if (fileName == "") {
			console.log("empty");
			$("#filecheck").val(0);
		} else {
			console.log("not empty");
			$("#filecheck").val(1);
		}
	});
	
</script>
</html>