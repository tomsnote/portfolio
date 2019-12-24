<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Page Heading/Breadcrumbs -->
<section class="mypageTop">
	<h3 class="mt-4 mb-3">
		Q&A목록&nbsp;<small></small>
	</h3>
</section>
<hr>

<!-- Page Content -->

<section class="f-m-s">
	<table class="list">
		<thead class="thead">
			<tr>
				<th>제목</th>
				<th>아이디</th>
				<th>생성날짜</th>
				<th>답변여부</th>
				<th></th>
			</tr>
		</thead>
		<tbody class="tbaody">
			<c:forEach items="${qaList}" var="qa">
				<tr>
					<td>${qa.name}</td>
					<td>${qa.member}</td>
					<td>${qa.regdate}</td>
					<td>${qa.answer}</td>
					<td><input type="button" value="답변하기"
						onclick="location.href='answer?qa_num=${qa.qa_num}'" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<c:set var="url" value="qaList"/> 
	<%@ include file="../page/pagination.jsp" %>
</section>

<%@ include file="../footer.jsp"%>