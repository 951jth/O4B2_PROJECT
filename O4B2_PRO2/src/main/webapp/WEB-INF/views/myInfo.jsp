<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
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

.ang3 {
    font-size: 16px;
    font-weight: 300;
    line-height: 28px;
    color: #4D4D4D;
    margin-bottom: 13px;
    font-family: "Poppins", sans-serif;
}
</style>
<script>
$(function(){
	   var chk ="${msg}";
	   var identy ="${mb.m_id}";
	   $('#checkpwd').hide();
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
<jsp:include page="header.jsp" />
<!-- bradcam_area_start  -->
<div class="angg2">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="angg">
					<h3>MYINFO</h3>
					<p> 
						<a href="./home">Home /</a> MYINFO
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- bradcam_area_end  -->
</head>
<body>

 <br><br>
<div class="container" align="center">
    <div class="row">
        <div class="col-sm-12">
            <div class="col-sm-2"></div>
                <div class="col-sm-9">
                    <h2 class="text-center">내 정보 보기</h2>
                    <table class="table table-striped">
                    <br>
                      <tr>
                        <td>이름</td>
                        <td>${mb.m_name}</td>
                        <!-- mbean.getName() -->
                      </tr>
                       
                      <tr>
                        <td>Email</td>
                        <td>${mb.m_mail}</td>
                       <!-- mbean.getEmail() -->
                      </tr>
                       
                      <tr>
                        <td>전화</td>
                        <td>0${mb.m_phone}</td>
                        <!-- mbean.getTel() -->
                      </tr>
                       
                      <tr>
                        <td>주소</td>
                        <td>${mb.m_addr}</td> 
                       <!--  mbean.getAddr()  --> 
                      </tr>
                            
                      <tr>
                        <td>아이디</td>
                        <td>${mb.m_id}</td>
                        <!-- mbean.getId() -->
                      </tr>
                           
                    <tr>
                         <td class="text-center" colspan="2">
                         <br>
						<a href="./myInfoUpdate"><button onclick="" class="btn btn-primary">회원수정</button></a>
       					<button onclick="Delete()" class="btn btn-primary" id="dForm">회원탈퇴</button>
       					<form action="myInfoDelete" id="checkpwd">
       						<input type="hidden" name="m_id" value="${mb.m_id}">
       						<input type="password" class="checkpwd" name="m_pwd">
       						<input type="submit" class="btn btn-primary" value="전송"	>
       					</form>
                         </td>    
                    </tr> 
                       
                    </table>
                </div>
        </div> <!-- col-sm-12 -->
    </div><!-- row -->
</div> <!-- container end-->
     <jsp:include page="Footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	function Delete(){
		$('#checkpwd').show();
		$('#dForm').hide();
	};
</script>
</html>