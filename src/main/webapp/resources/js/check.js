	//----------------------------------------------------------------
// 아이디 중복 확인
//----------------------------------------------------------------
function confirmId()
{
	if(document.memberRegisterForm.id.value == "") {
		alert("아이디를 입력하십시오.");
		return;
	}
	
	url = "confirmId.do";
	
	window.open(url, "confirm", "toolbar=no, location=no, \
			status=no, menubar=no, scrollbars=no, \
			resizable=no, width=600, height=400");
	
	
} // End - function confirmId()
//______________________________________________________________

//아이디 중복확인 인증버튼 확인 여부

function inputIdChk(){
	document.memberRegisterForm.idDuplication.value="idUncheck";
} 

//_____________________________________________________________
//이메일 중복확인
function emailCheck(){
	if(document.memberRegisterForm.email.value==""){
		alert("이메일을 입력하세요.")
		return;
	}
	
	url="confirmEmail.do";
	window.open(url, "confirm", "toolbar=no, location=no, \
			status=no, menubar=no, scrollbars=no, \
			resizable=no, width=600, height=400");
	
}

//_____________________________________________________________
//이메일 중복확인 인증버튼 확인 여부
function inputEmailChk(){
	document.memberRegisterForm.emailDuplication.value="emailUncheck"
}


//----------------------------------------------------------------
//숫자 검사
function isNumberCheck(inputVal)
{
	var var_normalize = /[^0-9]/gi;	//정규식
	if(var_normalize.test(inputVal) == true) return false;
	else return true;
}

