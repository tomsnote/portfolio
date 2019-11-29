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