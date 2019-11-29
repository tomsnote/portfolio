<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<c:if test="${not empty alert}">
	<script>alert('${alert}');</script>
</c:if>
	

<!-- Page Content -->
<div class="login" align="center">

	<!-- Page Heading/Breadcrumbs -->
	<h1 class="mt-4 mb-3">
		LOGIN <small>Travel Architect</small>
	</h1>
	<br>
	<form method="post" name="formm" action="login">
		<table>
			<tr>
				<td>User ID</td>
				<td><input type="text" name="id" value="test" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="pwd" value="1" /></td>
			</tr>
		</table>

		<div class="clear"></div>
		<br>
		<div id="buttons">
			<input type="submit" value="LOGIN">
		</div>
		
		<br>
		<input type="button" value="회원가입" class="cancel" onclick="location='joinForm'"> 
		<input type="button" value="ID 찾기" class="submit" onclick="findId()">
		<input type="button" value="비밀번호 찾기" class="submit" onclick="findPassword()">
		<br>
	</form>
</div>

<%@ include file="../footer.jsp"%>