<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <header>
      <jsp:include page="header.jsp"></jsp:include>
   </header>
   <section>
      <br><br>
      <div class="container">
         <div class="row">
            <div class="col-md-4">
               <form method="post" action="bannerInput" id="#" enctype="multipart/form-data">
                  <div class="form-group files">
                     <label>파일을 올려주세요 </label> <input type="file"
                        class="form-control" multiple="" name="file1">
                        <br>
                  </div>
                  <input type="submit" value="전송">
               </form>
            </div>
            <div class="col-md-4">
               <form method="post" action="#" id="#">
                  <div class="form-group files">
                     <label>파일을 올려주세요 </label> <input type="file"
                        class="form-control" multiple="" name="file2">
                        <br>
                  </div>
                  <input type="submit" value="전송">
               </form>
            </div>
            <div class="col-md-4">
               <form method="post" action="#" id="#">
                  <div class="form-group files">
                     <label>파일을 올려주세요 </label> <input type="file"
                        class="form-control" multiple="" name="file3">
                        <br>
                  </div>
                  <input type="submit" value="전송">
               </form>
            </div>
         </div>
      </div>
      <footer>
      <br><br>
         <jsp:include page="Footer.jsp"></jsp:include>
      </footer>
   </section>
</body>
<style type="text/css">
.files input {
   outline: 2px dashed #92b0b3;
   outline-offset: -10px;
   -webkit-transition: outline-offset .15s ease-in-out, background-color
      .15s linear;
   transition: outline-offset .15s ease-in-out, background-color .15s
      linear;
   padding: 120px 0px 85px 35%;
   text-align: center !important;
   margin: 0;
   width: 100% !important;
}

.files input:focus {
   outline: 2px dashed #92b0b3;
   outline-offset: -10px;
   -webkit-transition: outline-offset .15s ease-in-out, background-color
      .15s linear;
   transition: outline-offset .15s ease-in-out, background-color .15s
      linear;
   border: 1px solid #92b0b3;
}

.files {
   position: relative
}

.files:after {
   pointer-events: none;
   position: absolute;
   top: 60px;
   left: 0;
   width: 50px;
   right: 0;
   height: 56px;
   content: "";
   background-image:
      url(https://image.flaticon.com/icons/png/128/109/109612.png);
   display: block;
   margin: 0 auto;
   background-size: 100%;
   background-repeat: no-repeat;
}

.color input {
   background-color: #f1f1f1;
}

.files:before {
   position: absolute;
   bottom: 10px;
   left: 0;
   pointer-events: none;
   width: 100%;
   right: 0;
   height: 57px;
   content: " 여기에 끌어다 놔주세요. ";
   display: block;
   margin: 0 auto;
   color: #2ea591;
   font-weight: 600;
   text-transform: capitalize;
   text-align: center;
}
/* Make the image fully responsive */
.carousel-inner img {
   width : 100%;
   height : "700px";
}
</style>
</html>