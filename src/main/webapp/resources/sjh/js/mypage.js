$(function(){ 
	
	init();
	eventRegist();
	if($('#editProfileForm') != null){
		$('#user_nickname').on('change',isValidNickName);
	}
	
	if($('#editInfoForm') != null){
	//	$('#user_nickname').on('change',isValidNickName);
		$('#user_passwd').on('change',isValidPasswd);
		$('#same_user_passwd').on('change',isSamePasswd);
		$('#user_email').on('change',isValidEmail);
		$('#locations').on('change',getLocationInfo);
	}
	
	
	if (document.getElementById('editProfileForm') != null) { //가입화면인 경우
		document.getElementById("editProfileSubmitBtn").onclick = function () {
			editPrifileReady = true;
			//폼 제출
			isValidNickName(); 
			console.log(editPrifileReady);
			if (editPrifileReady == true) {
				console.log('submit editprofile');
				$('#editProfileForm').submit();
			}
		}
	}
	
	if (document.getElementById('editInfoForm') != null) { //가입화면인 경우
		document.getElementById("editInfoSubmitBtn").onclick = function () {
			editInfoReady = true;
			//폼 제출
			getLocationInfo();
			getGenderInfo();
			isValidAge(); 
			isValidEmail(); 
			isSamePasswd(); 
			isValidPasswd(); 
			
			console.log(editInfoReady);
			if (editInfoReady == true) {
				console.log('submit editInfo');
				$('#editInfoForm').submit();
			}
		}
	}

})

function init() {
	$('#viewInfo').css('display','block');
	$('#resign').css('display','none');
	$('#editProfile').css('display','none');
	$('#editInfo').css('display','none');
	$('#editCats').css('display','none');
}

function eventRegist(){
	if($('#viewInfo-m') != null){
		$('#viewInfo-m').on('click',function(){
			$('#editInfo').css('display','none');
			$('#resign').css('display','none');
			$('#editProfile').css('display','none');
			$('#viewInfo').css('display','block');
		})
	}
	if($('#editProfile-m') != null){
		$('#editProfile-m').on('click',function(){
			$('#valid_user_nickname').css('visibility', 'hidden');
			$('#viewInfo').css('display','none');
			$('#resign').css('display','none');
			$('#editInfo').css('display','none');
			$('#editCats').css('display','none');
			$('#editProfile').css('display','block');
		})
	}
	if($('#editCats-m') != null){
		$('#editCats-m').on('click',function(){
		//	alert('카테고리수정');
			$('#viewInfo').css('display','none');
			$('#resign').css('display','none');
			$('#editProfile').css('display','none');
			$('#editInfo').css('display','none');
			$('#editCats').css('display','block');
		})
	}
	if($('#editInfo-m') != null){
		$('#editInfo-m').on('click',function(){
			$('#viewInfo').css('display','none');
			$('#resign').css('display','none');
			$('#editProfile').css('display','none');
			$('#editCats').css('display','none');
			$('#editInfo').css('display','block');
		})
	}
	if($('#resign-m') != null){
		$('#resign-m').on('click',function(){
			$('#editInfo').css('display','none');
			$('#viewInfo').css('display','none');
			$('#editProfile').css('display','none');
			$('#editCats').css('display','none');
			$('#resign').css('display','block');
		})
	}
}


