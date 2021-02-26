<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			// 예제를 참고하여 다양한 활용법을 확인해 보세요.
		}
	}).open();
</script>
<%@ page session="false"%>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<script>
	var chk = "${msg}";
	
	if(chk != ""){
		alert(chk);
		location.reload(true);
	}
</script>
<style>
.fc1 {
	display: block;
	width: 100%;
	padding: .75rem;
	margin-left: 15px;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.bb1 {
	color: blue;
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
<header>
	<jsp:include page="header.jsp" />
</header>
<div class="angg2">
	<div class="container">
		<div class="row">
			<div class="col-xl-12">
				<div class="angg">
					<h3>회원가입</h3>
					<p>
						<a href="./home">Home /</a> Join
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">

		<div class="btn-group">
			&nbsp&nbsp&nbsp&nbsp
			<button type="button" class="btn btn-primary" onclick="jUser()">유저</button>
			<button type="button" class="btn btn-primary" onclick="jHos()">병원</button>
		</div>
	</div>
	<div class="row" id="user">
		<div class="col-md-8">
			<br>
			<h1 class="entry-title">

				<span>유저가입하기</span>
			</h1>
			<hr>
			<form class="form-horizontal" method="post" name="signup" id="signup"
				enctype="multipart/form-data" action="./joinProc" onsubmit="return check(1)">
				<div class="form-group">
					<label class="control-label col-sm-3">아이디 <span
						class="text-danger">*</span></label>
					<div class="col-md-8 col-sm-9">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i></span> 
								<input type="text"
								class="form-control" name="m_id" id="m_id"
								placeholder="아이디를 입력하세요.">
						</div>
						<input type="button" class="btn-primary" value="중복확인" onclick="idcheck(1)">
					</div>
					<input type="hidden" value="0" id="mcheck">
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3">비밀번호 입력 <span
						class="text-danger">*</span></label>
					<div class="col-md-5 col-sm-8">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input type="password"
								class="form-control" name="m_pwd" id="password"
								placeholder="비밀번호 입력" value="">
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3">이름 <span
						class="text-danger">*</span></label>
					<div class="col-md-8 col-sm-9">
						<input type="text" class="form-control" name="m_name"
							id="mem_name" placeholder="이름 입력" value="">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3">생년월일 <span
						class="text-danger">*</span></label>
					<div class="col-xs-8">
						<div class="form-inline">
							<div class="form-group">
								&nbsp&nbsp&nbsp&nbsp <select name="dd" class="form-control">
									<option value="">Date</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
							</div>
							<div class="form-group">
								<select name="mm" class="form-control">
									<option value="">Month</option>
									<option value="1">Jan</option>
									<option value="2">Feb</option>
									<option value="3">Mar</option>
									<option value="4">Apr</option>
									<option value="5">May</option>
									<option value="6">Jun</option>
									<option value="7">Jul</option>
									<option value="8">Aug</option>
									<option value="9">Sep</option>
									<option value="10">Oct</option>
									<option value="11">Nov</option>
									<option value="12">Dec</option>
								</select>
							</div>
							<div class="form-group">
								<select name="yyyy" class="form-control">
									<option value="0">Year</option>
									<option value="1955">1955</option>
									<option value="1956">1956</option>
									<option value="1957">1957</option>
									<option value="1958">1958</option>
									<option value="1959">1959</option>
									<option value="1960">1960</option>
									<option value="1961">1961</option>
									<option value="1962">1962</option>
									<option value="1963">1963</option>
									<option value="1964">1964</option>
									<option value="1965">1965</option>
									<option value="1966">1966</option>
									<option value="1967">1967</option>
									<option value="1968">1968</option>
									<option value="1969">1969</option>
									<option value="1970">1970</option>
									<option value="1971">1971</option>
									<option value="1972">1972</option>
									<option value="1973">1973</option>
									<option value="1974">1974</option>
									<option value="1975">1975</option>
									<option value="1976">1976</option>
									<option value="1977">1977</option>
									<option value="1978">1978</option>
									<option value="1979">1979</option>
									<option value="1980">1980</option>
									<option value="1981">1981</option>
									<option value="1982">1982</option>
									<option value="1983">1983</option>
									<option value="1984">1984</option>
									<option value="1985">1985</option>
									<option value="1986">1986</option>
									<option value="1987">1987</option>
									<option value="1988">1988</option>
									<option value="1989">1989</option>
									<option value="1990">1990</option>
									<option value="1991">1991</option>
									<option value="1992">1992</option>
									<option value="1993">1993</option>
									<option value="1994">1994</option>
									<option value="1995">1995</option>
									<option value="1996">1996</option>
									<option value="1997">1997</option>
									<option value="1998">1998</option>
									<option value="1999">1999</option>
									<option value="2000">2000</option>
									<option value="2001">2001</option>
									<option value="2002">2002</option>
									<option value="2003">2003</option>
									<option value="2004">2004</option>
									<option value="2005">2005</option>
									<option value="2006">2006</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3">성별 <span
						class="text-danger">*</span></label>
					<div class="col-md-8 col-sm-9">
						<label> <input name="gender" type="radio" value="Male"
							checked> 남
						</label>     <label> <input name="gender" type="radio"
							value="Female"> 여
						</label>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3">연락처 <span
						class="text-danger">*</span></label>
					<div class="col-md-5 col-sm-8">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-phone"></i></span> <input type="text"
								class="form-control" name="m_phone" id="contactnum"
								placeholder="연락처 입력." value="">
						</div>
					</div>
				</div>
				<div class="form-group">
					&nbsp&nbsp&nbsp&nbsp<input class="btn btn-primary" type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <input
						type="text" class="fc1" id="sample4_roadAddress"
						placeholder="도로명주소" name="RA"> <input type="text"
						class="fc1" id="sample4_jibunAddress" placeholder="지번주소" name="JA">
					<input type="text" class="fc1" id="sample4_detailAddress"
						placeholder="상세주소" name="DA"> <input type="text"
						class="fc1" id="sample4_postcode" placeholder="우편번호" name="PC">
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3">주민등록번호 <span
						class="text-danger">*</span></label>
					<div class="col-md-5 col-sm-8">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-phone"></i></span> <input type="text"
								class="form-control" name="m_phone" id="contactnum"
								placeholder="주민번호 입력." value="">
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3">이메일 <span
						class="text-danger">*</span></label>
					<div class="col-md-5 col-sm-8">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-phone"></i></span> <input type="text"
								class="form-control" name="m_mail" id="contactnum"
								placeholder="이메일입력." value="">
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-offset-3 col-md-8 col-sm-9">
						<span class="text-muted"> 회원으로 가입하시면 <a
							href="https://t1.daumcdn.net/liveboard/maxim/58d394f7ab304c2eb73f5bf0a84125d6.jpg"
							class="bb1">서비스 약관</a>과 <a
							href="https://t1.daumcdn.net/liveboard/maxim/58d394f7ab304c2eb73f5bf0a84125d6.jpg"
							class="bb1">개인정보 정책</a>을 읽고 동의하신 것으로 간주됩니다.
						</span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-offset-3 col-xs-10">
						&nbsp&nbsp&nbsp&nbsp<input name="Submit" type="submit"
							value="가입하기" class="btn btn-primary">
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 컨테이너 -->
	<div class="row" id="hos">
		<div class="col-md-8">
			<br>
			<h1 class="entry-title">
				<span>병원가입하기</span>
			</h1>
			<hr>
			<form class="form-horizontal" method="post" id="signup" name="signup2"
				enctype="multipart/form-data" action="./hJoinProc" onsubmit="return check(2)">
				<div class="form-group">
					<label class="control-label col-sm-3">아이디 <span
						class="text-danger">*</span></label>
					<div class="col-md-8 col-sm-9">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-envelope"></i></span> <input type="text"
								class="form-control" name="h_id" id="h_id"
								placeholder="아이디를 입력하세요.">
								<input type="button" class="btn-primary" value="중복확인" onclick="idcheck(2)">
								<input type="hidden" value="0" id="hcheck">
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3">비밀번호 입력 <span
						class="text-danger">*</span></label>
					<div class="col-md-5 col-sm-8">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input type="password"
								class="form-control" name="h_pwd" id="password"
								placeholder="비밀번호 입력" value="">
						</div>
					</div>
				</div>
				<!--  
				<div class="form-group">
					<label class="control-label col-sm-3">비밀번호 확인 <span
						class="text-danger">*</span></label>
					<div class="col-md-5 col-sm-8">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input type="password"
								class="form-control" name="c_h_pwd" id="cpassword"
								placeholder="비밀번호 확인" value="">
						</div>
					</div>
				</div>
				-->

				<div class="form-group">
					<label class="control-label col-sm-3">대표분 성함<span
						class="text-danger">*</span></label>
					<div class="col-md-8 col-sm-9">
						<input type="text" class="form-control" name="h_repre"
							id="mem_name" placeholder="성함입력" value="">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3">병원명<span
						class="text-danger">*</span></label>
					<div class="col-md-8 col-sm-9">
						<input type="text" class="form-control" name="h_name"
							id="mem_name" placeholder="병원 이름 입력" value="">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3">진료과목<span
						class="text-danger">*</span></label><br> <input type="checkbox" id=""
						name="h_im" value="내과"> <label for="vehicle1">내과</label><br>
					<input type="checkbox" id="vehicle2" name="h_ent" value="이비인후과">
					<label for="vehicle2">이비인후과</label><br> <input type="checkbox"
						id="" name="h_os" value="정형외과"> <label for="vehicle3">정형외과</label><br>
					<input type="checkbox" id="" name="h_ps" value="성형외과"> <label
						for="vehicle3">성형외과</label><br> <input type="checkbox" id=""
						name="h_dm" value="피부과"> <label for="vehicle3">피부과</label><br>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3">병원사진 <br> <small>(등록)</small></label>
					<div class="col-md-5 col-sm-8">
						<input type="file" name="h_image" id="hImg" multiple> <input
							class="hImgUp" value="파일선택" readonly> <input
							type="hidden" id="filecheck1" value="0" name="filecheck1">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-3">병원등록증 <br> <small>(등록)</small></label>
					<div class="col-md-5 col-sm-8">
						<input type="file" name="h_reg" id="hReg" multiple> <input
							class="hRegUp" value="파일선택" readonly> <input
							type="hidden" id="filecheck1" value="0" name="filecheck1">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3">전화번호입력 (-제외)<span
						class="text-danger">*</span></label>
					<div class="col-md-5 col-sm-8">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-phone"></i></span> <input type="text"
								class="form-control" name="h_call" id="contactnum"
								placeholder="사업자번호 입력." value="">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-3">사업자번호입력 (-제외)<span
						class="text-danger">*</span></label>
					<div class="col-md-5 col-sm-8">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-phone"></i></span> <input type="text"
								class="form-control" name="h_cn" id="contactnum"
								placeholder="사업자번호 입력." value="">
						</div>
					</div>
				</div>
				<div class="form-group">
					&nbsp&nbsp&nbsp&nbsp<input class="btn btn-primary" type="button"
						onclick="sample4_execDaumPostcode2()" value="우편번호 찾기"><br />
					<input type="text" class="fc1" id="sample4_roadAddress2"
						placeholder="도로명주소" name="RA"> <input type="text"
						class="fc1" id="sample4_jibunAddress2" placeholder="지번주소"
						name="JA"> <input type="text" class="fc1"
						id="sample4_detailAddress2" placeholder="상세주소" name="DA">
					<input type="text" class="fc1" id="sample4_postcode2"
						placeholder="우편번호" name="PC">
				</div>
				<div class="form-group">
					<div class="col-xs-offset-3 col-md-8 col-sm-9">
						<span class="text-muted"> 회원으로 가입하시면 <a
							href="https://t1.daumcdn.net/liveboard/maxim/58d394f7ab304c2eb73f5bf0a84125d6.jpg"
							class="bb1">서비스 약관</a>과 <a
							href="https://t1.daumcdn.net/liveboard/maxim/58d394f7ab304c2eb73f5bf0a84125d6.jpg"
							class="bb1">개인정보 정책</a>을 읽고 동의하신 것으로 간주됩니다.
						</span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-offset-3 col-xs-10">
						&nbsp&nbsp&nbsp&nbsp<input name="Submit" type="submit"
							value="가입하기" class="btn btn-primary">
					</div>
				</div>
				
			</form>
		</div>
	</div>
</div>
<footer>
	<jsp:include page="Footer.jsp" />
</footer>
<script type="text/javascript">
	$(function() {
		$("#hos").hide();
		$(".home").hide();
		$(".common").hide();
		$(".admin").hide();
		$(".hosH").hide();
	});
	function jUser() {
		$("#user").show();
		$("#hos").hide();
	}
	function jHos() {
		$("#hos").show();
		$("#user").hide();
	}
	$("#hImg").on('change', function() {
		var files = $("#hImg")[0].files;
		var fileName = "";
		console.log(files);

		for (var i = 0; i < files.length; i++) {
			fileName += files[i].name + " ";
		}
		console.log(fileName);

		$(".hImgUp").val(fileName);

		if (fileName == "") {
			console.log("empty");
			$("#filecheck1").val(0);
			$(".hImgUp").val("파일선택");
		} else {
			console.log("not empty");
			$("#filecheck1").val(1);
		}
	});
	$("#hReg").on('change', function() {
		var Rfiles = $("#hReg")[0].files;
		var RfileName = "";
		console.log(Rfiles);

		for (var b = 0; b < Rfiles.length; b++) {
			RfileName += Rfiles[b].name + " ";
		}
		console.log(RfileName);

		$(".hRegUp").val(RfileName);

		if (RfileName == "") {
			console.log("empty");
			$("#filecheck1").val(0);
			$(".hRegUp").val("파일선택");
		} else {
			console.log("not empty");
			$("#filecheck1").val(1);
		}
	});
	function check(c){
		//form 태그의 내용을 전부 가져오기
		if(c == 1){
			var frm = document.signup;
		}
		else{
			var frm = document.signup2;
		}
		var check = $("#mcheck").val();
		var hcheck = $("#hcheck").val();

		//submit 버튼을 뺀 나머지 input태그의 개수
		var length = frm.length - 1;
		
		//input 태그 중에 입력이 안된 요소를 확인
		for(var i = 0; i < length; i++){
			if(frm[i].value == "" 
					|| frm[i].value == null){
				alert(frm[i].title + " 빠진 내용이 없는지 확인해주세요.");
				frm[i].focus();
				return false;//action이 실행 안됨.
			}
		}
		if(check == 1 || hcheck == 1){
			return true;//action이 실행됨
		}
		else{
			alert("빠진내용이 없는지 확인해주세요.");
			return false;
		}
	};
	//아이디 중복 여부 확인 함수
	//이 함수의 ajax를 실행하기 위해서 
	//인터셉터 대상에서 제외해야 함.
	//servlet-context.xml에 exclude-mapping을 처리.
	function idcheck(num){
		var cnum = {"num" : num};
		if(num == 1){
			var id = $('#m_id').val();
			if(id == ""){
				alert("아이디를 입력하세요.");
				$('#m_id').focus();
				return;
			}
			var ckObj = {"id": id};		
			console.log(ckObj);
		}
		else{
			var id = $('#h_id').val();
			if(id == ""){
				alert("아이디를 입력하세요.");
				$('#h_id').focus();
				return;
			}
			var ckObj = {"id": id};
			console.log(ckObj);
		}
		
		$.ajax({
			url: "idCheck",
			type: "get",
			data: {"id":id, "num":num},
			success: function(data){
				//중복 id가 없으면 success, 있으면 fail 전송
				if(data == "success"){
					alert('ID 사용 가능');
					$('#mcheck').val(1);
					$('#hcheck').val(1);
				}
				else{
					alert('사용할 수 없는 ID');
					if(num == 1){
						$('#m_id').val('');//입력 초기화
						$('#m_id').focus();//ID 부분에 포커스 주기			
					}
					else{
						$('#h_id').val('');//입력 초기화
						$('#h_id').focus();//ID 부분에 포커스 주기	
					}
					
				}
			},
			error: function(error){
				console.log(error);
			}
		});
	}
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
function sample4_execDaumPostcode2() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode2').value = data.zonecode;
            document.getElementById("sample4_roadAddress2").value = roadAddr;
            document.getElementById("sample4_jibunAddress2").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress2").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress2").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>