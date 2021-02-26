<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<script>   
$(function(){
	   var chk ="${msg}";
	   
	   if(chk != ""){
	      alert(chk);
	      location.reload(true);
	   }
		   $(".hosH").show();
		   $(".common").hide();
		   $(".admin").hide();
		   $(".home").hide();
		   $(".nUser").hide();
	});
</script>
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<!doctype html>
<meta charset="utf-8">
<head>
</head>
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
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>
<section>
	<div class="angg2">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="angg">
						<h3>의사등록</h3>
						<p>
							<a href="./home">Home /</a> 의사등록
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container p-3" id="box">
		<form id="formBox" method="post" action="inputDoctorProc" enctype="multipart/form-data">
			<div class="row">
			<div class="input-group mb-3 col-6">
				<div class="input-group-prepend">
					<span class="input-group-text">의사명</span>
				</div>
				<input type="text" class="form-control" placeholder=""
					id="usr" name="d_name">
			</div>
			<div class="custom-file mb-3 col-6">
				<input type="file" id="d_image" name="d_image">
				<input type="hidden" id="filecheck" value="0" name="filecheck">
			</div>
			<div class="col-md-12">
					<div class="form-group">
					<label class="control-label col-sm-3">진료과목<span
						class="text-danger">*</span></label> 
						<input type="checkbox" id=""
						name="h_im" value="내과"> 
						<label for="vehicle1">내과</label>
					<input type="checkbox" id="vehicle2" name="h_ent" value="이비인후과">
						<label for="vehicle2">이비인후과</label> <input type="checkbox"
						id="" name="h_os" value="정형외과"> 
						<label for="vehicle3">정형외과</label>
					<input type="checkbox" id="" name="h_ps" value="성형외과"> 
						<label
						for="vehicle3">성형외과</label> 
						<input type="checkbox" id=""
						name="h_dm" value="피부과"> 
						<label for="vehicle3">피부과</label>
					</div>
				</div>
			</div>
			<div class="row">
				
				<div class="col-md-12">
					<textarea class="form-control" rows="12" id="comment" 
						name="d_com"></textarea>
				</div>
			</div>
			<div class="row">
			<div class="col-sm-9">
			</div>
			<div class="col-sm-3">
			<div class="mt-3 float-left">
					<!--  <button onclick="addDoctor()" class="btn btn-primary">의사항목추가</button>-->
					<button type="submit" class="btn btn-primary">등록</button>
			</div>
			</div>
			</div>
		</form>
	</div>
</section>
<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>
</body>

<script type="text/javascript">
$("#d_image").on('change', function() {
	var files = $("#d_image")[0].files;
	var fileName = "";
	console.log(files);

	for (var i = 0; i < files.length; i++){
		fileName += files[i].name + " ";
	}


	if (fileName == "") {
		console.log("empty");
		$("#filecheck").val(0);
	} else {
		console.log("not empty");
		$("#filecheck").val(1);
	}
});
</script>

</html>