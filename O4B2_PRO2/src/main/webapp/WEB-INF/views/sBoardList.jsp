<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Docmed</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
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

<!-- <link rel="stylesheet" href="css/responsive.css"> -->
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
<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>
	<!-- header-end -->

	<!-- bradcam_area_start  -->
	<div class="angg2">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="angg">
						<h3>건의 게시판</h3>
						<p>
							<a href="./home">Home /</a> Suggestion
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bradcam_area_end  -->


	<!--================Blog Area =================-->
	<section class="blog_area padding">
		<div class="container">
			<div class="sBoradList">
				<article class="sBoardListLine">
					<div class="sBoardList2">번호</div>
					<div class="sBoardList3">제목</div>
					<div class="sBoardList4">작성자</div>
					<div class="sBoardList5">작성일</div>
					<div class="sBoardList4">조회수</div>
				</article>
				<c:forEach var="nitem" items="${nList}">
						<article class="sBoardListLine">
							<div class="sBoardList2">${nitem.n_num}</div>
							<div class="sBoardList3">
								<a href="qnacontents?qbnum=${nitem.n_num}"><B>[공지사항]${nitem.n_name}</B></a>
							</div>
							<div class="sBoardList4">${nitem.m_id}</div>
							<div class="sBoardList5">${nitem.n_date}</div>
						</article>
					</c:forEach>
				<c:forEach var="sBoard" items="${sbList}">
					<article class="sBoardListLine">
						<div class="sBoardList2">${sBoard.sb_num}</div>
						<div class="sBoardList3">
							<a href="contents?sbnum=${sBoard.sb_num}">${sBoard.sb_name}</a>
						</div>
						<div class="sBoardList4">${sBoard.m_id}</div>
						<div class="sBoardList5">${sBoard.sb_date}</div>
						<div class="sBoardList4">${sBoard.sb_view}</div>
					</article>
				</c:forEach>
			</div>
			<div class="btn-area">
				<div class="paging">${qnaPaging}</div>
				<button class="wr-btn" onclick="location.href='./sBoardWrite?h_id=${h_id}'">글쓰기</button>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

	<!-- footer start -->
	<footer>
		<jsp:include page="Footer.jsp"></jsp:include>
	</footer>
	<!-- footer end  -->
	<!-- link that opens popup -->

	<!-- form itself end-->
	<!-- form itself end -->
	<!-- JS here -->
	<script src="resources/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="resources/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/isotope.pkgd.min.js"></script>
	<script src="resources/js/ajax-form.js"></script>
	<script src="resources/js/waypoints.min.js"></script>
	<script src="resources/js/jquery.counterup.min.js"></script>
	<script src="resources/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/js/scrollIt.js"></script>
	<script src="resources/js/jquery.scrollUp.min.js"></script>
	<script src="resources/js/wow.min.js"></script>
	<script src="resources/js/nice-select.min.js"></script>
	<script src="resources/js/jquery.slicknav.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/plugins.js"></script>
	<script src="resources/js/gijgo.min.js"></script>

	<!--contact js-->
	<script src="resources/js/contact.js"></script>
	<script src="resources/js/jquery.ajaxchimp.min.js"></script>
	<script src="resources/js/jquery.form.js"></script>
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/mail-script.js"></script>

	<script src="resources/js/main.js"></script>
</body>
</html>