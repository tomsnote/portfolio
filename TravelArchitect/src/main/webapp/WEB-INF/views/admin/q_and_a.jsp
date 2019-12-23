<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "qaList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "qaList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "qaList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>

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
	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
			</c:if>

			<c:forEach begin="${pagination.startPage}"
				end="${pagination.endPage}" var="idx">

				<li
					class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
					<a class="page-link" href="#"
					onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
						${idx} </a>
				</li>
			</c:forEach>

			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
			</c:if>
		</ul>
	</div>
</section>

<%@ include file="../footer.jsp"%>