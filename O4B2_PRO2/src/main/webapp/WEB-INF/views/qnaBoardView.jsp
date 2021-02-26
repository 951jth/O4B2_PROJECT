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
						<td>${qBoard.qb_num}</td>
						<th class="success">작성자</th>
						<td>${qBoard.m_id}</td>
					</tr>


					<tr>
						<th class="success">작성일</th>
						<td colspan="3">${qBoard.qb_date}</td>
					</tr>

					<tr>
						<th class="success">제목</th>
						<td colspan="3">${qBoard.qb_title}</td>
					</tr>

					<tr>
						<th class="success">글 내용</th>
						<td colspan="3">${qBoard.qb_contents}</td>
					</tr>

					<tr>
						<th class="success">첨부파일</th>
						<td colspan="3"><c:if test="${empty qbfList}">
								첨부된 파일이 없습니다.
							</c:if> <c:if test="${!empty qbfList}">
								<a href="./qnaDownload?qbnum=${qBoard.qb_num}"><span
									class="file-title">${qBoard.qb_file}</span></a>
							</c:if></td>
					</tr>

					<tr>
						<td colspan="4" class="text-center">
						<a href="./qBoardUp?qBoard=${qBoard}">
						<input type="button" class="btn btn-primary" value="수정하기"></a>
						<c:if test="${mb.m_id == qBoard.m_id}">
							<a href="qBoardDelete?q_num=${qBoard.qb_num}" >
							<input
							type="button" class="btn btn-primary" value="삭제하기">
							</a>
						</c:if>
						<a href="./qnaBoardList">
						<input type="button" class="btn btn-primary" value="목록보기"></a></td>
					</tr>



				</table>

			</div>

		</div>
	</div>
	<div class="row">
		<div class="col-xs-2 col-md-2"></div>
		<div class="col-xs-8 col-md-8">

			<!-- 댓글 작성 양식 -->
			<form id="rFrm">
				<textarea rows="3" class="commentwrite" name="qbc_comment" id="comment"
					placeholder="댓글을 적어주세요" style="resize: none;"></textarea>
				<input type="button" value="댓글전송" class="btn-write"
					onclick="qnaReplyInsert(${qBoard.qb_num})"
					style="width: 100%; margin-bottom: 30px;">
			</form>
			<!-- 댓글 목록 출력 부분 -->
			<table style="width: 100%; border-bottom: 1px solid black;">
				<tr align="center" height="30">
					<td width="20%">WRITER</td>
					<td width="50%">CONTENTS</td>
					<td width="30%">DATE</td>
				</tr>
			</table>
			<table id="rtable"
				style="width: 100%; border-bottom: 1px solid black; margin-bottom: 30px;">
				<c:forEach var="qbc" items="${qcomment}">
					<tr height="25" align="center">
						<td width="20%">${qbc.m_id}</td>
						<td width="50%">${qbc.qbc_comment}</td>
						<td width="30%">${qbc.qbc_date}</td>
					</tr>
				</c:forEach>
			</table>

		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>



</body>
<script src="resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript">
	function qnaReplyInsert(qb_num) {
		//form 데이터를 json으로 변환
		var replyFrm = $("#rFrm").serializeObject();
		replyFrm.qb_num = qb_num;//글번호 추가
		replyFrm.m_id = "${mb.m_id}";//작성자(로그인한) 아이디

		console.log(replyFrm);

		$.ajax({
			url : "qnaReplyIns",
			type : "post",
			data : replyFrm,
			dataType : "json",
			success : function(data) {
				var rlist = "";
				var dlist = data.rList;

				for (var i = 0; i < dlist.length; i++) {
					rlist += '<tr height="25" align="center">'
							+ '<td width="20%">' + dlist[i].m_id + '</td>'
							+ '<td width="50%">' + dlist[i].qbc_comment + '</td>'
							+ '<td width="30%">' + dlist[i].qbc_date + '</td>';
				}
				$('#rtable').html(rlist);
			},
			error : function(error) {
				console.log(error);
				alert("댓글 입력 실패");
			}
		});

		$("#comment").val("");
	}
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
