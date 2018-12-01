$(function(){ 
	
	init();
	eventRegist();
	categoryNum = 0;
	
	if($('#editProfileForm') != null){
		$('#user_nickname').on('change',isValidNickName);
	}
	
	if($('#editInfoForm') != null){
	//	$('#user_nickname').on('change',isValidNickName);
		$('#user_passwd').on('change',isValidPasswd);
		$('#same_user_passwd').on('change',isSamePasswd);
		$('#user_email').on('change',isValidEmail);
	//	$('#locations').on('change',getLocationInfo);
	}
	
	
	if (document.getElementById('editProfileForm') != null) { //프로필 변경 화면
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
	
	if (document.getElementById('editInfoForm') != null) { //개인정보 변경 화면 경우
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
	
	if (document.getElementById('editCategoriesForm') != null) { //카테고리 변경 경우
		document.getElementById("editCategoriesSubmitBtn").onclick = function () {
			categoryReady = true;
			//폼 제출
			isValidCategory();
			console.log(categoryReady);
			if (categoryReady == true) {
				console.log('submit edit categories');
				$('#editCategoriesForm').submit();
			}
		}
	}

})

function init() {
	$('#valid_user_passwd').css('visibility', 'hidden');
	$('#same_valid_user_passwd').css('visibility', 'hidden');
	$('#valid_user_email').css('visibility', 'hidden');
	$('#valid_user_birthday').css('visibility', 'hidden');
	
	initCategories();
	
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
			$('#editCats').css('display','none');
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
	console.log('이메일 검사 시작');
	var user_email = $('#user_email').val();
	if (user_email.trim().length == 0 || user_email == null) {
		$('#valid_user_email').html('이메일을 입력해주세요');
		$('#valid_user_email').css('visibility', 'visible');
		editInfoReady = false && editInfoReady;
		return;
	}
	
	var user_id= $('#editInfoForm #user_id').val();
	user_email = $('#user_email').serialize();
	console.log(user_email);
	$.ajax({
		data: user_email,
		type: 'get',
		 async: false,
		url: '/salmon/main/mypage/emailValidator/'+user_id+'/',

		success: function (data) {
			data = data.trim();

			if (data === 'newEmail') { //없는 이메일
				$('#valid_user_email').html('사용가능한 이메일 입니다');
				$('#valid_user_email').css('visibility', 'visible');
				editInfoReady = true && editInfoReady;
				console.log(editInfoReady);

			} else if (data === 'myEmail'){ //기존 내 이메일
				$('#valid_user_email').css('visibility', 'hidden');
				editInfoReady = true && editInfoReady;
				console.log(editInfoReady);
				
			} else if (data === 'usedEmail') { //존재하는 이메일
				$('#valid_user_email').html('이미 사용중인 이메일 입니다');
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


//나이 유효성 
function isValidAge() {
	var reg = /^\d{6}$/;
	var age = $('#user_birthday').val();
	if (!reg.test(age)) {
		//유효하지 않은 나이
		$('#valid_user_birthday').html('생년월일 여섯자리를 입력하세요');
		$('#valid_user_birthday').css('visibility','visible');
		
		editInfoReady = false && editInfoReady;
	} else {
		$('#valid_user_birthday').css('visibility','hidden');
		document.getElementById('valid_user_birthday').style.display = 'none';
		editInfoReady = true && editInfoReady;
	}
}

function getLocationInfo(){
	if($('#locations option:selected').is('[disabled]')){
	//	alert('hi');
		editInfoReady = false && editInfoReady;
		return;
	} 
	var userLocation=$('#locations option:selected').val();
	$('#location_id').attr('value',userLocation);
	console.log($('#location_id').attr('value'));
}


function getGenderInfo(){
	if($('#genders option:selected').is('[disabled]')){
	//	alert('hi');
		editInfoReady = false && editInfoReady;
		return;
	} 
	var userGender=$('#genders option:selected').val();
	$('#user_gender').attr('value',userGender);
	console.log($('#user_gender').attr('value'));

}


//카테고리 선택 이벤트
function initCategories(){
	if( $('[name="category"]')!= null ){
		$('#CTGRY_1').removeAttr('value');
		$('#CTGRY_2').removeAttr('value');
		$('#CTGRY_3').removeAttr('value');
		
		var cats= $('[name="category"]');
		cats.each(function(i,cat){
		//	unclickCategory(cat);	
			
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
			categoryReady = false && categoryReady;
			return;
		} else{
			categoryReady = true && categoryReady;
		}
	
	}
}
