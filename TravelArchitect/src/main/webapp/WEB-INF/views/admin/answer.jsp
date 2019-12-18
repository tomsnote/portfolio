<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Page Heading/Breadcrumbs -->
<section class="mypageTop">
	<h3 class="mt-4 mb-3">
		Q&A목록&nbsp;<small>답변하기</small>
	</h3>


</section>
<hr>

<!-- Page Content -->

<section class="f-m-s">
	<form name="responseMessage" method="POST" style="text-align:left; width:300px;">
		<div class="control-group form-group">
			<div class="controls">
				<label>제목:</label> <input type="text" class="form-control"
					id="title" name="title">
				<p class="help-block"></p>
			</div>
		</div>
		<div class="control-group form-group">
			<div class="controls">
				<label>이메일:</label> <input type="email" class="form-control"
					id="email" name="email" value="${qa.email}">
			</div>
		</div>
		<div class="control-group form-group">
			<div class="controls">
				<label>내용:</label>
				<textarea rows="10" cols="100" class="form-control" id="message"
					name="context" maxlength="999" style="resize: none"></textarea>
			</div>
		</div>
		<div id="success"></div>
		<!-- For success/fail messages -->
		<button type="submit" class="btn btn-primary" id="sendMessageButton"
			onclick="return responseQA()">답변</button>
	</form>
</section>

<%@ include file="../footer.jsp"%>