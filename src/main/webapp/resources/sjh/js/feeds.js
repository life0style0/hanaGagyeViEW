var followId;
var choice;
$(function(){ 
	$('#profileImage').attr('src', showProfileImage($('#profilePath').val()));
	
	//checkFollowParam();
	$($('[id^="follow-ask-"]')[0]).on('click',function(){
		checkFollowParam();
		if(choice == 'do'){
			askFollow(followId);
			setFollowToUnfollow(followId);
		}else if(choice == 'undo'){
			askUnfollow(followId);
			setUnfollowToFollow(followId);
		}
	});
	
	$('#myArticles-btn').on('click',function(){
		$('#myArticles').css('display','block');
		$('#likeArticles').css('display','none');
	});
	
	$('#likeArticles-btn').on('click',function(){
		$('#myArticles').css('display','none');
		$('#likeArticles').css('display','block');
	});
	
	$('[id^=reply-form-] input[type=button]').each(function(i,btn){
		$(btn).on('click',function(e){
			writeReply(e);
		});
	});
})

function checkFollowParam(){
	followId= $($('[id^="follow-ask-"]')[0]).attr('id').split('-')[3];
	choice=$($('[id^="follow-ask-"]')[0]).attr('id').split('-')[2];
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
		//	alert(data);
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
	$($('[id^="follow-ask-"]')[0]).html('<i class="fa fa-heart"></i>  UNFOLLOW');
	$($('[id^="follow-ask-"]')[0]).attr('id','follow-ask-undo-'+followId);
}

function setUnfollowToFollow(followId){
	$($('[id^="follow-ask-"]')[0]).html('<i class="far fa-heart"></i>  FOLLOW');
	$($('[id^="follow-ask-"]')[0]).attr('id','follow-ask-do-'+followId);
}


function showProfileImage(path) {
//	alert('프로필사진'+encodeURI(path));
	return encodeURI(path);
}

function writeReply(e) {
	//alert('댓글 달기');
	//console.log(e);

	var content = $(e.target.closest('form')).find('[name="comment_content"]').val();
	console.log(content);
	var articleId = $(e.target.closest('form')).find('[name="article_id"]').val();
	console.log(articleId);
	
	$.ajax({
		data : content,
		type : 'get',
		//async: false,
		url : '/salmon/sns/comment/'+articleId+'/'+content,

		success : function(data) {
			console.log(data);
			removeComments(e.target.closest('form'));
			appendComments(e.target.closest('form'),data);
			//data = data.trim();

		},
		error : function(xhr, status, er) {
			alert('데이터 수신 에러');
			console.log(user_email);
			console.log(xhr);
			console.log(status);
			console.log(er);
		}
	});
}

function removeComments(form){
	//console.log(form);
	$($($(form).closest('.be-comment-block')).find('.be-comment')).remove();
}
function appendComments(form,comments){
	/*
	var commentHTML=`<div class="be-comment-block">
						<h1 class="comments-title">Comments (<c:out value="${myArticle.comments.size()}"/>)</h1>
						<p class="about-comment-block">
						</p>`;
	*/
	var commentHTML;
	$(comments).each(function(i,comment){
		commentHTML += `<div class="be-comment">
									<div class="be-img-comment">	
										<a href="/salmon/sns/feeds?userid=`+comment.user_id+`">
											<img src="`+comment.user_image+`" alt="" class="be-ava-comment">
										</a>
									</div>
									<div class="be-comment-content">
										<span class="be-comment-name">
										<a href="/salmon/sns/feeds?userid=`+comment.user_id+`">
										`+comment.user_nickname+`
										</a>
										</span>
										<span class="be-comment-time">
										<i class="fa fa-clock-o"></i>
										`+comment.comment_regdate+`
										</span>
										<p class="be-comment-text">
										`+comment.comment_content+`
										</p>
									</div>
								</div>`;
	})
	
	var comment=comments[0];
	commentHTML += `<form id="reply-form-`+comment.article_id+`" method="get">
							<input type="hidden" name="article_id" value="`+comment.article_id+`">
							<c:out value="`+comment.user_nickname+`"/>
							<input type="text" name="comment_content" required="required">
							<input type="button" id="reply-write-btn-`+comment.article_id+`" value="등록">
						</form>`;
	$($(form).closest('.be-comment-block')).html(commentHTML);
}