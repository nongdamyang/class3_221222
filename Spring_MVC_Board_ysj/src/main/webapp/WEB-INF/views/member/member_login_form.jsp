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
	<article id="loginForm">

	<h1>로그인</h1>
		<form action="MemberLoginPro.me" method="post">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" required="required"></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="text" name="passwd" required="required"></td>
				</tr>
				
				<tr>
					<td colspan="2" id="btnArea">
						<input type="submit" value="로그인">
					</td>
				</tr>
			</table>
		</form>
	</article>
</body>
</html>










































