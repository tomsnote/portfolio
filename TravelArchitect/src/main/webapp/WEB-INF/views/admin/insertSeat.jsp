<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<c:if test="${!empty seat}">
	<c:set value="${seat.flight}" var="flightName"/>
</c:if>
<c:if test="${seatCheck== true }">
	<script>alert("좌석 등록이 되어있습니다.");</script>
</c:if>
<script>
	$(document).ready(function(){
		$("select[name=seatType]").val('${seat.seatType}').prop("selected", true);
	})
</script>
<!-- Page Heading/Breadcrumbs -->
<section class="mypageTop">
	<h3 class="mt-4 mb-3">
		항공권 관리&nbsp;<small>좌석 정보 추가</small>
	</h3>
</section>
<hr>
<!-- Page Content -->
<section class="f-m-s">
	<div class="f-m-d" id="f-m-d">
		<div class="b2-h">
			<p>항공 스케쥴 선택</p>
		</div>
		<form class="flightList">
			<table>
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
						<th>추가</th>
					</tr>
				</thead>
				<tbody class="tbaody">
					<c:forEach items="${flightList}" var="flight">
						<tr>
							<td>${flight.airline}</td>
							<td>${flight.flight}</td>
							<td>${flight.departureCity}</td>
							<td>${flight.arrivalCity}</td>
							<td>${flight.departureDate}</td>
							<td>${flight.arrivalDate}</td>
							<td>${flight.departureTime}</td>
							<td>${flight.arrivalTime}</td>
							<td><div class="tri">
									<div
										onclick="location.href='moveInsertSeat?flight='+'${flight.flight}'"></div>
								</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
	<div class="f-m-d">
		<div class="b2-h">
			<p>좌석 정보 입력</p>
		</div>

		<form class="flightList" name="formm" method="get">
			<div>
				<c:choose>
					<c:when test="${empty seat}">
						<input type="submit" value="좌석추가" onclick="return insertSeat()" />
					</c:when>
					<c:otherwise>
						<input type="submit" value="수정하기" onclick="return updateSeat()" />
					</c:otherwise>
				</c:choose>
			</div>
			<table id="addSeat">
				<thead class="thead">
					<tr>
						<th>항공편</th>
						<th>좌석타입</th>
						<th>가격</th>
						<th>좌석번호</th>
					</tr>
				</thead>
				<tbody id="selectFlight">
					<tr>
						<td><input type="text" name="flight" value="${flightName}" readonly/></td>
						<td><select name="seatType">
								<option value="일반석">일반석</option>
								<option value="프리미엄 일반석">프리미엄 일반석</option>
								<option value="비즈니스석">비즈니스석</option>
								<option value="일등석">일등석</option>
						</select></td>
						<td><input type="number" name="flightPrice" value="${seat.flightPrice}"/></td>
						<td>
							<c:choose>
								<c:when test="${empty seat}">
									<input type="text" name="seatNum" value="${seat.seatNum}"/>
								</c:when>
								<c:otherwise>
									<input type="text" name="seatNum" value="${seat.seatNum}" readonly/>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</section>

<%@ include file="../footer.jsp"%>