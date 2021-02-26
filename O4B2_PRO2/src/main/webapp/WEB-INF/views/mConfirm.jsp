<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<header>
	<jsp:include page="header.jsp"></jsp:include>
</header>
<style>
  table, th, td {
    border: 1px solid #bcbcbc;
  }
  table {
    width: 100%;
  }
</style>
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
<script>

		</script>
<div class="content">
	<div class="container">
		<div class="row">

			<div
				class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb30 text-center">
				<h2>진료확인</h2>
			</div>
		</div>
		<div class="row">

			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb30">
				<div class="tour-booking-form">
					<form>
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
								<h2 class="tour-form-title">진료목록</h2>
								<br>
								<h4 class="sub-title">신고 건에 대한 처리 결과는 신고회신내역에서 확인하실 수 있습니다.</h4>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="control-label required" for="select">진료과</label>
									<div class="select">
										<select id="select" name="select" class="form-control">
											<option value="">외과</option>
											<option value="">내과</option>
											<option value="">피부과</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="control-label" for="datepicker">방문날짜</label>
									<div class="input-group">
										<input id="datepicker" name="datepicker" type="text"
											placeholder="날짜선택" class="form-control" required> <span
											class="input-group-addon"><i class="fa fa-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="control-label required" for="select">환자명</label>
									<div class="select">
										<select id="select" name="select" class="form-control">
											<option value="">a</option>
											<option value="">b</option>
											<option value="">c</option>
											<option value="">d</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
								<div class="form-group">
									<label class="control-label required" for="select">의사명</label>
									<div class="select">
										<select id="select" name="select" class="form-control">
											<option value="">찾으시는 의사선생님을 선택해 주세요</option>
											<option value="">조세훈</option>
											<option value="">장대환</option>
											<option value="">연정훈</option>
											<option value="">문지현</option>
											<option value="">박관영</option>
											<option value="">엄태환</option>

										</select>
									</div>
								</div>
							</div>
	
      <table>
        <tr>
          <td rowspan="2">번호</td>
          <td rowspan="2">병 의원 약국명칭</td>
          <td rowspan="2">진료 게시일</td>
          <td>진료형태</td>
          <td>처방회수</td>
          <td>본인부담금</td>
          <td colspan="2" rowspan="2">확인</td>
        </tr>
    
        <tr>
          <td>방문(입원)일수</td>
          <td>투약일수</td>
          <td>공간부담금</td>
        </tr>
        <tr>
         <td rowspan="2">1</td>
          <td rowspan="2">다나아 종합병원</td>
          <td rowspan="2">2020.12.12</td>
          <td>외래진료</td>
          <td>0</td>
          <td>5,000</td>
          <td rowspan="2">예약승인</td>
          <td rowspan="2"><button type="button" class="btn btn-primary"><a href="./urecancel" target="_blank"
          onclick="window.open(this.href, 'popup', 'width=480, height=250,location=no,status=no,scrollbars=no'); return false;">예약취소</a></button></td>
        </tr>
         <tr>
          <td>1</td>
          <td>1</td>
          <td>1</td>
          
       
        </tr>
         <tr>
          <td rowspan="2">2</td>
          <td rowspan="2">관영병원</td>
          <td rowspan="2">2020.01.06</td>
          <td>외래진료</td>
          <td>0</td>
          <td>33000</td>
          <td rowspan="2">진료완료</td>
          <td rowspan="2"><button type="button" class="btn btn-primary">처방등록</button></td>
        </tr>
         <tr>
          <td>1</td>
          <td>1</td>
          <td>1</td>
        
          
     
    
    </table>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<div
				class="col-lg-12 col-md-12 col-sm-12 col-xs-12  text-center mt20">
				Created for <a href="" target="_blank">O4B2</a>
			</div>
		</div>
	</div>
</div>
<footer>
	<jsp:include page="Footer.jsp"></jsp:include>
</footer>