//----------------------------------------------------------------
//최상위 체크 로직(chars로 넘긴 값이 있다면 false)
//----------------------------------------------------------------
function containsChars(input, chars)
{
	for(var inx = 0; inx < input.length; inx++) {
		if(chars.indexOf(input.charAt(inx)) != -1)
			return true;
	}
	return false;
}
//----------------------------------------------------------------
//최상위 체크 로직(chars로 넘긴 값이 있다면 false)
//----------------------------------------------------------------
function containsCharsOnly(input, chars)
{
	for(var inx = 0; inx < input.length; inx++) {
		if(chars.indexOf(input.charAt(inx)) == -1) 
			return false;
	}
	return true;
}
//----------------------------------------------------------------
// 숫자 체크
//----------------------------------------------------------------
function isNum(input) {
	var chars = "0123456789";
	return containsCharsOnly(input, chars);
}
//----------------------------------------------------------------
// 영숫자 체크
//----------------------------------------------------------------
function isAlphaNumCheck(input) {
	var chars = "abcdefghijklmnopqrstuvwxyzABCEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	return containsCharsOnly(input, chars);
}
//----------------------------------------------------------------
// 이름 체크
//----------------------------------------------------------------
function isNameCheck(input) {
	var chars = "0123456789~!@#$%^&*()_-+=|{}[],./?";
	return containsCharsOnly(input, chars);
}
//----------------------------------------------------------------
//회원등록 검사
//----------------------------------------------------------------
function memberInsertCheckForm(memberRegisterForm) {
	if(!memberRegisterForm.name.value) {
		alert("이름을 입력하십시오.");
		memberRegisterForm.name.focus();
		return false;
	}
	if(isNameCheck(memberRegisterForm.name.value) == true) {
		alert("이름에는 숫자나 특수문자를 입력할 수 없습니다.");
		document.memberRegisterForm.name.focus();
		return false;
	}
	if(!memberRegisterForm.tel.value) {
		alert("전화번호를 입력하십시오.");
		memberRegisterForm.tel.focus();
		return false;
	}
	
	if(!isNumberCheck(memberRegisterForm.tel.value)) {
		alert("번호만 입력하십시오.");
		memberRegisterForm.tel.focus();
		return false;
	}
	if(!memberRegisterForm.id.value) {
		alert("아이디를 입력하십시오.");
		document.memberRegisterForm.id.focus();
		return;
	}
	if(isAlphaNumCheck(memberRegisterForm.id.value) == false) {
		alert("아이디는 숫자와 영문자만 사용 가능합니다.");
		document.memberRegisterForm.id.focus();
		return;
	}
	if( (memberRegisterForm.id.value.length < 8) || (memberRegisterForm.id.value.length > 15) ) {
		alert("아이디는 8자리에서 15자리 사이를 입력하셔야 합니다.");
		memberRegisterForm.id.focus();
		return false;
	}
	if(memberRegisterForm.idDuplication.value !="idCheck"){
		alert("아이디 중복체크를 해주세요");
		return false;
	}
	
	if(!memberRegisterForm.password.value) {
		alert("비밀번호를 입력하십시오.");
		document.memberRegisterForm.passwordd.focus();
		return;
	}
	if(isAlphaNumCheck(memberRegisterForm.password.value) == false) {
		alert("비밀번호는 숫자와 영문자만 사용 가능합니다.");
		document.memberRegisterForm.password.focus();
		return;
	}
	if( (memberRegisterForm.password.value.length < 8) || (memberRegisterForm.password.value.length > 10) ) {
		alert("\n비밀번호는 8자리에서 10자리 사이를 입력하셔야 합니다.");
		memberRegisterForm.password.focus();
		return false;
	}

	if(!memberRegisterForm.confirmPassword.value) {
		alert("비밀번호확인을 입력하십시오.");
		document.memberRegisterForm.confirmPassword.focus();
		return;
	}
	if(isAlphaNumCheck(memberRegisterForm.confirmPassword.value) == false) {
		alert("비밀번호확인은 숫자와 영문자만 사용 가능합니다.");
		document.memberRegisterForm.confirmPassword.focus();
		return;
	}
	if( (memberRegisterForm.confirmPassword.value.length < 8) || (memberRegisterForm.confirmPassword.value.length > 10) ) {
		alert("\n비밀번호확인은 8자리에서 10자리 사이를 입력하셔야 합니다.");
		memberRegisterForm.confirmPassword.focus();
		return false;
	}
	
	if( (memberRegisterForm.password.value) != (memberRegisterForm.confirmPassword.value) ) {
		alert("비밀번호와 비밀번호확인이 틀립니다.\n다시 입력하십시오.");
		memberRegisterForm.password.focus();
		return false;
	}
	
	if(!memberRegisterForm.email.value){
		alert("이메일을 입력하세요.");
		document.memberRegistrationForm.email.focus();
		return false;
	}
	if(memberRegisterForm.emailDuplication.value=="emailUncheck"){
		alert("이메일 중복체크를 해주세요");
		document.memberRegistrationForm.email.focus();
		return false;
	}
	
	memberRegisterForm.action = "memberRegisterForm.do";
	memberRegisterForm.submit();
	
} // End - function memberInsertCheckForm(memInsForm)

//----------------------------------------------------------------
// 회원정보 수정/탈퇴
//----------------------------------------------------------------


function loginCheck(loginForm){
	
	if(document.loginForm.id.value== null || document.loginForm.id.value=="" ){
		alert("아이디를 입력하십시오.");
		document.loginForm.id.focus();
		return false;
	}
	if( (loginForm.id.value.length < 8) || (loginForm.id.value.length > 15) ) {
		alert("아이디는 8자리에서 15자리 사이를 입력하셔야 합니다.");
		loginForm.id.focus();
		return false;
	}
	
	 if(document.loginForm.password.value== null ||document.loginForm.password.value=="" ){
		alert("비밀번호를 입력하십시오.");
		document.loginForm.password.focus();
	    return false;
	}
	 if( (loginForm.password.value.length < 8) || (loginForm.password.value.length > 10) ) {
			alert("\n비밀번호는 8자리에서 10자리 사이를 입력하셔야 합니다.");
			loginForm.password.focus();
			return false;
		}

	document.loginForm.action="login_check.do";
	document.loginForm.submit();

}

