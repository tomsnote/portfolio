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
				<th></th>
				<th>제목</th>
				<th>아이디</th>
				<th>생성날짜</th>
				<th>답변</th>
			</tr>
		</thead>
		<tbody class="tbaody">
			<c:forEach items="${qaList}" var="qa">
				<tr>
					<td><input type="radio" name="qa_num"
									value="${qa.qa_num}" /></td>
					<td>${qa.name}</td>
					<td>${qa.member}</td>
					<td>${qa.regdate}</td>
					<td>${qa.answer}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>

<%@ include file="../footer.jsp"%>