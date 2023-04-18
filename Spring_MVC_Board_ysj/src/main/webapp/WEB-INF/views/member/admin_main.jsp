<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/inc.css" rel="stylesheet" type="text/css">
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
<body>

	<c:if test="${sessionScope.sId ne 'admin'}">
		<script>
			alert("잘못된 접근입니다!")
			location.href = "./";''
		</script>
	</c:if>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<article id="main">
		<h1>관리자 메인페이지</h1>
		<h3><a href="AdminMemberList.me">회원목록 조회</a></h3>
	</article>
</body>
</html>
















































