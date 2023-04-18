<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style type="text/css">
	#modifyForm {
		width: 500px;
		height: 450px;
		margin: auto;
	}
	
	h1 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 450px;
	}
	
	.modify_td_left {
		width: 150px;
		background: orange;
		text-align: center;
	}
	
	.modify_td_right {
		width: 300px;
		background: skyblue;
	}
	
	#commandCell {
		text-align: center;
	}
	#modifyForm {
	width: 500px;
	height: 450px;
	margin: auto;
	}

	#modifyForm > table {
	margin: auto;
	width: 450px;
	}
</style>
</head>
<body>
	<!-- 게시판 글 수정 -->
	<section id="modifyForm">
		<h1>게시판 글 수정</h1>
		<form action="FreeBoardModifyPro.bo2" name="boardForm" method="post">
			<input type="hidden" name="board_num" value="${param.board_num }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<table>
				
				<tr>
					<td class="modify_td_left"><label for="board_name">글쓴이</label></td>
					<td class="modify_td_right"><input type="text" name="board_name" value="${board.board_name }" required="required" readonly="readonly" /></td>
				</tr>
				<tr>
					<td class="modify_td_left"><label for="board_pass">비밀번호</label></td>
					<td class="modify_td_right">
						<input type="password" name="board_pass" required="required" />
					</td>
				</tr>
				<tr>
					<td class="modify_td_left"><label for="board_subject">제목</label></td>
					<td class="modify_td_right"><input type="text" id="board_subject" name="board_subject" value="${board.board_subject }" required="required" /></td>
				</tr>
				<tr>
					<td class="modify_td_left"><label for="board_content">내용</label></td>
					<td class="modify_td_right">
						<textarea id="board_content" name="board_content" cols="40" rows="15" required="required">${board.board_content }</textarea>
					</td>
				</tr>
			</table>
			<section id="commandCell">
				<input type="submit" value="수정">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기">&nbsp;&nbsp;
				<input type="button" value="취소" onclick="history.back()">
			</section>
		</form>
	</section>
</body>
</html>








