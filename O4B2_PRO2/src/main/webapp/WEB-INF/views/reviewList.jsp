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
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/themify-icons.css">
<link rel="stylesheet" href="resources/css/nice-select.css">
<link rel="stylesheet" href="resources/css/flaticon.css">
<link rel="stylesheet" href="resources/css/gijgo.css">
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/slicknav.css">
<link rel="stylesheet" href="resources/css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>
<style>
.imgbox {
	float: left;
}

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
<!-- Services section -->
<jsp:include page="header.jsp"></jsp:include>
<!-- bradcam_area_start  -->
<div class="angg2">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="angg">
					<h3>REVIEW</h3>
					<p>
						<a href="./home">Home /</a> REVIEW
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- bradcam_area_end  -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review</title>


<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-3">
			<div class="p-4">
				<ul class="list-group">
					<c:forEach var="ritem" items="${rList}">
						<li>
							<div class="card p-3" data-toggle="collapse"
								data-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne">
								<div class="row">
									<div class="col-md-3">
										<img src="resources/upload/${ritem.r_image}" width="80"
											height="80" class="rounded-circle" id="imgbox">
									</div>
									<div class="col-md-9">
										<input type="text" class="form-control" name=""
											value="${ritem.r_title}" readonly="readonly"
											style="width: 100%" onclick="reviewForm(${ritem.r_num})">
										<p>
											ID :${ritem.m_id} / 번호 :
											<h id="r_num">${ritem.r_num}</h>
										</p>
										<p>병원이름 : ${ritem.h_name}</p>
										<c:if test="${ritem.m_id == mb.m_id}">
											<button class="sm-btm-primary" 
											onclick="location.href='./reviewWrite?check=2&r_num=${ritem.r_num}'">
											리뷰수정</button>
											<button class="sm-btm-primary" onclick="location.href='./rDelete?r_num=${ritem.r_num}'">
											리뷰삭제</button>
										</c:if>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="btn-area">
				<div class="paging">${rPaging}</div>
				<c:if test="${mb.m_id != null}">
					<button id="wbutton" class="wr-btn"
					onclick="location.href='./reviewWrite?check=1'">글쓰기</button>
				</c:if>
			</div>
		</div>
		<div class="col-md-4">
		<div class="p-4">
			<div class="card" style="width: 400px">
				<img src="o4b2_logo.png" class="card-img-top"  alt="Card image"
					style="width: 100%" id="r_image">
				<div class="card-body">
					<h4 id=r_star>리뷰를 클릭해보세요.</h4>
					<h4 class="card-title" id="r_title">리뷰를 클릭해보세요</h4>
					<p class="card-text" id="r_contents">리뷰를 클릭해보세요</p>
				</div>
			</div>
		</div>
		</div>
		
		<div class="col-md-2"></div>
	</div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>

<script type="text/javascript">
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
		   $(".common").hide();
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
	function reviewForm(r_num){	
		//var r_num = $("#r_num").text();
		console.log("r_num: "+ r_num);
		//전송형태를 js 객체(오브젝트) 형태로 변경
		var jsonR_num = {"r_num" : r_num};
		$.ajax({
			url: "reviewForm",
			type: "get",
			data: jsonR_num,
			dataType: "json",
			success: function(data){
				console.log(data);
				var r_title = data.r_title; 
				var r_star = data.r_star;
				var r_contents = data.r_contents;
				var m_id = data.m_id;
				var h_name = data.h_name;
				var r_image = "resources/upload/" + data.r_image;
				console.log(r_image);
				$("#r_title").html(r_title);
				$("#r_star").html(r_star);
				$("#r_contents").html(r_contents);
				$("#r_image").attr("src",r_image);
			},
			error: function(error){
				alert("처리실패");
				console.log(error);
			}
		})
	}
	
</script>