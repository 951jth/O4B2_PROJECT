<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
</head>
<style type="text/css">
.carousel-inner img {
   width: 100%;
   height: 20%;
   margin: 0 auto; 
   }
}
.back1 {
    background-image: url(resources/img/Main1.jpg);
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    width: 361px;
    height: 239px;
    img-responsive;

}
.back2 {
   background-image: url(resources/img/Main2.jpg);
   background-repeat: no-repeat;
   background-position: center;
   background-size: cover;
   width: 361px;
   height: 239px;
   img-responsive;
}

.back3 {
   background-image: url(resources/img/Main3.jpg);
   background-repeat: no-repeat;
   background-position: center;
   background-size: cover;
   width: 361px;
   height: 239px;
   img-responsive;
}

.back4 {
   background-image: url(resources/img/Main4.jpg);
   background-repeat: no-repeat;
   background-position: center;
   background-size: cover;
   width: 361px;
   height: 239px;
   img-responsive;
}

.back5 {
   background-image: url(resources/img/Main5.jpg);
   background-repeat: no-repeat;
   background-position: center;
   background-size: cover;
   width: 361px;
   height: 239px;
   img-responsive;
}

.back6 {
   background-image: url(resources/img/Main6.jpg);
   background-repeat: no-repeat;
   background-position: center;
   background-size: cover;
   width: 361px;
   height: 239px;
   img-responsive;
}

.sing22 {
   background: #FFFFF;
   margin-bottom: 30px;
   color: white;
}

.tess {
   padding: 20px;
   color: white;
}
</style>
<body>
   <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->
   <header>
      <jsp:include page="header.jsp"></jsp:include>
   </header>
   <!-- slider_area_start -->
   <div class="container-fluid">
      <div id="slider" class="carousel slide" data-ride="carousel">

         <!-- Indicators -->
         <ul class="carousel-indicators">
            <li data-target="#slider" data-slide-to="0" class="active"></li>
            <li data-target="#slider" data-slide-to="1"></li>
            <li data-target="#slider" data-slide-to="2"></li>
         </ul>

         <!-- The slideshow -->
         <div class="carousel-inner">
            <div class="carousel-item active">
               <img src="resources/img/banner/tbanner1.jpg" alt="배너1">
            </div>
            <div class="carousel-item">
               <img src="resources/img/banner/tbanner2.jpg" alt="배너2">
            </div>
            <div class="carousel-item">
               <img src="resources/img/banner/tbanner3.jpg" alt="배너3">
            </div>
         </div>

         <!-- Left and right controls -->
         <a class="carousel-control-prev" href="#slider" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
         </a> <a class="carousel-control-next" href="#slider" data-slide="next">
            <span class="carousel-control-next-icon"></span>
         </a>

      </div>
   </div>
   <!-- slider_area_end -->

   <!-- service_area_start -->

   <!-- service_area_end -->

   <!-- ubd-->
   <div class="container p-4" id="welcomeHome">
      <img class="img-fluid" src="resources/img/introduce.jpg" alt="welcome"
         width="100%" height="100%" />

   </div>
   <!-- welcome_docmed_area_end -->

   <!-- offers_area_start -->
   <div class="our_department_area">
      <div class="container">
         <div class="single_department">
            <div class="row">
               <div class="col-xl-4 col-md-6 col-lg-4" id="nUser1">
                  <div class="single_department">
                     <div class="department_thumb">
                        <img src="img/department/1.png" alt="">
                     </div>
                     <div class="department_content back5">
                        <h1 class="tess">
                           <a href="searchHp">진료예약하기</a>
                        </h1>
                        <p style=" padding: 20px; color: white;">진료를 예약하려면 <br>병원을 검색하고 예약하기 탭을 누르세요.</p>

                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-md-6 col-lg-4">
                  <div class="single_department">
                     <div class="department_thumb">
                        <img src="img/department/2.png" alt="">
                     </div>
                     <div class="department_content back2">
                        <h1 class="tess">
                           <a href="searchHp">병원검색</a>
                        </h1>
                        <p style=" padding: 20px; color: white;">병원을 검색하고 <br>위치를 확인하세요.</p>

                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-md-6 col-lg-4">
                  <div class="single_department">
                     <div class="department_thumb">
                        <img src="img/department/3.png" alt="">
                     </div>
                     <div class="department_content back3">
                        <h1 class="tess">
                           <a href="./qnaBoardList">QnA 게시판</a>
                        </h1>
                        <p style=" padding: 20px; color: white;">궁금하신 것들에 대해서 <br>답해드립니다.</p>

                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-md-6 col-lg-4">
                  <div class="single_department">
                     <div class="department_thumb">
                        <img src="img/department/4.png" alt="">
                     </div>
                     <div class="department_content back4">
                        <h1 class="tess">
                           <a href="./reviewList">리뷰보기</a>
                        </h1>
                        <p style=" padding: 20px; color: white;">모든 병원의 리뷰를 봅니다.</p>

                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-md-6 col-lg-4" id="nUser2">
                  <div class="single_department">
                     <div class="department_thumb">
                        <img src="img/department/5.png" alt="">
                     </div>
                     <div class="department_content back5">
                        <h1 class="tess">
                           <a href="urecheck?check=1">진료내역 및 예약확인</a>
                        </h1>
                        <p style=" padding: 20px; color: white;">진료를 예약하거나 <br>예약을 확인하세요.</p>

                     </div>
                  </div>
               </div>
               <div class="col-xl-4 col-md-6 col-lg-4" id="nUser3">
                  <div class="single_department">
                     <div class="department_thumb">
                        <img src="img/department/6.png" alt="">
                     </div>
                     <div class="department_content back6">
                        <h1 class="tess">
                           <a href="./myInfo">내 정보보기</a>
                        </h1>
                        <p style=" padding: 20px; color: white;">내 정보를 확인하세요.</p>

                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- footer start -->
   <jsp:include page="Footer.jsp"></jsp:include>
   <!-- footer end  -->
   <!-- JS here -->
   <script src="js/vendor/modernizr-3.5.0.min.js"></script>
   <script src="js/vendor/jquery-1.12.4.min.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/owl.carousel.min.js"></script>
   <script src="js/isotope.pkgd.min.js"></script>
   <script src="js/ajax-form.js"></script>
   <script src="js/waypoints.min.js"></script>
   <script src="js/jquery.counterup.min.js"></script>
   <script src="js/imagesloaded.pkgd.min.js"></script>
   <script src="js/scrollIt.js"></script>
   <script src="js/jquery.scrollUp.min.js"></script>
   <script src="js/wow.min.js"></script>
   <script src="js/nice-select.min.js"></script>
   <script src="js/jquery.slicknav.min.js"></script>
   <script src="js/jquery.magnific-popup.min.js"></script>
   <script src="js/plugins.js"></script>
   <script src="js/gijgo.min.js"></script>
   <!--contact js-->
   <script src="js/contact.js"></script>
   <script src="js/jquery.ajaxchimp.min.js"></script>
   <script src="js/jquery.form.js"></script>
   <script src="js/jquery.validate.min.js"></script>
   <script src="js/mail-script.js"></script>

   <script src="js/main.js"></script>
   <script src="resources/js/vendor/modernizr-3.5.0.min.js">
   </script>
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