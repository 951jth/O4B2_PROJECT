<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<style type="text/css">
:root {
   
}

* {
   padding: 0;
   margin: 0;
   box-sizing: border-box;
   font-family: 'Alata', sans-serif;
}

.page-container {
   width: 100%;
   height: 100%;
   background: #fffff;
   display: flex;
   justify-content: center;
   align-items: center;
}

.shadow {
   -webkit-box-shadow: 27px 43px 43px -26px rgba(89, 89, 89, 0.39);
   -moz-box-shadow: 27px 43px 43px -26px rgba(89, 89, 89, 0.39);
   box-shadow: 27px 43px 43px -26px rgba(89, 89, 89, 0.39);
}

.login-form-container {
   background: #ffffff;
   width: 860px;
   height: 540px;
   display: flex;
   flex-direction: row;
   box-shadow: 10px black;
   border-radius: 10px;
}

.login-form-right-title {
   width: 50%;
   border-radius: 10px 0px 0px 10px;
   padding: 75px;
   display: flex;
   flex-direction: column;
   justify-content: center;
   color: white;
   background-image:
}

.login-form-left-title {
   width: 50%;
   border-radius: 10px 0px 0px 10px;
   padding: 75px;
   display: flex;
   flex-direction: column;
   justify-content: center;
   color: white;
   background-image:
}

.login-form-right-side {
   width: 50%;
   border-radius: 10px 0px 0px 10px;
   padding: 75px;
   display: flex;
   flex-direction: column;
   justify-content: center;
   align-items: center;
   color: white;
   background-image: radial-gradient(ellipse farthest-corner at 0 140%, #5d9dff 0%, #2178ff
      70%, #3585ff 70%);
}

.login-form-right-side h1 {
   color: white;
   width: 100%;
   text-align: right;
   opacity: 0.9;
}

.login-form-right-side p {
   color: white;
   padding-top: 50px;
   font-size: 12px;
   text-align: right;
   opacity: 0.8;
}

.login-form-left-side {
   width: 50%;
   border-radius: 0px 10px 10px 0px;
   display: flex;
   flex-direction: column;
   align-items: center;
   padding: 40px;
   background: rgb(255, 255, 255);
   background: linear-gradient(287deg, rgba(255, 255, 255, 1) 0%,
      rgba(243, 244, 244, 1) 0%, rgba(255, 255, 255, 1) 100%);
}

.login-form-left-side .login-top-wrap {
   display: flex;
   justify-content: flex-end;
   align-items: center;
   width: 100%;
}

.login-form-left-side .login-top-wrap span {
   color: gray;
   font-size: 11px;
   padding-right: 20px;
}

.login-form-left-side .login-top-wrap .create-account-btn {
   background: white;
   border: 0;
   width: 85px;
   height: 35px;
   font-size: 11px;
   color: #2178ff;
   border-radius: 3px;
}

.login-input-container {
   padding-top: 120px;
   width: 300px;
}

.login-input-container .login-input-wrap {
   width: 300px;
   height: 45px;
   margin-top: 20px;
   border-radius: 2px;
   border-bottom: solid 2px #2178ff;
}

.login-input-container .login-input-wrap i {
   color: #2178ff;
   line-height: 45px;
}

.login-input-container .login-input-wrap input {
    background: none;
    border: none;
    line-height: 30px;
    padding-left: 10px;
    width: 295px;
}

.login-input-container .login-input-wrap input:focus {
   outline: none;
}

.login-btn-wrap {
   margin-top: 40px;
   display: flex;
   flex-direction: column;
   align-items: center;;
}

.login-btn-wrap .login-btn {
   width: 95px;
   height: 35px;
   color: white;
   border: 0;
   border-radius: 4px;
   background: rgb(105, 163, 255);
   background: linear-gradient(162deg, rgba(105, 163, 255, 1) 0%,
      rgba(43, 125, 254, 1) 50%, rgba(43, 125, 254, 1) 100%);
}

.login-btn-wrap a {
   margin-top: 10px;
   text-decoration: none;
   font-size: 11px;
   color: gray;
}

.ang {
   position: relative;
   width: 15%;
   height: 15%;
   transform: rotate(270deg);
   color: white;
   top: 150px;
   left: 28px;
}

.ang2 {
   position: relative;
   width: 15%;
   height: 15%;
   transform: rotate(270deg);
   color: white; top : 280px;
   left: 28px;
   top: 280px;
}
}

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
<head>
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://kit.fontawesome.com/51db22a717.js"
   crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Alata&display=swap"
   rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

