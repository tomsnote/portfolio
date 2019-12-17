<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- Page Content -->
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<h1 class="mt-4 mb-3">
		고객센터 <small></small>
	</h1>

	<!-- Content Row -->
	<div class="row">
		<!-- Map Column -->
		<div class="col-lg-8 mb-4">
			<!-- Embedded Google Map -->
			<iframe width="100%" height="400px" frameborder="0" scrolling="no"
				marginheight="0" marginwidth="0"
				src="http://maps.google.com/maps?hl=en&amp;ie=UTF8&amp;ll=37.510535,126.990009&amp;spn=56.506174,79.013672&amp;t=m&amp;z=11&amp;output=embed"></iframe>
		</div>
		<!-- Contact Details Column -->
		<div class="col-lg-4 mb-4">
			<h3>Contact Details</h3>
			<p>
				서울특별시 영등포구 영중로8길 6 <br>6층 <br>
			</p>
			<p>
				<abbr title="Phone">연락처</abbr>: 02-3667-3688
			</p>
			<p>
				<abbr title="Email">이메일</abbr>: <a href="mailto:humanec02@naver.com">
					humanec02@naver.com </a>
			</p>
			<p>
				<abbr title="Hours">운영시간</abbr>: 월요일 - 금요일 : 9:00 AM ~ 6:00 PM
			</p>
		</div>
	</div>
	<!-- /.row -->

	<!-- Contact Form -->
	<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
	<div class="row">
		<div class="col-lg-8 mb-4">
			<h3>Q&A</h3>
			<form name="sentMessage" id="contactForm" novalidate
				action="sentMessage">
				<input type="hidden" name="member" value="${loginUser.id}"/>
				<div class="control-group form-group">
					<div class="controls">
						<label>이름:</label> <input type="text" class="form-control"
							id="name" name="name" required data-validation-required-message="이름을 입력해주세요.">
						<p class="help-block"></p>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>전화번호:</label> <input type="tel" class="form-control"
							id="phone" name="phone" required
							data-validation-required-message="전화번호를 입력해주세요.">
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>이메일:</label> <input type="email" class="form-control"
							id="email" name="email" required
							data-validation-required-message="이메일을 입력해주세요.">
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>내용:</label>
						<textarea rows="10" cols="100" class="form-control" id="message" name="context"
							required data-validation-required-message="메시지를 입력해주세요"
							maxlength="999" style="resize: none"></textarea>
					</div>
				</div>
				<div id="success"></div>
				<!-- For success/fail messages -->
				<button type="submit" class="btn btn-primary" id="sendMessageButton">Send
					Message</button>
			</form>
		</div>

	</div>
	<!-- /.row -->

</div>
<!-- /.container -->

<%@ include file="../footer.jsp"%>