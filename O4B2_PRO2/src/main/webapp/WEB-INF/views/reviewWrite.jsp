<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="zxx">

<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/slicknav.css">
<link rel="stylesheet" href="resources/css/style.css">
<link href="resources/css/bootstrap2.min.css" rel="stylesheet">
<link href="resources/css/style2.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script type="text/javascript">
$(function() {
	//var dt = new Date();
	//var d = dt.toFormat('YYYY-MM-DD HH24:MI:SS');
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
	   $("#wbutton").hide();
	   }
	   else if(identy != ""){
	   $(".home").show();
	   $(".common").show();
	   $(".admin").hide();
	   $(".hosH").hide();
	   $(".nUser").hide();
	   $("#wbutton").show();
	      if(identy == "admin"){
	         $(".admin").show();
	      }
	   }

});
</script>
<head>

</head>

<style>
body {
	background-color: #eee
}

div.stars {
	width: 270px;
	display: inline-block
}

.mt-200 {
	margin-top: 200px
}

input.star {
	display: none
}

label.star {
	float: right;
	padding: 10px;
	font-size: 36px;
	color: #4A148C;
	transition: all .2s
}

input.star:checked ~label.star:before {
	content: '\f005';
	color: #FD4;
	transition: all .25s
}

input.star-5:checked ~label.star:before {
	color: #FE7;
	text-shadow: 0 0 20px #952
}

input.star-1:checked ~label.star:before {
	color: #F62
}

label.star:hover {
	transform: rotate(-15deg) scale(1.3)
}

label.star:before {
	content: '\f006';
	font-family: FontAwesome
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
<body>

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
	<!-- contact start -->
	<div class="space-medium">
		<div class="container">
			<div class="row">
				<div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12">
					<h1>리뷰쓰기 및 수정</h1>
					<div class="row">
						<form action="reviewWriteProc" method="post"
							enctype="multipart/form-data">
							<!-- 
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label" for="phone">작성시각</label> <input
										id="sysdate" name="" type="text" class="form-control"
										placeholder="작성시각">
								</div>
							</div>
							 -->
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label" for="phone">병원명</label> <input
										id="phone" name="h_name" type="text" class="form-control"
										placeholder="병원명">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label" for="phone">이미지</label> <input
										id="image" name="r_image" type="file" class="form-control"
										placeholder="파일을 올려주세요."> 
										<input type="hidden"
										id="filecheck" value="0" name="filecheck">
										
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label" for="subject">의사이름</label> <input
										id="image" name="d_name" type="text" class="form-control"
										placeholder="">

								</div>
							</div>
							<div class="col-md-12">
								<textarea class="form-control" id="textarea" name="r_title"
									rows="1" placeholder="제목"></textarea>
							</div>
							</p>
							<div class="col-md-12">
								<div class="form-group">
									<textarea class="form-control" id="textarea" name="r_contents"
										rows="6" placeholder="내용"></textarea>
								</div>
							</div>


							<div class="row">
								<div class="col-md-8">
									<div class="stars">
										<input class="star star-5" id="star-5" type="radio" value="1"
											name="r_star" /> <label class="star star-5" for="star-5"></label>
										<input class="star star-4" id="star-4" type="radio" value="2"
											name="r_star" /> <label class="star star-4" for="star-4"></label>
										<input class="star star-3" id="star-3" type="radio" value="3"
											name="r_star" /> <label class="star star-3" for="star-3"></label>
										<input class="star star-2" id="star-2" type="radio" value="4"
											name="r_star" /> <label class="star star-2" for="star-2"></label>
										<input class="star star-1" id="star-1" type="radio" value="5"
											name="r_star" /> <label class="star star-1" for="star-1"></label>
									</div>
								</div>
								<div class="col-md-4">
								<div class="form-group">
									</p>
									</p>
									<div class="col-xs-offset-3 col-xs-10">
									<c:if test="${check == '1'}">
										&emsp;<input name="Submit" type="submit"
										value="리뷰등록" class="btn btn-primary">
									</c:if>
									<c:if test="${check == '2'}">
										<input type="hidden" value="1" name="ucheck" id="ucheck">
										&emsp;<input name="Submit" type="submit"
										value="리뷰수정" class="btn btn-primary">
										<input type="hidden" value="${r_num}" id="r_num" name="r_num">
									</c:if>
									
								</div>
								</div>
							</div>
							</div>

		
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
<script>
$("#image").on('change', function(){
	var files = $("#image")[0].files;
	console.log(files);
	
	var fileName = "";
	
	for (var i = 0; i < files.length; i++){
		fileName += files[i].name + " ";
	}
	console.log("파일네임값:" + fileName);
	if(fileName == ""){
		console.log("empty");
		$("#filecheck").val(0);
	}
	else{
		console.log("not empty");
		$("#filecheck").val(1);
	}
});
$( ".star_rating a" ).click(function() {
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
    return false;
});
</script>
</html>