</head>
<body>
   
      <jsp:include page="header.jsp"></jsp:include>
      <section>
     <!-- bradcam_area_start  -->
	<div class="bradcam_area breadcam_bg bradcam_overlay">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text">
						<h3>LOGIN</h3>
						<p>
							<a href="index.html">Home /</a> LOGIN
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bradcam_area_end  -->

      <div class="container login-container  ">
         <br>
         <br>
         <div class="ang bg-primary rounded-top">
            <div onclick="joinUser()">
               <h3 class="hcolor ">일반로그인</h3>
            </div>
         </div>
         <div class="ang2 bg-primary rounded-top">
            <div onclick="joinNUser()">
               <h3 class="hcolor">병원로그인</h3>
            </div>
         </div>
      </div>
      <div class="page-container">
         <div id="normal" class="">
            <form action="./loginProc" method="post">
               <div class="login-form-container shadow">
                  <div class="login-form-right-side">
                     <div class="user"></div>
                     <h1>일반 회원 로그인</h1>
                     <p>
                        다치료해의 병원 진료 예약 서비스 이용자를 위한 <br>일반 회원 로그인 입니다.
                     </p>
                  </div>
                  <div class="login-form-left-side">
                     <div class="login-top-wrap">
                        <span>아직 계정이 없으신가요?</span>
                        <button class="btn btn-primary">
                           <a href="./joinFrm">회원가입</a>
                        </button>
                     </div>

                     <div class="login-input-container">
                        <div class="login-input-wrap input-id">
                           <input type="text" name="m_id" class="form-control"
                              placeholder="아이디 *" />
                        </div>
                        <div class="login-input-wrap input-password">
                           <input type="password" name="m_pwd" class="form-control"
                              placeholder="비밀번호*" />
                        </div>
                     </div>
                     <br>
                     <div class="form-group">
                        <input type="submit"
                           class="btn btn-outline-primary btn-lg boxed-btn"
                           value="로그인" />
                     </div>


                     <div class="row">

                        <button type="button" class="btn btn-outline-primary">
                           <a href="./searchId" target="_blank"
                              onclick="window.open(this.href, 'popup', 'width=400, height=400,location=no,status=no,scrollbars=no'); return false;">
                              아이디찾기</a>
                        </button>
                        &nbsp&nbsp&nbsp&nbsp
                        <!--  
                        <button type="button" class="btn btn-outline-primary">
                           <a href="./searchPwd" target="_blank"
                              onclick="window.open(this.href, 'popup', 'width=400, height=500,location=no,status=no,scrollbars=no'); return false;">
                              비밀번호찾기</a>
                        </button>
						-->
                     </div>
                  </div>
               </div>
            </form>
         </div>
         <div id="hos" class="">
            <form action="./hLoginProc" method="post">
               <div class="login-form-container shadow">
                  <div class="login-form-right-side">
                     <div class="nUser"></div>
                     <h1>병원 로그인</h1>
                     <p>
                        다치료해의 병원 진료 예약 서비스를 위한 <br>병원 로그인 입니다.
                     </p>
                  </div>
                  <div class="login-form-left-side">
                     <div class="login-top-wrap">
                        <span>아직 계정이 없으신가요?</span>
                        <button class="btn btn-primary color:white">
                           <a href="joinFrm">회원가입</a>
                        </button>
                     </div>

                     <div class="login-input-container">
                        <div class="login-input-wrap input-id">
                           <input type="text" class="form-control" name="h_id"
                              placeholder="아이디 *" value="" />
                        </div>
                        <div class="login-input-wrap input-password">
                           <input type="password" class="form-control" name="h_pwd"
                              placeholder="비밀번호*" value="" />
                        </div>
                     </div>
                     <br>
                     <div class="form-group">
                        <input type="submit"
                           class="btn btn-outline-primary btn-lg boxed-btn"
                           value="로그인" />
                     </div>

                     <div class="row">

                        <button type="button" class="btn btn-outline-primary">
                           <a href="./hsearchId" target="_blank"
                              onclick="window.open(this.href, 'popup', 'width=400, height=400,location=no,status=no,scrollbars=no'); return false;">
                              아이디찾기</a>
                        </button>
                        &nbsp&nbsp&nbsp&nbsp
                        <!-- 
                        <button type="button" class="btn btn-outline-primary">
                           <a href="./hsearchPwd" target="_blank"
                              onclick="window.open(this.href, 'popup', 'width=400, height=600,location=no,status=no,scrollbars=no'); return false;">
                              비밀번호찾기</a>
                        </button>
						 -->
                     </div>
                  </div>
               </div>
            </form>
         </div>
      </div>


   </section>
   <br>
   <br>
   <jsp:include page="Footer.jsp"></jsp:include>

</body>

<script src="resources/js/jquery.serializeObject.js"></script>
<script type="text/javascript">
$(function() {
   var chk = "${msg}";
   if (chk != "") {
      alert(chk);
      location.reload(true);
   }
   $(".home").hide();
   $(".common").hide();
   $(".admin").hide();
   $(".hosH").hide();
   $("#hos").hide();
});

function joinUser() {
   $("#normal").show();
   $("#hos").hide();
}
function joinNUser() {
   $("#normal").hide();
   $("#hos").show();
}

   /*
    function login(){
    var loginJson + $("#login").serializeObject();
    console.log(jsonFrm);
   
    $.ajax({
    data: loginJson,
    dataType:"json",
    type: "POST",
    url:"loginProc",
    success: function(data){//서버에서 넘어오는 데이타
    console.log(data);
    },
    error: function(error){
    console.log(error);
    }
   
    })
    }
    */
</script>
</html>            