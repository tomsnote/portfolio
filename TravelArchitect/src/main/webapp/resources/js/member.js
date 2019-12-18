function go_save(page) {
	if (page=="join" && document.formm.id.value == ""  ) {
		alert("아이디를 입력해주세요.");
		document.formm.id.focus();
	} else if (page=="join" && document.formm.id.value != document.formm.reid.value ) {
		alert("중복 체크 확인해주세요.");
		document.formm.id.focus();
	} else if (document.formm.pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		document.formm.pwd.focus();
	} else if ((document.formm.pwd.value != document.formm.pwdCheck.value)) {
		alert("비밀번호를 확인해주세요.");
		document.formm.pwd.focus();
	} else if (document.formm.birth.value == "") {
		alert("생일을 입력해주세요.");
		document.formm.birth.focus();
	} else if (document.formm.fname_ko.value == "") {
		alert("성(한글)을 입력해주세요");
		document.formm.fname_ko.focus();
	} else if (document.formm.fname_ko.value == "") {
		alert("이름(한글)을 입력해주세요");
		document.formm.lname_ko.focus();
	} else if (document.formm.fname_en.value == "") {
		alert("성(영어)을 입력해주세요");
		document.formm.fname_en.focus();
	} else if (document.formm.lname_en.value == "") {
		alert("이름(영어)을 입력해주세요");
		document.formm.fname_en.focus();
	} else if (document.formm.nationality.value == "") {
		alert("국적을 입력해주세요");
		document.formm.nationality.focus();
	} else if (document.formm.email.value == "") {
		alert("이메일을 입력해주세요.");
		document.formm.email.focus();
	} else if (page=="join"){
		document.formm.action = "join";
		document.formm.submit();
	} else if(page=="update"){
		document.formm.action = "updateUser";
		document.formm.submit();
	}
	
}

function idCheck() {
	if (document.formm.id.value == "") {
		alert('아이디를 입력해주세요.');
		document.formm.id.focus();
		return;
	}
	var url = "idCheckForm?id=" + document.formm.id.value;
	window.open(url, "_blank_1","toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=370, height=200");
}

function postZip() {
	var url = "findZipNum";
	window.open(url,"_blank_1",	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=400, height=300, top=300, left=300 ");
}
function findId() {
	var url = "findIdForm";
	window.open(url,"_blank_1",	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=400, height=400, top=300, left=300 ")
}
function findPassword() {
	var url = "findPasswordForm";
	window.open(url,"_blank_1",	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=400, height=400, top=300, left=300 ")
}

// Q&A
function check_qa() {
	if (document.sentMessage.title.value == ""  ) {
		alert("제목을 입력해주세요.");
		document.sentMessage.title.focus();
		return false;
	} else if (document.sentMessage.name.value == ""  ) {
		alert("이름을 입력해주세요.");
		document.sentMessage.name.focus();
		return false;
	} else if (document.sentMessage.phone.value == "" ) {
		alert("전화번호를 입력해주세요.");
		document.sentMessage.phone.focus();
		return false;
	} else if (document.sentMessage.email.value == "") {
		alert("이메일을 입력해주세요.");
		document.sentMessage.email.focus();
		return false;
	} else if (document.sentMessage.context.value =="") {
		alert("내용을 확인해주세요.");
		document.sentMessage.context.focus();
		return false;
	} else {
		alert("메세지를 보냈습니다.")
		document.sentMessage.action = "sentMessage";
		document.sentMessage.submit();
		return true;
	}
}
function responseQA() {
	if (document.responseMessage.title.value == ""  ) {
		alert("제목을 입력해주세요.");
		document.responseMessage.title.focus();
		return false;
	} else if (document.responseMessage.email.value == "") {
		alert("이메일을 입력해주세요.");
		document.responseMessage.email.focus();
		return false;
	} else if (document.responseMessage.context.value =="") {
		alert("내용을 확인해주세요.");
		document.responseMessage.context.focus();
		return false;
	} else {
		alert("메세지를 보냈습니다.")
		document.responseMessage.action = "responseMessage";
		document.responseMessage.submit();
		return true;
	}
}