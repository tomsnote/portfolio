<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Page Heading/Breadcrumbs -->
<section class="mypageTop">
	<h3 class="mt-4 mb-3">
		항공권 관리&nbsp;<small>항공편 추가</small>
	</h3>
</section>
<hr>
<!-- Page Content -->
<section class="f-m-s">
	
		<div class="b2-h">
			<p>좌석 정보 입력</p>
		</div>

		<form class="flightList" name="formm" method="get">
			<div>
				<input type="submit" value="항공편 추가" onclick="return insertFlight()" />
			</div>
			<table id="addSeat">
				<thead class="thead">
					<tr>
						<th>항공사</th>
						<th>항공편</th>
						<th>출발도시</th>
						<th>도착도시</th>
						<th>출발날짜</th>
						<th>도착날짜</th>
						<th>출발시간</th>
						<th>도착시간</th>
					</tr>
				</thead>
				<tbody id="selectFlight">
					<tr>
						<td><input type="text" name="airline"/></td>
						<td><input type="text" name="flight"/></td>
						<td><input type="text" name="departureCity"/></td>
						<td><input type="text" name="arrivalCity"/></td>
						<td><input type="date" name="departureDate"/></td>
						<td><input type="date" name="arrivalDate"/></td>
						<td><input type="text" name="departureTime"/></td>
						<td><input type="text" name="arrivalTime"/></td>
					</tr>
				</tbody>
			</table>
		</form>

</section>

<%@ include file="../footer.jsp"%>