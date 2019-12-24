<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<!-- Page Heading/Breadcrumbs -->
<section class="mypageTop">
	<h3 class="mt-4 mb-3">
		항공예약&nbsp;<small>항공편</small>
	</h3>
</section>
<hr>

<!-- Page Content -->
<section id="a-r-s">
	<form method="get" action="airSchedules" name="formm"
		onsubmit="return reserveCheck();">
		<div id="a-r-h">
			<div class="a-r-t">
				<h5>항공권</h5>
				<select id="airlineTicket" name="airlineTicket" onchange="change()">
					<option value="1">편도</option>
					<option value="2">왕복</option>
				</select>
			</div>
			<div class="a-r-t">
				<h5>인원</h5>
				<input type="number" name="headCount" />
			</div>
			<div class="a-r-t">
				<h5>좌석등급</h5>
				<select id="seatType" name="seatType">
					<option value="" selected>=========</option>
					<c:forEach items="${distinctSeatTypes}" var="seat">
						<option value="${seat}">${seat}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div id="a-r-m">
			<hr>

			<div class="a-r-b">
				<h5>출발은 어디서?</h5>
				<select size="5" class="a-r-b" id="departureCity"
					name="departureCity" onchange="city()">
					<c:forEach items="${distinctDepartureCities}" var="city">
						<option value="${city}">${city}</option>
					</c:forEach>
				</select>
				<script>
					var cities = document.getElementById("departureCity");
					var index = document.getElementById("departureCity").options;
					for(var i=0; i<cities.length; i++){
						if( index[i].value == '${depart}')
							index[i].setAttribute('selected', 'selected');
					}
				</script>
			</div>
			<div class="a-r-b">
				<h5>어디로 떠날까?</h5>
				<select size="5" class="a-r-b" id="arrivalCity" name="arrivalCity" onchange="city()">
					<c:forEach items="${distinctArrivalCities}" var="city">
						<option value="${city}">${city}</option>
					</c:forEach>
				</select>
				<script>
					var cities = document.getElementById("arrivalCity");
					var index = document.getElementById("arrivalCity").options;
					for(var i=0; i<cities.length; i++){
						if( index[i].value == '${arrival}')
							index[i].setAttribute('selected', 'selected');
					}
				</script>
			</div>
			<div class="a-r-b">
				<h5>비행 가능한 날짜</h5>
				<p><c:forEach items="${possibleDate}" var="date">
				${date}일
				</c:forEach></p>
				
				<h5>언제 떠날까?</h5>
				<input type="date" id="depart" name="departureDate"
					value="2019-11-11" />
			
			</div>
		</div>
		<div align="right" style="margin-right: 20px;">
			<input type="submit" value="검색" />
		</div>
	</form>

</section>
<%@ include file="../footer.jsp"%>