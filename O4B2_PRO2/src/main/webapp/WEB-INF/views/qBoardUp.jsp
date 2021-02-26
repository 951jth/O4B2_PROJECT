<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
</head>
<script>
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
	   $(".common").show();
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
<jsp:include page="header.jsp" />
<body>
<!-- bradcam_area_start  -->
<div class="bradcam_area breadcam_bg_2 bradcam_overlay">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="bradcam_text">
					<h3>Q&A</h3>
					<p>
						<a href="./home">Home /</a> Q&A
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- bradcam_area_end  -->

	<br>
	<br>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h2 class="text-center">Q&A 글쓰기</h2>
			<p></p>
			<form action="./qnaUp" method="post"
				enctype="multipart/form-data">
				<div class="table table-responsive">
					<table class="table table-striped">
						<tr>
							<td>제목</td>
							<td><input type="text" class="form-control" name="subject" value="${qBoard.qb_title}">
							<input type="hidden" value="${qBoard.qb_num}" name="qb_num"></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td><input type="text" class="form-control" name="qbdate"
								placeholder="${qBoard.qb_date}" readonly="readonly"></td>
						</tr>
						<tr>
							<td>작성자ID</td>
							<td><input type="text" class="form-control" name="mid" value="${qBoard.m_id}" readonly="readonly"></td>
						</tr>

						<tr>
							<td>글내용</td>
							<td><textarea rows="10" cols="50" name="content"
									class="form-control">${qBoard.qb_contents}</textarea></td>
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