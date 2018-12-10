var followId;
var choice;
var myId;
$(function () {
	myId= $('#loginUserId').text();

	init();
	eventRegist();

	$('#profileImage').attr('src', showProfileImage($('#profilePath').val()));
	setCommentUserPhoto();
	hideAllComments();

})

function init() {
	$('#myArticles').css('display', 'block');
	$('#likeArticles').css('display', 'none');
}

function eventRegist() {
	$($('[id^="follow-ask-"]')[0]).on('click', function () {
		checkFollowParam();
		if (choice == 'do') {
			askFollow(followId);
			setFollowToUnfollow(followId);
		} else if (choice == 'undo') {
			askUnfollow(followId);
			setUnfollowToFollow(followId);
		}
	});

	$('#myArticles-btn').on('click', function () {
		$('#myArticles').css('display', 'block');
		$('#likeArticles').css('display', 'none');
	});

	$('#likeArticles-btn').on('click', function () {
		$('#myArticles').css('display', 'none');
		$('#likeArticles').css('display', 'block');
	});

	$('[id^=reply-form-] input[type=button]').each(function (i, btn) {
		$(btn).on('click', function (e) {
			writeReply(e);
		});
	});

	$('.be-comment-block').on('click', '[name="comment-delete-btn"]', function (e) {
		deleteReply(e);
	});

	$('[name="fold-comments-btn"]').on('click',function(e){
		console.log(e);
	
		console.log(this);
		if($(this).attr('value') == 'folded'){
			$($(e.target).closest('div')).siblings('div[name="comments-block"]').fadeIn();
			$(this).css('margin-bottom','0px');
			$(this).attr('value','opened');
		}else if($(this).attr('value') == 'opened'){
			$($(e.target).closest('div')).siblings('div[name="comments-block"]').fadeOut(()=>{
				$(this).css('margin-bottom','20px');
				$(this).attr('value','folded');
			});
				
		}
	
	});
	
	$('[name="article-like-btn"]').on('click',function(e){
		console.log($(e.target).closest('div').find('input[name="article_id"]').val());
		var article_id= $(e.target).closest('div').find('input[name="article_id"]').val();
		likesArticle(e,article_id);
	});
	
	$('[name="article-unlike-btn"]').on('click',function(e){
		var article_id= $(e.target).closest('div').find('input[name="article_id"]').val();
		unlikesArticle(e,article_id);
	});
	
	
	$('[name="article-report-btn"]').on('click',function(e){
		var articleId= $(e.target).closest('div').find('[name="article_id"]').val();
		$('#reoport-article-id-modal').attr('value',articleId);
		$('#report-article-modal').modal('show');
	});
	
	$('#article-report-modal-btn').on('click',function(){
		if($('#report_reason').val().length !=0){
			//var articleId= $('#article-id-modal').attr('value');
			//$('#reoport-article-id-modal').attr('value',articleId);
			reportArticle($('#reoport-article-id-modal').val());
			//$('#report-article-modal').modal('hide');
		}
	})
	
	$('#report-confirm-exit-btn').on('click',function(){
		$('#report-article-modal').modal('hide');
	})
	
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

function setCommentUserPhoto() {
	$('input[name="user-comment-profile-photo"]').each(function (i, input) {
		$($(input).closest('a').find('img')[0]).attr('src', `/salmon/image?fileName=` + showProfileImage($(input).attr('value')));
	})
}

function hideAllComments(){
	$('[name="comments-block"]').css('display','none');
	$('[name="fold-comments-btn"]').css('display','block');
	$('[name="fold-comments-btn"]').css('margin-bottom','20px');
}

function checkFollowParam() {
	followId = $($('[id^="follow-ask-"]')[0]).attr('id').split('-')[3];
	choice = $($('[id^="follow-ask-"]')[0]).attr('id').split('-')[2];
}

function askFollow(followTo) {
	alert('follow ' + followTo);
	$.ajax({
		data: followTo,
		type: 'get',
		//async: false,
		url: '/salmon/sns/follow/' + followTo,

		success: function (data) {
			data = data.trim();

		},
		error: function (xhr, status, er) {
			alert('데이터 수신 에러');
			console.log(xhr);
			console.log(status);
			console.log(er);
		}
	});
}


function askUnfollow(followId) {
	alert('unfollow ' + followId);
	$.ajax({
		data: followId,
		type: 'get',
		//async: false,
		url: '/salmon/sns/unfollow/' + followId,

		success: function (data) {

		},
		error: function (xhr, status, er) {
			alert('데이터 수신 에러');
			console.log(xhr);
			console.log(status);
			console.log(er);
		}
	});
}

function setFollowToUnfollow(followId) {
	$($('[id^="follow-ask-"]')[0]).html('<i class="fa fa-heart"></i>  UNFOLLOW');
	$($('[id^="follow-ask-"]')[0]).attr('id', 'follow-ask-undo-' + followId);
}

function setUnfollowToFollow(followId) {
	$($('[id^="follow-ask-"]')[0]).html('<i class="far fa-heart"></i>  FOLLOW');
	$($('[id^="follow-ask-"]')[0]).attr('id', 'follow-ask-do-' + followId);
}


function showProfileImage(path) {
	//	alert('프로필사진'+encodeURI(path));
	return encodeURI(path);
}

function writeReply(e) {

	var content = $(e.target.closest('form')).find('[name="comment_content"]').val();
	var articleId = $(e.target.closest('form')).find('[name="article_id"]').val();
	console.log(articleId);
	console.log($(e.target));
	var lastCommentId = $(e.target.closest('form')).closest('div.be-comment-block').find('div[name="comment-area"]').find('input[name="comment-id"]').last().attr('value');
	if (lastCommentId == null) {
		lastCommentId = 0;
	}
	console.log('마지막 댓글 번호 : ' + lastCommentId);;
	const sendData = {
		content: content,
		articleId: articleId,
		lastCommentId: lastCommentId,
		_csrf: $('input[name="_csrf"]').val()
	};

	$.ajax({
		data: sendData,
		type: 'post',
		async: false,
		url: '/salmon/sns/comment',
		success: function (data) {
			console.log(data);
			appendComments(e.target.closest('form'), data);
			console.log('게시글: ' + articleId);
			var span = 'span#comment-num-' + articleId;
			setCommentNum($(span), $(data).length);
			//setCommentNum(e.target,$(data).length);
			initCommentForm(e.target.closest('form'));
		},
		error: function (xhr, status, er) {
			alert('데이터 수신 에러');
			console.log(xhr);
			console.log(status);
			console.log(er);
		}
	});
}

function deleteReply(e) {

	console.log(e);

	var commentId = $(e.target.closest('div.be-comment')).find('[name="comment-id"]').val();
	var articleId = $(e.target.closest('div.be-comment')).find('[name="article-id"]').val();
	console.log(commentId);
	console.log('게시글 번호 : ' + articleId);

	$.ajax({
		data: commentId,
		type: 'get',
		//async: false,
		url: '/salmon/sns/deletecomment/' + commentId,

		success: function (data) {
			console.log(data);
			setDeleteComment(e);
			console.log($(e.target).closest('.be-comment-block'));
			//	console.log($(e.target).closest('.be-comment-block').find('span[name="comment-num"]'));
			console.log($('span#comment-num-' + articleId));
			setCommentNum($('span#comment-num-' + articleId), -1);
		},
		error: function (xhr, status, er) {
			alert('데이터 수신 에러');
			console.log(xhr);
			console.log(status);
			console.log(er);
		}
	});
}

function setCommentNum(span, num) {
	console.log(num);
	console.log(span);
	var currentNum = $(span).text();
	console.log(currentNum);
	if (Number(num) < 0) {
		$(span).html(Number(currentNum) - 1);
	} else {
		$(span).html(Number(currentNum) + Number(num));
	}

}

function initCommentForm(form) {
	$(form).find('input[type="text"]').val('');
}

function setDeleteComment(e) {
	$(e.target).parents('.be-comment').remove();
}

function appendComments(form, comments) {

	var commentHTML = '';
	$(comments).each(function (i, comment) {
		console.log(comment);
		var commentUserImg = showProfileImage(comment.user_image);

		commentHTML +=
					`<div class="be-comment">
							<input type="hidden" name="comment-id" value="` + comment.comment_id + `">
									<div class="be-img-comment">	
										<a href="/salmon/sns/feeds?userid=` + comment.user_id + `">
										<input type="hidden" name="user-comment-profile-photo" value="${comment.user_image}">
										<input type="hidden" name="article-id" value="` + comment.article_id + `">
										<img src="/salmon/image?fileName=` + commentUserImg + `" alt="" class="be-ava-comment">
										</a>
									</div>
									<div class="be-comment-content">
										<span class="be-comment-name">
										<a href="/salmon/sns/feeds?userid=` + comment.user_id + `">
										` + comment.user_nickname + `
										</a>
										</span>
										<span class="be-comment-time">`;

		if (me.user_id == comment.user_id) { //내가쓴 댓글인 경우 삭제 표시 
			commentHTML +=
				`<span name="comment-delete-btn" class="comment-delete-btn">
										<input type="hidden" name="comment-id" value="` + comment.comment_id + `">
											<i class="fas fa-times"></i>삭제 
										</span>`;
		}

		commentHTML += `<i class="fa fa-clock-o"></i>
										` + comment.comment_regdate + `
										</span>
										<p class="be-comment-text">
										` + comment.comment_content + `
										</p>
									</div>
								</div>`;

	})

	$(form).siblings('div[name="comment-area"]').append(commentHTML);
//	eventRegist();
	/*
	$('[name="comment-delete-btn"]').each(function(i,btn){
		$(btn).off('click','**');
		$(btn).on('click',function(e){
			deleteReply(e);
		});
	});
	*/
}


/**
 * 게시글 좋아요 요청
 * @param articleId
 * @returns
 */
function likesArticle(e,articleId){
	console.log(articleId);
	$.ajax({
		data: articleId,
		type: 'get',
		//async: false,
		url: '/salmon/sns/like/'+articleId,

		success: function (data) {
			data = data.trim();
			setLikedArticle(e,data);

		},
		error: function (xhr,status,er) {
			alert('데이터 수신 에러');
			console.log(xhr);
			console.log(status);
			console.log(er);
		}
	});
}

/**
 * 게시글 좋아요 취소 요청
 * @param articleId
 * @returns
 */
function unlikesArticle(e,articleId){
	console.log(articleId);
	$.ajax({
		data: articleId,
		type: 'get',
		//async: false,
		url: '/salmon/sns/unlike/'+articleId,

		success: function (data) {
			data = data.trim();
			setLikableArticle(e,data);
		},
		error: function (xhr,status,er) {
			alert('데이터 수신 에러');
			console.log(xhr);
			console.log(status);
			console.log(er);
		}
	});
}

function setLikedArticle(e,likesnum){
	$(e.target).closest('div').find('span[name="article-like-btn"]').addClass('hidden');
	$(e.target).closest('div').find('span[name="article-unlike-btn"]').removeClass('hidden');
	$(e.target).closest('div').find('span[name="article-unlike-btn"]').html('<i class="fas fa-thumbs-up"></i>'+likesnum);
}

function setLikableArticle(e,likesnum){
	$(e.target).closest('div').find('span[name="article-unlike-btn"]').addClass('hidden');
	$(e.target).closest('div').find('span[name="article-like-btn"]').removeClass('hidden');
	$(e.target).closest('div').find('span[name="article-like-btn"]').html('<i class="far fa-thumbs-up"></i>'+likesnum);
}


/**
 * 게시글 신고 요청
 * @param articleId
 * @returns
 */
function reportArticle(articleId){
	console.log(articleId);
	var reportReason= $('#report_reason').val();
	var article_id= $('#reoport-article-id-modal').attr('value');
	
	$.ajax({
		data: {
			user_id: myId,
			article_id: articleId,
			report_reason: $('#report_reason').val(),
		    _csrf: $('input[name="_csrf"]').val()
		},
		type: 'post',
		//async: false,
		url: '/salmon/main/article/report/',

		success: function (data) {
			data = data.trim();
			//alert('게시글 신고 완료');
			$('#report-article-modal').modal('hide');
			
			if(data=='success'){
				$('#report-article-confirm-modal #report-result').html('신고가 완료되었습니다');
			}else if(data=='already'){
				$('#report-article-confirm-modal #report-result').html('이미 신고한 게시글입니다');
			}else{
				$('#report-article-confirm-modal #report-result').html('신고 실패했습니다');
			}
			$('#report-article-confirm-modal').modal('show');
			
			
			$('[name="article_id"]').each(function(i,val){
				if($(this).val() == article_id){
				//	$(this).closest('[name="post"]').css('background-color','aqua'); 
					$(this).closest('[name="post"]').find('[name="article-report-btn"]').addClass('hidden');
					$(this).closest('[name="post"]').find('[name="article-report-complete-btn"]').removeClass('hidden');
				} 
			})

		},
		error: function (xhr,status,er) {
			alert('데이터 수신 에러');
			console.log(xhr);
			console.log(status);
			console.log(er);
		}
	});
}
