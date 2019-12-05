<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Travel Architect</title>

<!-- Bootstrap core CSS -->
<link href="bootstrap/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<section class="mypageBody2">
		<div class="b2-h">
			<p>항공 예약 리스트</p>
		</div>
		<form name="formm" class="reserveList" method="get">
			<div>
				<input type="button" value="확인 및 변경" onclick="moveUpdateReserve()"/>
				<input type="button" value="예약취소" onclick="deleteReserve()" />
			</div>
			<table>
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="7%">
					<col width="8%">
					<col width="10%">
					<col width="5%">
					<col width="17%">
					<col width="10%">
					<col width="10%">
					<col width="18%">
				</colgroup>

				<thead class="thead">
					<tr>
						<th>선택</th>
						<th>여권번호</th>
						<th>국문이름</th>
						<th>영문이름</th>
						<th>생일</th>
						<th>성별</th>
						<th>전화번호</th>
						<th>예약일</th>
						<th>좌석번호</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody class="tbody">
					<c:forEach items="${reserveList}" var="reserve">
						<tr class="trAir">
							<td><input type="checkbox" name="cseq"
								value="${reserve.flightReserveCode}"></td>
							<td>${reserve.passport}</td>
							<td>${reserve.passenger}</td>
							<td>${reserve.lname_en} ${reserve.fname_en}</td>
							<td>${reserve.passengerBirth}</td>
							<td>${reserve.gender}</td>
							<td>${reserve.phone}</td>
							<td>${reserve.flightReserveDate}</td>
							<td>${reserve.seatNum}</td>
							<td>${reserve.flightComment}
							<input type="hidden" name="reserve_yn" value="Y"/></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<!-- 게시판 1,2,3, 페이지-->
				</tfoot>
			</table>
		</form>
	</section>
</body>

</html>
