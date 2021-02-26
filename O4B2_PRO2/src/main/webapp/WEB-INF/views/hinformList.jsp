
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="zxx">
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
<script>
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
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>

	<!-- bradcam_area_start  -->
	<div class="angg2">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="angg">
						<h3>병원 찾기</h3>
						<p>
							<a href="./home">Home /</a> Nearby
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bradcam_area_end  -->

	<!-- ================ contact section start ================= -->
	<section class="contact-section">
		<aside class=left-search-display>
			<div class="form-group marginset">
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder='병원명 검색'
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Search Keyword'">
					<div class="input-group-append">
						<button class="btn" type="button">
							<i class="ti-search"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="left-hos-display marginset">
				<div class="hosMenu">
					<a class="d-inline-block" href="single-blog.html">
						<h2>Google inks pact for new 35-storey office</h2>
					</a>
					<p>That dominion stars lights dominion divide years for fourth
						have don't stars is that he earth it first without heaven in place
						seed it second morning saying.</p>
					<ul class="blog-info-link">
						<li><a href="#"><i class="fa fa-user"></i> Travel,
								Lifestyle</a></li>
						<li><a href="#"><i class="fa fa-comments"></i> 03
								Comments</a></li>
					</ul>
				</div>
				<div class="hosMenu">
					<a class="d-inline-block" href="single-blog.html">
						<h2>Google inks pact for new 35-storey office</h2>
					</a>
					<p>That dominion stars lights dominion divide years for fourth
						have don't stars is that he earth it first without heaven in place
						seed it second morning saying.</p>
					<ul class="blog-info-link">
						<li><a href="#"><i class="fa fa-user"></i> Travel,
								Lifestyle</a></li>
						<li><a href="#"><i class="fa fa-comments"></i> 03
								Comments</a></li>
					</ul>
				</div>
				<div class="hosMenu">
					<a class="d-inline-block" href="single-blog.html">
						<h2>Google inks pact for new 35-storey office</h2>
					</a>
					<p>That dominion stars lights dominion divide years for fourth
						have don't stars is that he earth it first without heaven in place
						seed it second morning saying.</p>
					<ul class="blog-info-link">
						<li><a href="#"><i class="fa fa-user"></i> Travel,
								Lifestyle</a></li>
						<li><a href="#"><i class="fa fa-comments"></i> 03
								Comments</a></li>
					</ul>
				</div>
				<div class="hosMenu">
					<a class="d-inline-block" href="single-blog.html">
						<h2>Google inks pact for new 35-storey office</h2>
					</a>
					<p>That dominion stars lights dominion divide years for fourth
						have don't stars is that he earth it first without heaven in place
						seed it second morning saying.</p>
					<ul class="blog-info-link">
						<li><a href="#"><i class="fa fa-user"></i> Travel,
								Lifestyle</a></li>
						<li><a href="#"><i class="fa fa-comments"></i> 03
								Comments</a></li>
					</ul>
				</div>
			</div>
		</aside>
		<aside class=right-search-display>
			<div class="container">
				<div class="d-none d-sm-block mb-5 pb-4">
					<div id="map"
						style="height: 700px; position: relative; overflow: hidden;">
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33bbef25a739c678dc20ae15b71f3bcf&libraries=services"></script>
					</div>
					<script>
						var infowindow = new kakao.maps.InfoWindow({
							zIndex : 1
						});

						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.566826,
									126.9786567), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);

						// GeoLocation을 이용해서 접속 위치를 얻어옵니다
						navigator.geolocation
								.getCurrentPosition(function(position) {

									var lat = position.coords.latitude, // 위도
									lon = position.coords.longitude; // 경도

									// 이동할 위도 경도 위치를 생성합니다 
									var moveLatLon = new kakao.maps.LatLng(lat,
											lon);

									// 지도 중심을 이동 시킵니다
									map.setCenter(moveLatLon);

									// 장소 검색 객체를 생성합니다
									var ps = new kakao.maps.services.Places(map);

									// 카테고리로 병원을 검색합니다
									ps.categorySearch('HP8', placesSearchCB, {
										useMapBounds : true
									});

									// 키워드 검색 완료 시 호출되는 콜백함수 입니다
									function placesSearchCB(data, status,
											pagination) {
										if (status === kakao.maps.services.Status.OK) {
											for (var i = 0; i < data.length; i++) {
												displayMarker(data[i]);
											}
										}
									}

									// 지도에 마커를 표시하는 함수입니다
									function displayMarker(place) {
										// 마커를 생성하고 지도에 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : new kakao.maps.LatLng(
													place.y, place.x)
										});

										// 마커에 클릭이벤트를 등록합니다
										kakao.maps.event
												.addListener(
														marker,
														'click',
														function() {
															// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
															infowindow
																	.setContent('<div style="padding:5px;font-size:12px;">'
																			+ place.place_name
																			+ '</div>');
															infowindow
																	.open(map,
																			marker);
														});
									}
								});

						kakao.maps.event
								.addListener(
										map,
										'dragend',
										function() {

											// 지도 중심좌표를 얻어옵니다 
											var latlng = map.getCenter();

											// 장소 검색 객체를 생성합니다
											var ps = new kakao.maps.services.Places(
													map);

											// 카테고리로 은행을 검색합니다
											ps.categorySearch('HP8',
													placesSearchCB, {
														useMapBounds : true
													});

											// 키워드 검색 완료 시 호출되는 콜백함수 입니다
											function placesSearchCB(data,
													status, pagination) {
												if (status === kakao.maps.services.Status.OK) {
													for (var i = 0; i < data.length; i++) {
														displayMarker(data[i]);
													}
												}
											}

											// 지도에 마커를 표시하는 함수입니다
											function displayMarker(place) {
												// 마커를 생성하고 지도에 표시합니다
												var marker = new kakao.maps.Marker(
														{
															map : map,
															position : new kakao.maps.LatLng(
																	place.y,
																	place.x)
														});

												// 마커에 클릭이벤트를 등록합니다
												kakao.maps.event
														.addListener(
																marker,
																'click',
																function() {
																	// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
																	infowindow
																			.setContent('<div style="padding:5px;font-size:12px;">'
																					+ place.place_name
																					+ '</div>');
																	infowindow
																			.open(
																					map,
																					marker);
																});
											}

										});
					</script>
				</div>
			</div>
		</aside>
	</section>
	<!-- ================ contact section end ================= -->

	<!-- footer start -->
	<footer>
		<jsp:include page="Footer.jsp"></jsp:include>
	</footer>
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
	<script>
		$('#datepicker').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}
		});
		$('#datepicker2').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}

		});
	</script>
</body>

</html>