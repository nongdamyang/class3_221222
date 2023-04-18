<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/inc.css" rel="stylesheet" type="text/css">
<link href="css/subpage.css" rel="stylesheet" type="text/css">
<script src="js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function(){
// 		$("#btnCheckId").on("click", function(){
// 			let id = $("#id").val();
// 			location.href = "MemberCheckId.me?id=" + id;
			
// 		});		

		let nameStatus = false;
		let idStatus = false;
		let passwdStatus = false;
		let passwd2Status = false; 
		
		$("#id").on("blur", function(){
			let id = $("#id").val();
			
			if(id == ""){
				idStatus = false;
				$("#checkIdResult").html("아이디 입력 필수").css("color", "red");
				return;
			} else {
				let regex = /^[A-Za-z0-9!@#$%]{4,8}$/;
				if(!regex.exec(id)){
					$("#checkIdResult").html("영문자, 숫자, 특수문자 조합 4~8 글자").css("color", "red");
					idStatus = false;
				} else {
// 					$.ajax({
// // 						url: "MvcBoardCheck.me",
// 						url: "MemberCheckDupId.me",
// 						data: {
// 							id: $("#id").val()
// 						},
// 						success: function(result){
// 							alert(result + " : " + typeof(result));
// 							if(result == "true"){
// 								$("#checkIdResult").html("이미 사용중인 아이디").css("color", "red");
// 								idStatus = false;
// 							} else if(result == "false"){
// 								$("#checkIdResult").html("사용 가능 아이디").css("color", "blue");
// 								idStatus = true;
// 							}
// 						}
// 					}); // ajax 끝 
					$.ajax({
						url: "MemberCheckDupId.me", // MemberCheckDupIdAction 매핑
						data: {
							id: $("#id").val()
						},
						success: function(result) { // 성공 시에만 작업 처리
							// 처리 페이지(비즈니스 로직)에서 처리 성공 후 "true" or "false" 값 리턴
							// 리턴받은 결과값에 대해 "true" 또는 "false" 판별
							if(result == "true") {
								// checkIdResult 영역에 "이미 사용중인 아이디"(빨간색) 출력
								$("#checkIdResult").html("이미 사용중인 아이디").css("color", "red");
								idStatus = false;
							} else if(result == "false") {
								// checkIdResult 영역에 "사용 가능한 아이디"(파란색) 출력
								$("#checkIdResult").html("사용 가능한 아이디").css("color", "blue");
								idStatus = true;
							}
						}
					}); // ajax 끝
				}
			}
			
			
		});
		
		$("#name").on("change", function(){
			let regex = /^[가-힣]{2,5}$/;
			let name = $("#name").val();
			if(!regex.exec(name)){
				$("#checkNameResult").html("한글 2~5글자 필수!").css("color", "red");
				$("#name").select();
				nameStatus = false;
			} else {
				$("#checkNameResult").html("사용가능").css("color", "blue");
				nameStatus = true;
			}
		});
		
		$("#passwd").on("change", function(){
			let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
			
			let engUpperRegex = /[A-Z]/; // 부분 검사 규칙
			let engLowerRegex = /[a-z]/; // 부분 검사 규칙
			let numberRegex = /[0-9]/; // 부분 검사 규칙
			let specRegex = /[!@#$%]/; // 부분 검사 규칙
			let passwd = $("#passwd").val();
			
			if(!lengthRegex.exec(passwd)){
				$("#checkPasswdResult").html("영문자, 숫자, 특수문자 8~16글자 필수").css("color", "red");
				$("#passwd").select();
				passwdStatus = false;
			} else {
				let count = 0; 
// 				score += engUpperRegex.exec(passwd) ? 1 : 0;
// 				score += engLowerRegex.exec(passwd) ? 1 : 0;
// 				score += numberRegex.exec(passwd) ? 1 : 0;
// 				score += specRegex.exec(passwd) ? 1 : 0;
				if(engUpperRegex.exec(passwd)) {count++}
				if(engLowerRegex.exec(passwd)) {count++}
				if(numberRegex.exec(passwd)) {count++}
				if(specRegex.exec(passwd)) {count++}
				
				switch(count){
					case 4 : 
						$("#checkPasswdResult").html("안전").css("color", "green"); 
						passwdStatus = true;
						break;
					case 3 : 
						$("#checkPasswdResult").html("보통").css("color", "yellow"); 
						passwdStatus = true;
						break;
					case 2 : 
						$("#checkPasswdResult").html("위험").css("color", "orange"); 
						passwdStatus = true;
						break;
					case 1 : 
					case 0 : $("#checkPasswdResult").html("사용 가능한 패스워드").css("color", "red"); break;
						passwdStatus = false;
				}
				
				
// 				$("#checkPasswdResult").html("사용 가능한 패스워드").css("color", "blue");
			}
		});
		
		$("#passwd2").on("change", function(){
// 			let passwd = $("#passwd").val();
			if($("#passwd").val() == $("#passwd2").val()){
				$("#checkPasswd2Result").html("비밀번호 일치").css("color", "blue");
				passwd2Status = true;
			} else {
				$("#checkPasswd2Result").html("비밀번호 불일치").css("color", "red");
				passwd2Status = false;
			}
		});
		
		
// 		$("form").submit(function(){
// 			if(nameStatus && idStatus && passwdStatus && passwd2Status){
// 				return true;
// 			} else {
// 				return false;
// 			}
// 		});

		$("form").submit(function() {
			if(!nameStatus){
				alert("이름을 확인하세요!")
				$("#name").focus();
				return false;
			} else if(!idStatus) {
				alert("아이디를 확인하세요!")
				$("#id").focus();
				return false;

			} else if(!passwdStatus){
				alert("비밀번호를 확인하세요!")
				$("#passwd").focus();
				return false;
			} else if(!passwd2Status){
				alert("비밀번호확인을 확인하세요!")
				$("#passwd2").focus();
				return false;
			}
		});
		
	});
