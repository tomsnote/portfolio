// airReserve.jsp 
function change() {
	const sel = document.getElementById('airlineTicket');
	if (sel.options[sel.selectedIndex].value == "2") {
		var input = "";
		input += "<div class='a-r-b' id='a-r-b'>";
		input += "<h5>언제 도착할까?</h5>";
		input += "<input type='date' id='arrival' name='arrivalDate'/>";
		$("#a-r-m").append(input);
	} else {
		$("#a-r-b").remove();
	}
}

function reserveCheck() {
	if (document.formm.seatType.value == ""  ) {
		alert("좌석등급을 정해주세요.");
		return false;
	} else if (document.formm.departureCity.value  == "" ) {
		alert("출발도시를 선택하세요.");
		return false;
	} else if (document.formm.arrivalCity.value == "") {
		alert("도착도시를 선택하세요.");
		return false;
	} else if (document.formm.depatureDate.value == "YYYY-MM-DD") {
		alert("출발날짜를 선택하세요.");
		return false;
	} else {
		document.formm.action = "airShcedules";
		document.formm.submit();
		return true;
	}
	
}

function city(){
	document.formm.action = "airReserve";
	document.formm.submit();
	
}

function searchSchedules(){
	document.formm.action = "airSchedules";
	document.formm.submit();
	
}



