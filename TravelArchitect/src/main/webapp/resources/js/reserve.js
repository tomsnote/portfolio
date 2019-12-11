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

function reserve(){
	if(document.formm.passport.value==""){
		alert("여권번호를 입력해주세요.")
		document.formm.passport.focus();
		return false;reserveBirth
	} else if(document.formm.reserveBirth.value==""){
		alert("생일을 입력해주세요.")
		document.formm.reserveBirth.focus();
		return false;
	} else if(document.formm.passengerBirth.value==""){
		alert("생일을 입력해주세요.")
		document.formm.passengerBirth.focus();
		return false;
	} else{
		alert("예약이 완료되었습니다.");
		document.formm.action="reserve";
		document.formm.submit();
		return true;
	}
	
	
}

function deleteReserve(){
	var checkbox = document.getElementsByName('cseq');
	var count = true;
	for ( var i=0; i < checkbox.length; i++) {
		if (checkbox[i].checked) {
			count=false;
		}
	}
	
	if(count)
		alert('삭제할 항목을 선택해 주세요.');
	else {
		document.formm.action = "deleteReserve"
		document.formm.submit();
	}
}
function moveUpdateReserve(){
	var cnt = $("input:checkbox[name=cseq]:checked").length;
	
	if(cnt>1)
		alert('수정할 항목을 1개 선택하셔야 합니다.');
	else if(cnt==0)
		alert('수정할 항목을 선택해 주세요');
	else{
		document.formm.action = "checkReserve"
		document.formm.submit();
	}
}

function updateReserve(){
	if(document.formm.passport.value==""){
		alert("여권번호를 입력해주세요.")
		document.formm.passport.focus();
		return false;reserveBirth
	} else if(document.formm.reserveBirth.value==""){
		alert("생일을 입력해주세요.")
		document.formm.reserveBirth.focus();
		return false;
	} else if(document.formm.passengerBirth.value==""){
		alert("생일을 입력해주세요.")
		document.formm.passengerBirth.focus();
		return false;
	} else{
		alert("수정이 완료되었습니다.");
		document.formm.action="updateReserve";
		document.formm.submit();
		return true;
	}
}
function findReserve(){
	var url = "findReserve";
	window.open(url,"_blank_1",	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=400, height=400, top=300, left=300 ")
}
function callReserve(){
	var name = document.formm.flightReserveName.value;
	opener.location.href="callReserve?flightReserveName="+name;
	self.close();
}
