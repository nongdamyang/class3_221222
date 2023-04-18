<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">

</style>
<link href="css/inc.css" rel="stylesheet" type="text/css">
<link href="css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 게시판 등록 -->
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<article id="writeForm">
		<h1>자유게시판 글 등록</h1>
		<form action="FreeBoardWritePro.bo2" name="writeForm" method="post">
			<table>
				<tr>
					<td class="write_td_left"><label for="board_name">글쓴이</label></td>
					<td class="write_td_right"><input type="text" name="board_name" required="required" /></td>
				</tr>
				<tr>
					<td class="write_td_left"><label for="board_pass">비밀번호</label></td>
					<td class="write_td_right">
						<input type="password" name="board_pass" required="required" />
					</td>
				</tr>
				<tr>
					<td class="write_td_left"><label for="board_subject">제목</label></td>
					<td class="write_td_right"><input type="text" id="board_subject" name="board_subject" required="required" /></td>
				</tr>
				<tr>
					<td class="write_td_left"><label for="board_content">내용</label></td>
					<td class="write_td_right">
						<textarea id="board_content" name="board_content" cols="40" rows="15" required="required"></textarea>
					</td>
				</tr>
			</table>
			<section id="btnArea">
				<input type="submit" value="등록">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기">&nbsp;&nbsp;
				<input type="button" value="취소" onclick="history.back()">
			</section>
		</form>
	</article>
</body>
</html>








