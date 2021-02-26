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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>
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
</script>
<jsp:include page="header.jsp"></jsp:include>
<!-- bradcam_area_start  -->
<div class="angg2">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="angg">
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
<body>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>Q&amp;A 게시판</h3>
				<div class="sBoradList">
					<article class="sBoardListLine">
						<div class="sBoardList2">번호</div>
						<div class="sBoardList3">제목</div>
						<div class="sBoardList4">작성자</div>
						<div class="sBoardList5">작성일</div>
					</article>
					<c:forEach var="nitem" items="${nList}">
						<article class="sBoardListLine">
							<div class="sBoardList2">${nitem.n_num}</div>
							<div class="sBoardList3">
								<a href="noticeView?n_num=${nitem.n_num}"><B>[공지사항]${nitem.n_name}</B></a>
							</div>
							<div class="sBoardList4">${nitem.m_id}</div>
							<div class="sBoardList5">${nitem.n_date}</div>
						</article>
					</c:forEach>
					<c:forEach var="qnaBoard" items="${qbList}">
						<article class="sBoardListLine">
							<div class="sBoardList2">${qnaBoard.qb_num}</div>
							<div class="sBoardList3">
								<a href="qnacontents?qbnum=${qnaBoard.qb_num}">${qnaBoard.qb_title}</a>
							</div>
							<div class="sBoardList4">${qnaBoard.m_id}</div>
							<div class="sBoardList5">${qnaBoard.qb_date}</div>
						</article>
					</c:forEach>
				</div>
				<div class="btn-area">
					<div class="paging">${qnaPaging}</div>
					<button class="wr-btn" onclick="location.href='./qnaWrite'">글쓰기</button>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>