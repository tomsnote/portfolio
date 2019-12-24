<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Page Heading/Breadcrumbs -->
<section class="mypageTop">
	<h3 class="mt-4 mb-3">
		항공예약&nbsp;<small>스케쥴 보기</small>
	</h3>
</section>
<hr>

<!-- Page Content -->
<section id="a-r-s">
	<form method="get" name="formm">
		<div id="a-r-h">
			<div class="a-r-t">
				<h5>항공사</h5>
				<select id="airline" name="airline" onchange="searchSchedules()">
					<option value="">=========</option>
					<c:forEach items="${distinctAir}" var="air">
						<option value="${air.airline}">${air.airline}</option>
					</c:forEach>
				</select>
			</div>
			<script>
				var airline = document.getElementById("airline");
				var index = document.getElementById("airline").options;
				for (var i = 0; i < airline.length; i++) {
					if (index[i].value == '${airline}')
						index[i].setAttribute('selected', 'selected');
				}
			</script>
			<div class="a-r-t">
				<h5>출발시간</h5>
				<select id="departureTime" name="departureTime"
					onchange="searchSchedules()">
					<option value="">=========</option>
					<c:forEach items="${distinctTime}" var="time">
						<option value="${time.departureTime}">${time.departureTime}</option>
					</c:forEach>
				</select>
			</div>
			<script>
				var airline = document.getElementById("departureTime");
				var index = document.getElementById("departureTime").options;
				for (var i = 0; i < airline.length; i++) {
					if (index[i].value == '${time}')
						index[i].setAttribute('selected', 'selected');
				}
			</script>
			<div class="a-r-t">
				<h5>출발도시</h5>
				<p>${info.departureCity}</p>
			</div>
			<div class="a-r-t">
				<h5>도착도시</h5>
				<p>${info.arrivalCity}</p>
			</div>
			<div class="a-r-t">
				<h5>출발날짜</h5>
				<p>${info.departureDate}</p>
			</div>
			<div class="a-r-t">
				<h5>도착날짜</h5>
				<p>${info.arrivalDate}</p>
			</div>
		</div>
	</form>
	<div id="a-r-m" align="center" class="a-r-mt">
		<div class="a-r-t-h">
			<p>항공요금 및 스케쥴</p>
		</div>
		<table>
			<colgroup>
				<col width="10%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="10%">
				<col width="15%">
				<col width="5%">
			</colgroup>
			<thead class="thead">
				<tr>
					<th>항공편</th>
					<th>항공사</th>
					<th>좌석등급</th>
					<th>가격</th>
					<th>출발시간</th>
					<th>도착시간</th>
					<th>좌석번호</th>
					<th></th>
				</tr>
			</thead>
			<tbody class="tbody">
				<c:forEach items="${flights}" var="flight">
					<tr class="trAir">
						<td>${flight.flight}</td>
						<td>${flight.airline}</td>
						<td>${flight.seatType}</td>
						<td>${flight.flightPrice}</td>
						<td>${flight.departureTime}</td>
						<td>${flight.arrivalTime}</td>
						<td>${flight.seatNum}</td>
						<td><a href="selectReserve?flight=${flight.flight}&seatNum=${flight.seatNum}">예약</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</section>
<%@ include file="../footer.jsp"%>