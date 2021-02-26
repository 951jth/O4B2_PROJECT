<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/style.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<jsp:include page="header.jsp" />
<!-- bradcam_area_start  -->
<div class="bradcam_area breadcam_bg_2 bradcam_overlay">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="bradcam_text">
					<h3>공지사항</h3>
					<p>
						<a href="./home">Home /</a> notice
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
		<div class="col-xs-2 col-md-2"></div>
		<div class="col-xs-8 col-md-8">
			<h2 class="text-center">게시글 보기</h2>
			<p>&nbsp;</p>
			<div class="table table-responsive">
				<table class="table">
					<tr>
						<th class="success">글번호</th>
						<td>${nDto.n_num}</td>
						<th class="success">작성자</th>
						<td>${nDto.m_id}</td>
					</tr>


					<tr>
						<th class="success">작성일</th>
						<td colspan="3">${nDto.n_date}</td>
					</tr>

					<tr>
						<th class="success">제목</th>
						<td colspan="3">${nDto.n_name}</td>
					</tr>

					<tr>
						<th class="success">글 내용</th>
						<td colspan="3">${nDto.n_content}</td>
					</tr>

					<tr>
						<th class="success">첨부파일</th>
						<td colspan="3"><c:if test="${empty nfList}">
								첨부된 파일이 없습니다.
							</c:if> <c:if test="${!empty nfList}">
								<a href="./nDownload?n_num=${nDto.n_num}"><span
									class="file-title">${nDto.n_file}</span></a>
							</c:if></td>
					</tr>
					
					<tr>
						<td colspan="4" class="text-center">
						<c:if test="${mb.m_id == 'admin'}">
							<button
							class="btn btn-primary" 
								onclick="location.href='updateNotice'">
							수정하기</button> 
							<input
							type="button" class="btn btn-primary" value="삭제하기"
								onclick="location.href='deleteNotice?n_num=${nDto.n_num}'">
						</c:if>
							 <a
							href="./qnaBoardList"><input type="button"
								class="btn btn-primary" value="목록보기"></a></td>
					</tr>


				</table>

			</div>

		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>



</body>
<script src="resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript">
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
</html>
