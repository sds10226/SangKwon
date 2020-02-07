
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
//________________________________________________________________
function memberUpdateCheckForm(memberChangeInfoForm) 
{
	if(!memberChangeInfoForm.name.value) {
		alert("이름을 입력하십시오.");
		memberChangeInfoForm.name.focus();
		return false;
	}
	if(isNameCheck(memberChangeInfoForm.name.value) == true) {
		alert("이름에는 숫자나 특수문자를 입력할 수 없습니다.");
		memberChangeInfoForm.name.focus();
		return false;
	}
	if(!memberChangeInfoForm.tel.value) {
		alert("전화번호를 입력하십시오.");
		memberChangeInfoForm.tel.focus();
		return false;
	}
	
	if(!isNumberCheck(memberChangeInfoForm.tel.value)) {
		alert("번호만 입력하십시오.");
		memberChangeInfoForm.tel.focus();
		return false;
	}

	
	if(memberChangeInfoForm.password.value) {
		if(isAlphaNumCheck(memberChangeInfoForm.password.value) == false) {
			alert("비밀번호는 숫자와 영문자만 사용 가능합니다.");
			document.memberChangeInfoForm.password.focus();
			return false;
		}
		
		if( (memberChangeInfoForm.password.value.length < 8) || (memberChangeInfoForm.password.value.length > 10) ) {
			alert("\n비밀번호는 8자리에서 10자리 사이를 입력하셔야 합니다.");
			memberChangeInfoForm.password.focus();
			return false;
		}
		
		if(!memberChangeInfoForm.confirmPassword.value) {
			alert("비밀번호확인을 입력하십시오.");
			memberChangeInfoForm.confirmPassword.focus();
			return false;
		}
	}
	
	if(memberChangeInfoForm.confirmPassword.value) {
		if(isAlphaNumCheck(memberChangeInfoForm.confirmPassword.value) == false) {
			alert("비밀번호확인은 숫자와 영문자만 사용 가능합니다.");
			memberChangeInfoForm.confirmPassword.focus();
			return false;
		}
		if( (memberChangeInfoForm.confirmPassword.value.length < 8) || (memberChangeInfoForm.confirmPassword.value.length > 10) ) {
			alert("\n비밀번호확인은 8자리에서 10자리 사이를 입력하셔야 합니다.");
			memberChangeInfoForm.confirmPassword.focus();
			return false;
		}
		
		if( (memberChangeInfoForm.password.value) != (memberChangeInfoForm.confirmPassword.value) ) {
			alert("비밀번호와 비밀번호확인이 틀립니다.\n다시 입력하십시오.");
			memberChangeInfoForm.password.focus();
			return false;
		}
	}
	
	if(!memberChangeInfoForm.email.value){
		alert("이메일을 입력하세요.");
		document.memberChangeInfoForm.email.focus();
		return false;
	}
	
	if(memberChangeInfoForm.emailDuplication.value=="emailUncheck"){
		alert("이메일 중복체크를 해주세요");
		memberChangeInfoForm.email.focus();
		return false;
	}
	
	// 비밀번호를 변경 하지 않았을 때와 변경 했을 때를 분기
	if(memberChangeInfoForm.confirmPassword.value) {
		memberChangeInfoForm.action = "update_memberWithPassword.do";
		memberChangeInfoForm.submit();
	} else if(!memberChangeInfoForm.confirmPassword.value) {
		memberChangeInfoForm.action = "update_member.do";
		memberChangeInfoForm.submit();
	}
		
} // End 
//________________________________________________________
function emailCheck1(){
	if(document.memberChangeInfoForm.email.value==""){
		alert("이메일을 입력하세요.")
		return;
	}
	
	url="confirmEmail2.do";
	window.open(url, "confirm", "toolbar=no, location=no, \
			status=no, menubar=no, scrollbars=no, \
			resizable=no, width=600, height=400");
	
}
//_________________________________________________________
function inputEmailChk1(){
	document.memberChangeInfoForm.emailDuplication.value="emailUncheck"
}