// 추가
function insertFlight() {
	if (document.formm.airline.value == ""  ) {
		alert("항공사를 정해주세요.");
		document.formm.airline.focus();
		return false;
	} else if (document.formm.flight.value  == "" ) {
		alert("항공편을 입력해주세요.");
		document.formm.flight.focus();
		return false;
	} else if (document.formm.departureCity.value == "") {
		alert("출발도시를 입력해주세요.");
		document.formm.departureCity.focus();
		return false;
	} else if (document.formm.arrivalCity.value  == "" ) {
		alert("도착도시를 입력해주세요.");
		document.formm.arrivalCity.focus();
		return false;
	} else if (document.formm.departureDate.value == "") {
		alert("출발날짜를 입력해주세요.");
		document.formm.departureDate.focus();
		return false;
	} else if (document.formm.arrivalDate.value == "") {
		alert("도착날짜를 입력해주세요.");
		document.formm.arrivalDate.focus();
		return false;
	} else if (document.formm.departureTime.value  == "" ) {
		alert("출발시간을 입력해주세요.");
		document.formm.departureTime.focus();
		return false;
	} else if (document.formm.arrivalTime.value == "") {
		alert("도착시간을 입력해주세요.");
		document.formm.arrivalTime.focus();
		return false;
	}  else {
		document.formm.action="insertFlight";
		document.formm.submit();
		return true;
	}
}
function insertSeat() {
	if (document.formm.flight.value == ""  ) {
		alert("항공편을 선택해주세요.");
		return false;
	} else if (document.formm.seatType.value == ""  ) {
		alert("좌석타입을 정해주세요.");
		document.formm.seatType.focus();
		return false;
	} else if (document.formm.flightPrice.value  == "" ) {
		alert("가격을 입력해주세요.");
		document.formm.flightPrice.focus();
		return false;
	} else if (document.formm.seatNum.value == "") {
		alert("좌석번호를 입력해주세요.");
		document.formm.seatNum.focus();
		return false;
	} else {
		document.formm.action="insertSeat";
		document.formm.submit();
		return true;
	}
}


// 삭제
function deleteSeat(){
	var checkbox = document.getElementsByName('seatNum');
	var count = true;
	for ( var i=0; i < checkbox.length; i++) {
		if (checkbox[i].checked) {
			count=false;
		}
	}
	if(count)
		alert('삭제할 항목을 선택해 주세요.');
	else {
		document.formm.action = "deleteSeat";
		document.formm.submit();
	}
}
function deleteFlight(){
	var checkbox = document.getElementsByName('flight');
	var count = true;
	for ( var i=0; i < checkbox.length; i++) {
		if (checkbox[i].checked) {
			count=false;
		}
	}
	if(count)
		alert('삭제할 항목을 선택해 주세요.');
	else {
		document.formm.action = "deleteFlight";
		document.formm.submit();
	}
}

// 업데이트
function movoUpdateSeat(){
	var checkbox = document.getElementsByName('seatNum');
	var count = true;
	for ( var i=0; i < checkbox.length; i++) {
		if (checkbox[i].checked) {
			count=false;
		}
	}
	if(count)
		alert('수정할 항목을 선택해 주세요.');
	else {
		document.formm.action = "moveUpdateSeat";
		document.formm.submit();
	}
}
function updateSeat(){
	if (document.formm.seatType.value == ""  ) {
		alert("좌석타입을 정해주세요.");
		document.formm.seatType.focus();
		return false;
	} else if (document.formm.flightPrice.value  == "" ) {
		alert("가격을 입력해주세요.");
		document.formm.flightPrice.focus();
		return false;
	} else if (document.formm.seatNum.value == "") {
		alert("좌석번호를 입력해주세요.");
		document.formm.seatNum.focus();
		return false;
	} else {
		document.formm.action="updateSeat";
		document.formm.submit();
		return true;
	}
}
