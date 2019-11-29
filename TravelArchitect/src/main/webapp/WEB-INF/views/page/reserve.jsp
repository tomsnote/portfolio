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
	<form method="get" name="formm">
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
				<td><input type="text" name="fRserveName" /></td>
				<td>생년원일</td>
				<td><input type="text" name="fBirth" /></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="ph" /></td>
				<td>이메일</td>
				<td><input type="text" name="email" /></td>
			</tr>
		</table>

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
				<th>한글이름</th>
				<th>영문이름</th>
				<th>영문 성</th>
				<th>법적생년월일</th>
				<th>성별</th>
				<th>연락처</th>
			</tr>
			<tr>
				<td><input type="text" name="passport" /></td>
				<td><input type="text" name="name_ko" /></td>
				<td><input type="text" name="lname_en" /></td>
				<td><input type="text" name="fname_en" /></td>
				<td><input type="text" name="birth" /></td>
				<td><select name="gender">
						<option value="M">남자
						<option value="W">여자
				</select></td>
				<td><input type="text" name="passport" /></td>
			</tr>
			<tr>
				<th>기타의견</th>
			</tr>
			<tr>
				<td colspan='7'><textarea name="fComment"></textarea></td>
			</tr>

		</table>
		<div class="a-r-t-h">
			<p style="position: relative; left: 45%">항공 스케쥴 확인</p>
		</div>

		<table class="r-table">
			<tr>
				<th>항공사</th><th>항공편</th><th>출발도시</th>
				<th>출발시간</th><th>도착도시</th><th>도착시간</th>
				<th>좌석등급</th>
			</tr>
			<tr>
				<c:forEach items="${flights}" var="air">
					<td>${air.airline}</td>
					<td>${air.flight}</td>
					<td>${air.departureCity}</td>
					<td>${air.departureDate}+${air.departureTime}</td>
					<td>${air.arrivalCity}</td>
					<td>${air.arrivalDate}+${air.arrivalTime}</td>
					<td>${air.seatType}</td>
				</c:forEach>
			</tr>
			
		</table>
		<hr>
		<div align="center">
			총 예약 금액 : ${flight.flightPrice}
		</div>
		<hr>
		<div class="a-r-button">
		<input type="submit" value="예약"/>
		<input type="reset" value="취소"/>
		</div>
	</form>

</section>
<%@ include file="../footer.jsp"%>