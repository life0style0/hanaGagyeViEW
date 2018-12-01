$(function(){ 
	registReady = true;
	categoryNum = 0;
	init();

	if($('#registForm') != null){
		$('#user_id').on('change',isValidId);
		$('#user_passwd').on('change',isValidPasswd);
		$('#same_user_passwd').on('change',isSamePasswd);
		$('#user_nickname').on('change',isValidNickName);
		$('#user_email').on('change',isValidEmail);
		
		$('#locations').on('change',getLocationInfo);
	}
	
	if (document.getElementById('registForm') != null) { //가입화면인 경우
		
		document.getElementById("registSubmitBtn").onclick = function () {
			registReady = true;
			//폼 제출
			getLocationInfo();
			getGenderInfo();
			isValidAge(); 
			console.log($('input[name="user_birthday"]'));
			
			isValidId(); 
		//	console.log(registReady);
			isValidEmail(); 
		//	console.log(registReady);
			isSamePasswd(); 
		//	console.log(registReady);
			isValidPasswd(); 
		//	console.log(registReady);
			isValidNickName(); 
		//	console.log(registReady);
			isValidCategory();
			
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
		initCategories();
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
	$('#user_birthday').removeAttr('value');
	var age = $('#user_input-birthday').val();
	age= age.split('/');
	
	// 04/11/2018
	var year=$(age)[2].substring(2,4);
	var mon= age[1];
	var day= age[0];
	
	age=year+mon+day;
	console.log(age);
	
	$('#valid_user_birthday').css('visibility', 'hidden');
	$('#user_birthday').attr('value',age);
	
	if($('input[name="user_birthday"]').attr('value').length== 0){
	//	alert('birthday error');
		registReady = false && registReady;
	}else{
	//	alert($('input[name="user_birthday"]').attr('value')+'!');
		registReady = true && registReady;
	}
}

//카테고리 선택 이벤트
function initCategories(){
	if( $('[name="category"]')!= null ){
		$('#CTGRY_1').removeAttr('value');
		$('#CTGRY_2').removeAttr('value');
		$('#CTGRY_3').removeAttr('value');
		
		var cats= $('[name="category"]');
		cats.each(function(i,cat){
			
			$(cat).on('click',function(e){
				//alert('category'+i);
				var selectedVal=$(cat).find('div').attr('value');
				if($(cat).hasClass('unselected')){
					//선택
					
					if(categoryNum ==0){
						clickCategory(cat);
						$('#CTGRY_1').attr('value',selectedVal);
					}else if(categoryNum==1){
						clickCategory(cat);
						$('#CTGRY_2').attr('value',selectedVal);
					}else if(categoryNum==2){
						clickCategory(cat);
						$('#CTGRY_3').attr('value',selectedVal);
					}else{
						//4개 이상 선택 불가
						//categoryNum이 3일때부터 가만히있기
					}
					
				} else if($(cat).hasClass('selected')){
					//선택해제
					
					if(categoryNum ==1){
						unclickCategory(cat);
						$('#CTGRY_1').removeAttr('value');
						$('#CTGRY_1').attr('value',-1);
						//다 뺴면 categoryNum = 0 됨
					}else if(categoryNum==2){
						unclickCategory(cat);
						$('#CTGRY_2').removeAttr('value');
						$('#CTGRY_2').attr('value',-1);
					}else if(categoryNum==3){
						unclickCategory(cat);
						$('#CTGRY_3').removeAttr('value');
						$('#CTGRY_3').attr('value',-1);
					}else{
						
					}
				}
				
				//console.log(categoryNum);
				
			});
		});
	}
}

function clickCategory(cat){
	$(cat).removeClass('unselected');
	$(cat).addClass('selected');
	$(cat).css('color','red');
	categoryNum++;
}

function unclickCategory(cat){
	$(cat).removeClass('selected');
	$(cat).addClass('unselected');
	$(cat).css('color','black');
	categoryNum--;
}

//카테고리 유효성
function isValidCategory(){
	if( $('[name="category"]')!= null ){
		if(categoryNum <1){
			registReady = false && registReady;
			return;
		} else{
			registReady = true && registReady;
		}
	
	}
}

function getLocationInfo(){
	var userLocation=$('#locations option:selected').val();
	$('#location_id').attr('value',userLocation);
	console.log($('#location_id').attr('value'));
}


function getGenderInfo(){
	console.log($('#select2-genders-container').attr('title'));
	
	var userGender=$('#select2-genders-container').attr('title');
	if(userGender == 'Male'){
		$('input#user_gender').attr('value','M');
	} else if (userGender == 'Female'){
		$('input#user_gender').attr('value','F');
	}
	
	console.log($('input#user_gender').attr('value'));
}
