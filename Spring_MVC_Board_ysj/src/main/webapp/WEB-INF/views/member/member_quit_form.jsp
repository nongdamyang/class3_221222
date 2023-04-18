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
<script type="text/javascript">
	function confirmQuit() {
		return confirm("정말로 탈퇴하시겠습니까?");
	}
</script>
</head>
<body>
	<c:if test="${empty sessionScope.sId }">
		<script type="text/javascript">
			alert("잘못된 접근입니다!")
			location.href = "./";  <%-- ./ => 루트  --%>
		</script>
	</c:if>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<article id="loginForm">

	<h1>회원 탈퇴</h1>
		<form action="MemberQuitPro.me" method="post" onsubmit="return confirmQuit()">
			<table border="1">
				<tr>
					<th>패스워드</th>
					<td><input type="text" name="passwd" required="required"></td>
				</tr>
				
				<tr>
					<td colspan="2" id="btnArea">
						<input type="submit" value="탈퇴하기">
						<input type="submit" value="돌아가기">
					</td>
				</tr>
			</table>
		</form>
	</article>
</body>
</html>










































