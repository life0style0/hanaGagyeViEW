var followId;
var choice;
$(function(){ 
	
	init();
	searchEventRegist();
	setUserPhoto();
})

function init(){
	
	$('#search-res-user').css('display','none');
	$('#search-res-article').css('display','block');
	$('#search-res-group').css('display','none');
}

function searchEventRegist(){
	console.log('event regist');
	
	$('#search-res-user-btn').on('click',function(){
		$('#search-res-user').css('display','block');
		$('#search-res-article').css('display','none');
		$('#search-res-group').css('display','none');
	});
	
	$('#search-res-article-btn').on('click',function(){
		$('#search-res-user').css('display','none');
		$('#search-res-article').css('display','block');
		$('#search-res-group').css('display','none');
	});
	
	$('#search-res-group-btn').on('click',function(){
		$('#search-res-user').css('display','none');
		$('#search-res-article').css('display','none');
		$('#search-res-group').css('display','block');
	});
	
	console.log($('[id^="follow-ask-"]'));
	$('[id^="follow-ask-"]').on('click',function(e){
			console.log(e);
			
			checkFollowParam(e);
			console.log(followId);
			console.log(choice);
			if(choice == 'do'){
				askFollow(followId);
				setFollowToUnfollow(e,followId);
			}else if(choice == 'undo'){
				askUnfollow(followId);
				setUnfollowToFollow(e,followId);
			}
	});
	
	$('.article-menu').on('click',function(){
		if($(this).hasClass('active')){
			$(this).removeClass('active');
		}else{
			$('.article-menu').each(function(i,menu){
				$(menu).removeClass('active');
			});
			$(this).addClass('active');
		}
	})
}

function checkFollowParam(e){
	followId= $(e.target).attr('id').split('-')[3];
	choice=$(e.target).attr('id').split('-')[2];
}

function showProfileImage(path) {
	return encodeURI(path);
}

function setUserPhoto(){
	$('input[name="user-photo-path"]').each(function(i,input){
		$(input).closest('a').find('img').attr('src',`/salmon/image?fileName=`+showProfileImage($(input).attr('value')));
	});
	$('input[name="user-profile-photo"]').each(function(i,input){ 
		var imgpath= $(input).val();
		$(input).closest('div').find('img').attr('src',`/salmon/image?fileName=` +showProfileImage(imgpath));
	}) ;
}




function askFollow(followTo){
	alert('follow '+followTo);
	$.ajax({
		data: followTo,
		type: 'get',
		//async: false,
		url: '/salmon/sns/follow/'+followTo,

		success: function (data) {
			data = data.trim();

		},
		error: function (xhr,status,er) {
			alert('데이터 수신 에러');
			console.log(xhr);
			console.log(status);
			console.log(er);
		}
	});
}


function askUnfollow(followId){
	alert('unfollow '+followId);
	$.ajax({
		data: followId,
		type: 'get',
		//async: false,
		url: '/salmon/sns/unfollow/'+followId,

		success: function (data) {
			
		},
		error: function (xhr,status,er) {
			alert('데이터 수신 에러');
			console.log(xhr);
			console.log(status);
			console.log(er);
		}
	});
}

function setFollowToUnfollow(e,followId){
	$(e.target).html('<i class="fa fa-heart"></i>  UNFOLLOW');
	$(e.target).attr('id','follow-ask-undo-'+followId);
}

function setUnfollowToFollow(e,followId){
	$(e.target).html('<i class="far fa-heart"></i>  FOLLOW');
	$(e.target).attr('id','follow-ask-do-'+followId);
}

