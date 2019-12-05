<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Page Content -->
<div class="join" align="center">

	<!-- Page Heading/Breadcrumbs -->
	<h1 class="mt-4 mb-3">
		UPDATE <small>Travel Architect</small>
	</h1>
	<br>
	<article>
		<form id="join" method="post" name="formm">
		<input type="hidden" name="id" value="${loginMember.id}"/>
			<fieldset>
				<legend>Basic Info</legend>
				<table>
					<tr>
						<td>아이디</td>
						<td>${loginMember.id}</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="pwdCheck"></td>
					</tr>
					<tr>
						<td>생일</td>
						<td><input type="date" name="birth"></td>
						<td>성별</td>
						<td><select name="gender">
							<option value="M">남
							<option value="W">여
						</select></td>
					</tr>
					<tr>
						<td>성(국문)</td>
						<td><input type="text" name="fname_ko" value="${loginMember.fname_ko}"></td>
						<td>이름(국문)</td>
						<td><input type="text" name="lname_ko" value="${loginMember.lname_ko}"></td>
					</tr>
					<tr>
						<td>성(영어)</td>
						<td><input type="text" name="fname_en" value="${loginMember.fname_en}"></td>
						<td>이름(영어)</td>
						<td><input type="text" name="lname_en" value="${loginMember.lname_en}"></td>
					</tr>
					<tr>
						<td>국가</td>
						<td><input type="text" name="nationality" value="${loginMember.nationality}"></td>
					</tr>
					<tr>
						<td>E-Mail</td>
						<td><input type="text" name="email" value="${loginMember.email}"></td>
					</tr>
				</table>
			</fieldset>
			<br>
			<fieldset>
				<legend>추가 정보</legend>
				<table>
					<tr>
						<td rowspan="2">주소</td>
						<td><input type="text" name="zipNum" size="10"/>&nbsp;<input type="button" value="주소 찾기" class="dup" onclick="postZip()"/></td>
					</tr>
					<tr>
						<td><input type="text" name="addr1" size="50"/>&nbsp;<input type="text" name="addr2" size="25"/></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="phone" value="${loginMember.phone}"></td>
					</tr>
					<tr>
						<td>여권번호</td>
						<td><input type="text" name="passport"></td>
					</tr>
				</table>
			</fieldset>
			<div class="clear"></div>
			<br>
			<div id="buttons">
				<input type="button" value="UPDATE" class="submit" onclick="go_save('update')">
				<input type="reset" value="CANCEL" class="cancel">
			</div>

		</form>
	</article>
</div>

<%@ include file="../footer.jsp"%>