<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!doctype html>
<html class="no-js" lang="zxx">
<script>
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
</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header-end -->

	<!-- bradcam_area_start  -->
	<div class="bradcam_area breadcam_bg bradcam_overlay">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text">
						<h3>SEARCH</h3>
						<p>
							<a href="index.html">Home /</a> SEARCH
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bradcam_area_end  -->


	<!--================Blog Area =================-->
	<section style="margin: 50px 0">
		<div class="container">
			<div class="row">
				<div style="width: 70%; margin: auto;">
					<div>
						<aside class="single_sidebar_widget search_widget">
							<form action="searchH">
								<div class="form-group">
									<div class="input-group mb-3">
										<input type="text" name="hos" class="form-control"
											placeholder='병원명 검색' onfocus="this.placeholder = ''"
											onblur="this.placeholder = '병원명 검색'"> <input
											type="text" hidden="hidden" value="1" name="check">
									</div>
								</div>
								<button
									class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
									type="submit">Search</button>
							</form>
						</aside>
					</div>
				</div>
				<div style="width: 70%; margin: auto;">
					<c:forEach var="no" items="${noData}">
						<div>
							<article class="blog_item">
								<div class="blog_details">
									<h2>검색된 병원이 없습니다.</h2>
								</div>
							</article>
						</div>
					</c:forEach>
					<c:forEach var="hos" items="${hos}">
						<div>
							<article class="blog_item">
								<div class="blog_details">
									<a class="d-inline-block" href="hinfo?hId=${hos.h_id}">
										<h2>${hos.h_name}</h2>
									</a>
									<ul class="blog-info-link">
										<li><a href="hinfo?hId=${hos.h_id}"><i
												class="fa fa-user"></i> 병원소개</a></li>
										<li><a href="rese?hId=${hos.h_id}"><i
                                                class="fa fa-comments"></i> 예약하기</a></li>
                                        <li><a href="sBoardList?hId=${hos.h_id}"><i
                                                class="fa fa-comments"></i> 건의하기</a></li>
									</ul>
								</div>
							</article>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

	<!-- footer start -->
	<jsp:include page="Footer.jsp"></jsp:include>
	<!-- footer end  -->

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

	<script src="js/main.js"></script>
</body>
</html>