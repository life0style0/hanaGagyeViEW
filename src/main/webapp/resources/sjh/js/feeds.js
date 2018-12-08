var followId;
var choice;
$(function () {

	init();
	eventRegist();

	$('#profileImage').attr('src', showProfileImage($('#profilePath').val()));
	setCommentUserPhoto();

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

	// $('[name="comment-delete-btn"]').each(function (i, btn) {
	// 	$(btn).on('click', function (e) {
	// 		deleteReply(e);
	// 	});
	// });

	$('.be-comment-block').on('click', '[name="comment-delete-btn"]', function (e) {
		deleteReply(e);
	});
}

function setCommentUserPhoto() {
	$('input[name="user-comment-profile-photo"]').each(function (i, input) {
		$($(input).closest('a').find('img')[0]).attr('src', `/salmon/image?fileName=` + showProfileImage($(input).attr('value')));
	})
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
	// eventRegist();
}