//닉네임 중복
function isValidNickName() {
	const reg = /^\w{2,15}$/;
	var user_nickname = $('#user_nickname').val();

	if (user_nickname.trim().length == 0 || user_nickname == null) {
		$('#valid_user_nickname').html('닉네임을 입력해주세요');
		$('#valid_user_nickname').css('visibility', 'visible');
		editPrifileReady = false && editPrifileReady;
		return;
	}

	if (!reg.test(user_nickname)) { //유효하지 않은 닉네임 
		$('#valid_user_nickname').html('닉네임 형식에 맞지 않습니다');
		$('#valid_user_nickname').css('visibility', 'visible');
		editPrifileReady = false && editPrifileReady;
		return;
	}
	
	$.ajax({
		data: user_nickname,
		type: "get",
		 async: false,
		url: "/salmon/regist/nicknameValidator/"+user_nickname,

		success: function (data) {
			data = data.trim();
			
			if (data === 'newNickname') { //없는 닉네임
				$('#valid_user_nickname').html('사용가능한 닉네임 입니다')
				$('#valid_user_nickname').css('visibility', 'visible');
				editPrifileReady = true && editPrifileReady;
				console.log(editPrifileReady);

			} else if (data === 'usedNickname') { //존재하는 닉네임
				$('#valid_user_nickname').html('이미 사용중인 닉네임 입니다')
				$('#valid_user_nickname').css('visibility', 'visible');
				editPrifileReady = false && editPrifileReady;
				console.log(editPrifileReady);
			}
		},
		error: function () {
			alert('데이터 수신 에러');
		}

	});
	
}

//이메일 중복
function isValidEmail() {
	var user_email = $('#user_email').val();
	if (user_email.trim().length == 0 || user_email == null) {
		$('#valid_user_email').html('이메일을 입력해주세요');
		$('#valid_user_email').css('visibility', 'visible');
		editInfoReady = false && editInfoReady;
		return;
	}
	

	user_email = $('#user_email').serialize();
	console.log(user_email);
	$.ajax({
		data: user_email,
		type: 'get',
		 async: false,
		url: '/salmon/regist/emailValidator/',

		success: function (data) {
			data = data.trim();

			if (data === 'newEmail') { //없는 이메일
				$('#valid_user_email').html('사용가능한 이메일 입니다')
				$('#valid_user_email').css('visibility', 'visible');
				editInfoReady = true && editInfoReady;
				console.log(editInfoReady);

			} else if (data === 'usedEmail') { //존재하는 이메일
				$('#valid_user_email').html('이미 사용중인 이메일 입니다')
				$('#valid_user_email').css('visibility', 'visible');
				editInfoReady = false && editInfoReady;
				console.log(editInfoReady);
			}
		},
		error: function (xhr,status,er) {
			alert('데이터 수신 에러');
			console.log(user_email);
			console.log(xhr);
			console.log(status);
			console.log(er);
		}
	});
}

//비밀번호 유효성 검사
function isValidPasswd() {
	var passwd =  $('#user_passwd').val();

	if (passwd.length > 30) {
		//너무 긴 비밀번호
		$('#valid_user_passwd').html('비밀번호 형식이 맞지 않습니다');
		$('#valid_user_passwd').css('visibility', 'visible');
		editInfoReady = false && editInfoReady;
	} else {
		$('#valid_user_passwd').css('visibility', 'hidden');
		editInfoReady = true && editInfoReady;
	}
}

//비밀번호 일치 검사
function isSamePasswd() {
	//var reg= /^\d{4}$/;
	var passwdCheck = $('#same_user_passwd').val();
	var passwd = $('#user_passwd').val();

	if (passwd.trim().length != 0 || passwd != null) {
		if (passwdCheck.trim().length == 0 || passwdCheck == null) {
			//비밀번호 확인 입력하세요
			$('#same_valid_user_passwd').html('비밀번호를 한번 더 입력해주세요');
			$('#same_valid_user_passwd').css('visibility', 'visible');
			editInfoReady = false && editInfoReady;
		} else {
			$('#same_valid_user_passwd').css('visibility', 'hidden');
			if (passwd != passwdCheck) {
				//비밀번호 불일치
				$('#same_valid_user_passwd').html('비밀번호가 일치하지 않습니다 ');
				$('#same_valid_user_passwd').css('visibility', 'visible');
				editInfoReady = false && editInfoReady;
			} else {
				$('#same_valid_user_passwd').css('visibility', 'hidden');
				editInfoReady = true && editInfoReady;
			}
		}
	}
}