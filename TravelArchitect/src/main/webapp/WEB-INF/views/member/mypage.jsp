<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>



<!-- Page Heading/Breadcrumbs -->

<section class="mypageTop">
	<h3 class="mt-4 mb-3">
		Mypage&nbsp;<small>Travel Architect</small>
	</h3>

	<ul>
		<li><a href="airList?change=airList">항공 예약 리스트</a></li>
		<li>/</li>
		<li><a href="hotelList?change=hotelList">호텔 예약 리스트</a></li>
	</ul>
</section>
<hr>
<!-- Page Content -->
<section class="mypageBody1">
	<div class="b1-h">
		<p>나의 회원 정보</p>
	</div>
	<div class="myInfo">
		<div class="m-left" align="left">
			<img src="http://placehold.it/200x200" />
		</div>
		<div class="m-right">
			<p>내 포인트</p>
			<p>0점</p>
			<p>쿠폰</p>
			<p>0장</p>
			<input type="button" value="개인정보변경" onclick="location.href='updateUserForm'" /> 
			<input type="button" value="회원탈퇴" onclick="location.href='deleteUser'" />
		</div>
	</div>
</section>

<c:choose>
	<c:when test="${changeList == 'airList'}">
		<%@ include file="airList.jsp"%>
	</c:when>
	<c:otherwise>
		<%@ include file="hotelList.jsp"%>
	</c:otherwise>
</c:choose>
<%@ include file="../footer.jsp"%>