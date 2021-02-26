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
</head>
<script type="text/javascript">
$(function() {
	var chk ="${msg}";
	if(chk != ""){
	      alert(chk);
	      location.reload(true);
	   }
	$(".home").show();
    $(".common").show();
    $(".admin").hide();
    $(".hosH").hide();
    $(".nUser").hide();
    if(identy == "admin"){
         $(".admin").show();
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

    <!-- bradcam_area_start  -->
    <div class="bradcam_area breadcam_bg bradcam_overlay">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text">
                        <h3>병원 검색</h3>
                        <p><a href="./home">Home /</a> Search</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- bradcam_area_end  -->


    <!--================Blog Area =================-->
      <section class="blog_area section-padding-search">
        <div class="container">
            <div class="row">
                <div class="col-lg">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget">
                            <h4 class="widget_title">병원명 검색</h4>

                            <form action="searchH" method=GET>
                                <div class="form-group">
                                    <input type="text" name="hos" class="form-control" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = '병원명 검색'" placeholder='병원명 검색' required>
                                        <input type="text" hidden="hidden" value="1" name="check">
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">검색</button>
                            </form>
                        </aside>
                        
                        <aside class="single_sidebar_widget">
                            <h4 class="widget_title">진료과 검색</h4>

                            <form action="searchH" method=GET>
                                <div class="form-group">
                                    <input type="text" name="hos" class="form-control" onfocus="this.placeholder = ''"
                                        onblur="this.placeholder = '진료과 검색'" placeholder='진료과 검색' required>
                                        <input type="text" hidden="hidden" value="2" name="check">
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">검색</button>
                            </form>
                        </aside>
                    </div>
                </div>
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

    <script src="js/main.js"></script>
    <script>
        
    </script>
</body>
</html>