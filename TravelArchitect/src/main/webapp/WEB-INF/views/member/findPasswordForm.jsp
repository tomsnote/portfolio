<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link href="css/subpage.css" rel="stylesheet">
<style type="text/css">
body {
	background-color: skyblue;
	font-family: Verdana;
}

#popup {
	padding: 0 10px;
}

#popup h1 {
	font-family: "Times New Roman", Times, serif;
	font-size: 45px;
	color: black;
	font-weight: normal;
}

table#zipcode {
	border-collapse: collapse; /* border 사이의 간격 없앰 */
	border-top: 3px solid #fff;
	border-bottom: 3px solid #fff;
	width: 100%;
	margin-top: 15px;
}

table#zipcode th, table#zipcode td {
	text-align: center;
	border-bottom: 1px dotted #fff;
	color: #FFF;
}

table th, td {
	padding: 10px;
}

table#zipcode  a {
	display: block;
	height: 20px;
	text-decoration: none;
	color: #fff;
	padding: 10px;
}

table#zipcode a:hover {
	color: #F90;
	font-weight: bold;
}
</style>
<script type="text/javascript">
function idok() {
	opener.formm.pwd.value="${pwd}";
	self.close();
};
</script>
</head>
<body>
	<div id="popup">
		<h1>비밀번호 찾기</h1>
		<form method=post name=formm action="findPassword">
			<table>
				<tr>
					<td align="right">아이디 :</td>
					<td><input name="id" type="text"></td>
				</tr>
				<tr>
					<td colspan='2' align="center"><input type="submit" value="찾기"
						class="submit"></td>
				</tr>
			</table>
		</form>

		<c:if test="${message == 1}">
        	이 아이디의 비밀버호는 <b>${pwd}</b>입니다.<br>
        	<input type="button" value="사용" class="cancel" onclick="idok()">
		</c:if>
		<c:if test="${message == -1}">
        			ID가 존재하지 않습니다.
			</c:if>

	</div>
</body>
</html>