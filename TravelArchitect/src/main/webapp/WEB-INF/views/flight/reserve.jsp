<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- Page Heading/Breadcrumbs -->
<section class="mypageTop">
	<h3 class="mt-4 mb-3">
		항공예약&nbsp;<small>추가정보</small>
	</h3>
</section>
<hr>

<!-- Page Content -->
<section id="a-r-s">
	<form method="get" name="formm" >
	<input type="hidden" name="flight" value="${flight.flight}" /> 
	<input type="hidden" name="seatNum" value="${flight.seatNum}" />
	<input type="hidden" name="flightReserveCode" value="${flight.flightReserveCode}"/>
		<div class="a-r-t-h">
			<p style="position: relative; left: 45%">예약자 정보</p>
		</div>
		<table class="r-table">
			<colgroup>
				<col width="10%">
				<col width="30%">
				<col width="10%">
				<col width="30%">
			</colgroup>
			<tr>
				<td>예약자 명</td>
				<td><input type="text" name="flightReserveName"
					value="${loginMember.fname_ko}${loginMember.lname_ko}" /></td>
				<td>생년월일</td>
				<td><input type="date" name="reserveBirth" value="${loginMember.birth}" /></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="tel" name="flightPhone" value="${loginMember.phone}"/></td>
				<td>이메일</td>
				<td><input type="text" name="flightEmail" value="${loginMember.email}" /></td>
			</tr>
		</table>
		<div style="text-align: right; margin: 20px 40px;">
			탑승자가 위의 예약자와 동일인물입니까? <input type="checkbox" id="check">
		</div>
		<script>
			var check = true;
			$("#check").click(function() {
				if (check) {
					$("input[name=passenger]").val($("input[name=flightReserveName]").val());
					$("input[name=passengerBirth]").val($("input[name=reserveBirth]").val());
					$("input[name=phone]").val($("input[name=flightPhone]").val());
					check = false;
					} else {
						$("input[name=passenger]").val('');
						$("input[name=passengerBirth]").val('');
						$("input[name=phone]").val('');
					check = true;
					}

			})
		</script>

		<div class="a-r-t-h">
			<p style="position: relative; left: 45%">탑승객 정보</p>
		</div>
		<table class="r-table">
			<colgroup>
				<col width="15%">
				<col width="10%">
				<col width="20%">
				<col width="10%">
				<col width="10%">
				<col width="5%">
				<col width="20%">
			</colgroup>
			<tr>
				<th>여권번호</th>
				<th>국문이름</th>
				<th>영문이름</th>
				<th>영문 성</th>
				<th>법적생년월일</th>
				<th>성별</th>
				<th>연락처</th>
			</tr>
			<tr>
				<td><input type="text" name="passport" value="${loginMember.passport}${flight.passport}" /></td>
				<td><input type="text" name="passenger" value="${flight.passenger}"/></td>
				<td><input type="text" name="lname_en" value="${loginMember.lname_en}${flight.lname_en}"/></td>
				<td><input type="text" name="fname_en" value="${loginMember.fname_en}${flight.fname_en}"/></td>
				<td><input type="Date" name="passengerBirth" value="${flight.passengerBirth}" /></td>
				<td><select name="gender">
						<option value="M">남자
						<option value="W">여자
				</select></td>
				<td><input type="tel" name="phone" value="${flight.phone}"/></td>
			</tr>
			<tr>
				<th>기타의견</th>
			</tr>
			<tr>
				<td colspan='7'><textarea name="flightComment"></textarea></td>
			</tr>

		</table>
		<script>
			$(document).ready(function(){
				$("textarea[name=flightComment]").val('${flight.flightComment}');				
			})
		</script>
		<div class="a-r-t-h">
			<p style="position: relative; left: 45%">항공 스케쥴 확인</p>
		</div>

		<table class="r-table">

			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="20%">
				<col width="10%">
				<col width="20%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>항공사</th>
				<th>항공편</th>
				<th>출발도시</th>
				<th>출발시간</th>
				<th>도착도시</th>
				<th>도착시간</th>
				<th>좌석등급</th>
				<th>좌석번호</th>
			</tr>
			<tr>
				<td>${flight.airline}</td>
				<td>${flight.flight}</td>
				<td>${flight.departureCity}</td>
				<td>${flight.departureDate}&nbsp;${flight.departureTime}</td>
				<td>${flight.arrivalCity}</td>
				<td>${flight.arrivalDate}&nbsp;${flight.arrivalTime}</td>
				<td>${flight.seatType}</td>
				<td>${flight.seatNum}</td>
			</tr>
		</table>
		
		<hr>
		<div align="center">총 예약 금액 : ${flight.flightPrice}</div>
		<hr>
		<div class="a-r-button">
			<c:choose>
				<c:when test="${empty flight.flightReserveCode}">
					<input type="submit" value="예약" onclick="return reserve()" />
				</c:when>
				<c:otherwise>
					<input type="submit" value="수정" onclick="return updateReserve()" />
				</c:otherwise>
			</c:choose> 
			<input type="reset" value="취소" />
		</div>
	</form>

</section>
<%@ include file="../footer.jsp"%>