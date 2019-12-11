<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Page Heading/Breadcrumbs -->
<section class="mypageTop">
	<h3 class="mt-4 mb-3">
		항공권 관리&nbsp;<small>Travel Architect</small>
	</h3>

	<ul>
		<li><a href="flightManage?change=flightList">항공편 리스트</a></li>
		<li>/</li>
		<li><a href="flightManage?change=seatList">항공권 좌석 리스트</a></li>
	</ul>
</section>
<hr>

<!-- Page Content -->

<section class="f-m-s">
	<c:choose>
		<c:when test="${change!='flightList'}">
			<div class="b2-h">
				<p>항공권 좌석 리스트</p>
			</div>
			<form class="flightList" name="formm">
				<div>
					<input type="button" value="추가"
						onclick="location.href='moveInsertSeat'" /> <input type="button"
						value="수정" onclick="movoUpdateSeat()" /> <input type="button"
						value="삭제" onclick="deleteSeat()" />
				</div>

				<table>
					<thead class="thead">
						<tr>
							<th></th>
							<th>항공사</th>
							<th>항공편</th>
							<th>출발도시</th>
							<th>도착도시</th>
							<th>출발날짜</th>
							<th>도착날짜</th>
							<th>출발시간</th>
							<th>도착시간</th>
							<th>좌석타입</th>
							<th>가격</th>
							<th>좌석번호</th>
							<th>예약여부</th>
						</tr>
					</thead>
					<tbody class="tbaody">
						<c:forEach items="${flightSeatList}" var="flight">
							<tr>
								<td><input type="checkbox" name="seatNum"
									value="${flight.seatNum}" /></td>
								<td>${flight.airline}</td>
								<td>${flight.flight}</td>
								<td>${flight.departureCity}</td>
								<td>${flight.arrivalCity}</td>
								<td>${flight.departureDate}</td>
								<td>${flight.arrivalDate}</td>
								<td>${flight.departureTime}</td>
								<td>${flight.arrivalTime}</td>
								<td>${flight.seatType}</td>
								<td>${flight.flightPrice}</td>
								<td>${flight.seatNum}</td>
								<td>${flight.reserve_yn}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</c:when>
		<c:otherwise>
			<div class="b2-h">
				<p>항공편 리스트</p>
			</div>
			<form class="flightList" name="formm">
				<div>
					<input type="button" value="추가"
						onclick="location.href='moveInsertFlight'" /> <input
						type="button" value="수정" onclick="movoUpdateFlight()" /> <input
						type="button" value="삭제" onclick="deleteFlight()" />
				</div>

				<table>
					<thead class="thead">
						<tr>
							<th></th>
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
					<tbody class="tbaody">
						<c:forEach items="${flightList}" var="flight">
							<tr>
								<td><input type="checkbox" name="flight"
									value="${flight.flight}" /></td>
								<td>${flight.airline}</td>
								<td>${flight.flight}</td>
								<td>${flight.departureCity}</td>
								<td>${flight.arrivalCity}</td>
								<td>${flight.departureDate}</td>
								<td>${flight.arrivalDate}</td>
								<td>${flight.departureTime}</td>
								<td>${flight.arrivalTime}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div>
				<a href="#">왼쪽</a>
					<a href="#">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
				<a href="#">오른쪽</a>
				</div>
			</form>
		</c:otherwise>
	</c:choose>
</section>

<%@ include file="../footer.jsp"%>