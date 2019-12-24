<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize, url) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = url;
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		if($('input[name=change]').val()=='seatList'){
			url= url + "&change=seatList";
		}
		location.href = url;
	}
	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, url, searchType, keyword) {
		var url = url;
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		if($('input[name=change]').val()=='seatList'){
			url= url + "&change=seatList";
		}
		location.href = url;
	}
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize, url) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = url;
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		if($('input[name=change]').val()=='seatList'){
			url= url + "&change=seatList";
		}
		location.href = url;
	}
</script>

<!-- Page Content -->
<div id="paginationBox">
	<ul class="pagination">
		<c:if test="${pagination.prev}">
			<li class="page-item"><a class="page-link" href="#"
				onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${url}')">Previous</a></li>
		</c:if>

		<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
			var="idx">

			<li
				class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
				<a class="page-link" href="#"
				onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${url}')">
					${idx} </a>
			</li>
		</c:forEach>

		<c:if test="${pagination.next}">
			<li class="page-item"><a class="page-link" href="#"
				onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${url}')">Next</a></li>
		</c:if>
	</ul>
</div>
