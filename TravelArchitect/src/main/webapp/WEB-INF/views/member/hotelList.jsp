<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="mypageBody2">
	<div class="b2-h">
			<p>호텔 예약 리스트</p>
	</div>
	<form name="formm" class="reserveList">
		<div>
			<input type="submit" value="수정"/>
			<input type="button" value="예약취소"/>
		</div>
		<table>
		<colgroup>
			<col width="1%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="4%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="15%">
		</colgroup>
		
			<thead class="thead">
				<tr><th></th>
				<th>예약코드</th><th>여권번호</th><th>국문이름</th><th>영문이름</th><th>생일</th>
				<th>성별</th><th>전화번호</th><th>예약일</th><th>좌석번호</th><th>내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${flightLIst}" var="reserve">
					<tr>
						<td><input type="checkbox"></td>
						<td>${reserve.flightReserveCode }</td>
						<td>${reserve.passport }</td>
						<td>${loginUser.fname_ko}${loginUser.lname_ko}</td>
						<td>${loginUser.fname_en}&nbsp;${loginUser.lname_en}</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>${reserve.seatNum }</td>
						<td>${reserve.flightComment }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<!-- 게시판 1,2,3, 페이지-->
			</tfoot>
		</table>
	</form>
</section>