</script>
</head>
<body>
	<c:if test="${not empty sessionScope.sId }">
		<script type="text/javascript">
			alert("잘못된 접근입니다!")
			location.href = "./";  <%-- ./ => 루트  --%>
		</script>
	</c:if>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<article id="joinForm">
		<h1>회원가입</h1>	
		<form action="MemberJoinPro.me" method="post" name="joinForm">
			<table border="1">
				<tr>
					<th class="td_left">이름</th>
					<td class="td_right">
						<input type="text" name="name" id="name" required="required">
						<span id="checkNameResult"></span>
					</td>
				</tr>
				<tr>
					<th class="td_left">ID</th>
					<td class="td_right">
						<input type="text" name="id" id="id" placeholder="4 ~ 8글자 사이 입력"  required="required">
<!-- 						<input type="button" value="중복확인" id="btnCheckId"> -->
						<span id="checkIdResult"></span>
					</td>
				</tr>
				<tr>
					<th class="td_left">비밀번호</th>
					<td class="td_right">
						<input type="text" name="passwd" id="passwd" placeholder="8 ~ 16글자 사이 입력"  required="required">
						<span id="checkPasswdResult"></span>
					</td>
				</tr>
				<tr>
					<th class="td_left">비밀번호확인</th>
					<td class="td_right">
						<input type="password" name="passwd2"  id="passwd2" required="required">
						<span id="checkPasswd2Result"></span>
					</td>
				</tr>
				<tr>
					<th class="td_left">E-Mail</th>
					<td class="td_right">
						<input type="text" name="email1" class="email" required="required">@<input type="text" name="email2" class="email" required="required">
						<select id="emailDomain" onchange="selectDomain(this.value)">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>	
				<tr>
					<th class="td_left">성별</th>
					<td class="td_right">
						<input type="radio" name="gender" value="남">남
						<input type="radio" name="gender" value="여">여
					</td>
				</tr>
				<tr>
					<td colspan="2" id="btnArea">
						<input type="submit" value="가입">
						<input type="reset" value="초기화">
						<input type="button" value="돌아가기">
					</td>
				</tr>
			</table>
		</form>
	</article>
</body>
</html>
















































