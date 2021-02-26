<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="fullscreen_bg" class="fullscreen_bg" />
	<form class="form-signin">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default">
						<div class="panel panel-primary">

							<h3 class="text-center">내 정보 수정하기</h3>

							<div class="panel-body">

								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-user"></span> </span> <input type="text"
											class="form-control" placeholder="핸드폰번호" />
									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-user"></span></span> <input type="text"
											class="form-control" placeholder="생년월일" />
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-envelope"></span></span> <input
											type="text" class="form-control" placeholder="아이디" />

									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-lock"></span></span> 성별
											<input type="radio" id="male" name="gender" value="남자">남자<br>
											
											<input type="radio" id="female" name="gender" value="여자">여자
											
										
									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-home"></span></span> <input type="text"
											class="form-control" placeholder="주소" />
									</div>
								</div>

								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-calendar"></span></span> <input
											type="text" class="form-control" placeholder="이메일" />
									</div>
								</div>
								<button class="btn btn-lg btn-primary btn-block" type="submit">
									Save</button>


							</div>
						</div>
					</div>
				</div>
			</div>
	</form>


	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>