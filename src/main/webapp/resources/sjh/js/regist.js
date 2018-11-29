$(function(){ 
	registReady = true;
	init();

	if($('#registForm') != null){
		$('#user_id').on('change',isValidId);
		$('#user_passwd').on('change',isValidPasswd);
		$('#same_user_passwd').on('change',isSamePasswd);
		$('#user_nickname').on('change',isValidNickName);
		$('#user_email').on('change',isValidEmail);
		$('#user_birthday').on('change',isValidAge);
	}
	
	if (document.getElementById('registForm') != null) { //가입화면인 경우
		
		document.getElementById("registSubmitBtn").onclick = function () {
			registReady = true;
			//폼 제출
			isValidId(); 
			console.log(registReady);
			isValidEmail(); 
			console.log(registReady);
			isSamePasswd(); 
			console.log(registReady);
			isValidPasswd(); 
			console.log(registReady);
			isValidNickName(); 
			console.log(registReady);
			isValidAge(); 
			console.log(registReady);

			console.log(registReady);
			if (registReady == true) {
				console.log('submit regist');
				$('#registForm').submit();
			}
		}
	}

})

function init() {
	
	if($('#registForm') != null){
		$('#valid_user_id').css('visibility', 'hidden');
		$('#valid_user_passwd').css('visibility', 'hidden');
		$('#same_valid_user_passwd').css('visibility', 'hidden');
		$('#valid_user_nickname').css('visibility', 'hidden');
		$('#valid_user_email').css('visibility', 'hidden');
		$('#valid_user_birthday').css('visibility', 'hidden');
	}

}

//아이디 중복
function isValidId() {
	
	const reg = /^\w{3,15}$/;
	var user_id = $('#user_id').val();

	if (user_id.trim().length == 0 || user_id == null) {
		$('#valid_user_id').html('아이디를 입력해주세요');
		$('#valid_user_id').css('visibility', 'visible');
		registReady = false && registReady;
		return;
	}

	if (!reg.test(user_id)) { //유효하지 않은 아이디 
		$('#valid_user_id').html('아이디 형식에 맞지 않습니다');
		$('#valid_user_id').css('visibility', 'visible');
		registReady = false && registReady;
		return;
	}
	
	$.ajax({
		data: user_id,
		type: "get",
		 async: false,
		url: "/salmon/regist/idValidator/"+user_id,

		success: function (data) {
			data = data.trim();
			
			if (data === 'newId') { //없는 아이디
				$('#valid_user_id').html('사용가능한 아이디 입니다')
				$('#valid_user_id').css('visibility', 'visible');
				registReady = true && registReady;
				console.log(registReady);

			} else if (data === 'usedId') { //존재하는 아이디
				$('#valid_user_id').html('이미 사용중인 아이디 입니다')
				$('#valid_user_id').css('visibility', 'visible');
				registReady = false && registReady;
				console.log(registReady);
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
		registReady = false && registReady;
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
				registReady = true && registReady;
				console.log(registReady);

			} else if (data === 'usedEmail') { //존재하는 이메일
				$('#valid_user_email').html('이미 사용중인 이메일 입니다')
				$('#valid_user_email').css('visibility', 'visible');
				registReady = false && registReady;
				console.log(registReady);
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

//닉네임 중복
function isValidNickName() {
	const reg = /^\w{2,15}$/;
	var user_nickname = $('#user_nickname').val();

	if (user_nickname.trim().length == 0 || user_nickname == null) {
		$('#valid_user_nickname').html('닉네임을 입력해주세요');
		$('#valid_user_nickname').css('visibility', 'visible');
		registReady = false && registReady;
		return;
	}

	if (!reg.test(user_nickname)) { //유효하지 않은 닉네임 
		$('#valid_user_nickname').html('닉네임 형식에 맞지 않습니다');
		$('#valid_user_nickname').css('visibility', 'visible');
		registReady = false && registReady;
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
				registReady = true && registReady;
				console.log(registReady);

			} else if (data === 'usedNickname') { //존재하는 닉네임
				$('#valid_user_nickname').html('이미 사용중인 닉네임 입니다')
				$('#valid_user_nickname').css('visibility', 'visible');
				registReady = false && registReady;
				console.log(registReady);
			}
		},
		error: function () {
			alert('데이터 수신 에러');
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
		registReady = false && registReady;
	} else {
		$('#valid_user_passwd').css('visibility', 'hidden');
		registReady = true && registReady;
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
			registReady = false && registReady;
		} else {
			$('#same_valid_user_passwd').css('visibility', 'hidden');
			if (passwd != passwdCheck) {
				//비밀번호 불일치
				$('#same_valid_user_passwd').html('비밀번호가 일치하지 않습니다 ');
				$('#same_valid_user_passwd').css('visibility', 'visible');
				registReady = false && registReady;
			} else {
				$('#same_valid_user_passwd').css('visibility', 'hidden');
				registReady = true && registReady;
			}
		}
	}
}

//이름 유효성
function isValidName() {
	var regK = /^[가-힣]{2,5}$/;
	var regE = /^[a-zA-Z]{2,20}$/;

	var name = $('#user_nickname').val();
	if ((regK.test(name) == false) && (regE.test(name) == false)) {
		//유효하지 않은 이름
		$('#valid_user_nickname').html('이름 형식에 맞지 않습니다 ');
		$('#valid_user_nickname').css('visibility', 'visible');
		registReady = false && registReady;
	} else {
		$('#valid_user_nickname').css('visibility', 'hidden');
		registReady = true && registReady;
	}
}

//나이 유효성 
function isValidAge() {
	var reg = /^\d{6}$/;
	var age = $('#user_birthday').val();
	if (!reg.test(age)) {
		//유효하지 않은 나이
		$('#valid_user_birthday').html('나이 형식에 맞지 않습니다 ');
		$('#valid_user_birthday').css('visibility', 'visible');
		registReady = false && registReady;
	} else {
		$('#valid_user_birthday').css('visibility', 'hidden');
		registReady = true && registReady;
	}
}
