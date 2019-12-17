<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Page Heading/Breadcrumbs -->
<section class="mypageTop">
	<h3 class="mt-4 mb-3">
		회원관리&nbsp;<small>회원수: ${count}</small>
	</h3>

	
</section>
<hr>

<!-- Page Content -->

<section class="f-m-s">
	<table class="list">
		<thead class="thead">
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>국적</th>
							<th>생일</th>
							<th>성별</th>
							<th>주소</th>
							<th>이메일</th>
							<th>번호</th>
							<th>여권</th>
							<th>탈퇴여부</th>
							<th>생성날짜</th>
						</tr>
					</thead>
					<tbody class="tbaody">
						<c:forEach items="${memberList}" var="member">
							<tr>
								<td>${member.id}</td>
								<td>${member.fname_ko}${member.lname_ko}</td>
								<td>${member.nationality}</td>
								<td>${member.birth}</td>
								<td>${member.gender}</td>
								<td>${member.address}</td>
								<td>${member.email}</td>
								<td>${member.phone}</td>
								<td>${member.passport}</td>
								<td>${member.useyn}</td>
								<td>${member.regDate}</td>
							</tr>
						</c:forEach>
					</tbody>
	</table>
</section>

<%@ include file="../footer.jsp"%>