<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	var msg = "${msg}";
	
	if(msg != ""){
	      alert(msg);  
	      window.close();
	      location.reload(true);
	 }
});

function cancel(me_num){
	console.log("메디컬번호:" + me_num);
	//var url="./urecheck?check=1";
	var url="resecancelProc?me_num="+me_num
	if (window.opener && !window.opener.closed){
		window.opener.location = url;
		window.close();
		}
};
</script>
<body>
	<div class="container">
		<div class="card-body">
			<form class="form-signin" action="HosSearchPwd" method="get"
				onSubmit="logincall();return false">
				<h5 class="form-signin-heading">정말로 취소하시겠습니까?</h5>
	
							<button type="button" class="btn btn-primary" onclick="cancel(${me_num})">
                                <!-- <a href="./resecancelProc?me_num=${me_num}"> -->
                           		     예
                            </button> 
                            <button type="button" class="btn btn-primary" onclick="window.close();">아니오                               
                            </button> 
			</form>
		</div>
	</div>
</body>

</html>