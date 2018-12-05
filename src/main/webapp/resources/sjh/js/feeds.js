$(function(){ 
	
	var followId= $($('[id^="follow-ask-"]')[0]).attr('id').split('-')[3];
	var choice=$($('[id^="follow-ask-"]')[0]).attr('id').split('-')[2];
	$($('[id^="follow-ask-"]')[0]).on('click',function(){
	//	alert(followId);
		//alert(choice);
		if(choice == 'do'){
			askFollow(followId);
			setFollowToUnfollow(followId);
		}else if(choice == 'undo'){
			askUnfollow(followId);
			setUnfollowToFollow(followId);
		}
	});
})

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
			console.log(user_email);
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
			data = data.trim();
			alert(data);
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

function setFollowToUnfollow(followId){
	$($('[id^="follow-ask-"]')[0]).text('UNFOLLOW');
	$($('[id^="follow-ask-"]')[0]).attr('id','follow-ask-undo-'+followId);
}

function setUnfollowToFollow(followId){
	$($('[id^="follow-ask-"]')[0]).text('FOLLOW');
	$($('[id^="follow-ask-"]')[0]).attr('id','follow-ask-do-'+followId);
}