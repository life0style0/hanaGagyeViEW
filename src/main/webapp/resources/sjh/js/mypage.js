$(function(){ 
	
	init();
	eventRegist();
	if($('#editProfileForm') != null){
		$('#user_nickname').on('change',isValidNickName);
		
	}
	
	
	if (document.getElementById('editProfileForm') != null) { //가입화면인 경우
		
		document.getElementById("editProfileSubmitBtn").onclick = function () {
			registReady = true;
			//폼 제출
		
			isValidNickName(); 
			
			console.log(registReady);
			if (registReady == true) {
				console.log('submit editprofile');
				$('#editProfileForm').submit();
			}
		}
	}

})

function init() {
	$('#viewInfo').css('display','block');
	$('#resign').css('display','none');
	$('#editProfile').css('display','none');
	$('#editInfo').css('display','none');
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
			$('#editProfile').css('display','block');
		})
	}
	if($('#editInfo-m') != null){
		$('#editInfo-m').on('click',function(){
			$('#viewInfo').css('display','none');
			$('#resign').css('display','none');
			$('#editProfile').css('display','none');
			$('#editInfo').css('display','block');
		})
	}
	if($('#resign-m') != null){
		$('#resign-m').on('click',function(){
			$('#editInfo').css('display','none');
			$('#viewInfo').css('display','none');
			$('#editProfile').css('display','none');
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