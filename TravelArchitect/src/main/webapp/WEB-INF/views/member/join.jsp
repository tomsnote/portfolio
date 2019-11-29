<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Page Content -->
<div class="join" align="center">

	<!-- Page Heading/Breadcrumbs -->
	<h1 class="mt-4 mb-3">
		JOIN <small>Travel Architect</small>
	</h1>
	<br>
	<article>
		<form id="join" method="post" name="formm">
			<fieldset>
				<legend>Basic Info</legend>
				<input type="hidden" name="reid">
				<table>
					<tr>
						<td>User ID</td>
						<td><input type="text" name="id" size="12"></td>
						<td><input type="button" value="중복 체크" class="dup" onclick="idCheck()"></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<td>Retype Password</td>
						<td><input type="password" name="pwdCheck"></td>
					</tr>
					<tr>
						<td>First Name(Ko)</td>
						<td><input type="text" name="fname_ko"></td>
						<td>Last Name(Ko)</td>
						<td><input type="text" name="lname_ko"></td>
					</tr>
					<tr>
						<td>First Name(En)</td>
						<td><input type="text" name="fname_en"></td>
						<td>Last Name(En)</td>
						<td><input type="text" name="lname_en"></td>
					</tr>
					<tr>
						<td>Nationality</td>
						<td><input type="text" name="nationality"></td>
					</tr>
					<tr>
						<td>E-Mail</td>
						<td><input type="text" name="email"></td>
					</tr>
				</table>
			</fieldset>
			<br>
			<fieldset>
				<legend>Optional</legend>
				<table>
					<tr>
						<td rowspan="2">Address</td>
						<td><input type="text" name="zipNum" size="10"/>&nbsp;<input type="button" value="주소 찾기" class="dup" onclick="postZip()"/></td>
					</tr>
					<tr>
						<td><input type="text" name="addr1" size="50"/>&nbsp;<input type="text" name="addr2" size="25"/></td>
					</tr>
					<tr>
						<td>Phone Number</td>
						<td><input type="text" name="phone"></td>
					</tr>
				</table>
			</fieldset>
			<div class="clear"></div>
			<div id="buttons">
				<input type="button" value="JOIN" class="submit" onclick="go_save('join')">
				<input type="reset" value="CANCEL" class="cancel">
			</div>

		</form>
	</article>
</div>

<%@ include file="../footer.jsp"%>