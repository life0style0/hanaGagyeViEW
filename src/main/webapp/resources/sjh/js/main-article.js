var myId;
$(function() {
	myId= $('#loginUserId').text();
	eventRegist();
});

function eventRegist(){
	$('[id^="article-post-"]').each(function(i,post){
		$(post).on('click',function(){
			const articleId = $(this).attr('id').split('-')[2];
			console.log(articleId);
			var article = getArticleInfo(articleId);
		});
	});

	$('#article-like-btn').on('click',function(){
		likesArticle($('#article-id-modal').attr('value'));
		//setLikedArticle();
	});
	
	$('#article-unlike-btn').on('click',function(){
		unlikesArticle($('#article-id-modal').attr('value'));
		//setLikableArticle();
	});
	
	$('#article-report-btn').on('click',function(){
		$('#report-article-modal').modal('show');
		//reportArticle($('#article-id-modal').attr('value'));
	});
	
	$('#article-report-modal-btn').on('click',function(){
		if($('#report_reason').val().length !=0){
			var articleId= $('#article-id-modal').attr('value');
			$('#reoport-article-id-modal').attr('value',articleId);
			reportArticle(articleId);
			//$('#report-article-modal').modal('hide');
		}
	})
	
	$('#report-confirm-exit-btn').on('click',function(){
		$('#report-article-modal').modal('hide');
	})
}

function getArticleInfo(articleId){
	console.log(articleId);
	$.ajax({
		type: 'get',
		dataType: "json",
		url: '/salmon/main/article/'+articleId,
		success: function (data) {
			console.log(data);
			setArticleModal(data);
			setArticle(data); //이미지, 공유버튼 세팅
			$('#article-modal').modal('show');
		},
		error: function (xhr,status,er) {
			alert('데이터 수신 에러');
			console.log(xhr);
			console.log(status);
			console.log(er);
		}
	});
}

function setArticleModal(article){
//	alert('modal open');
	//var article=articlelist.find(article => article.article_id==num);
	
	console.log(article);
	$('#article-id-modal').attr('value',article.article_id);
	$('#article-ctgry-name').html(article.ctgry_name);
	$('#article-title').html(article.article_title);
	$('#article-money').html(article.article_payment_fee);
	$('#article-ctgry').html(article.article_ctgry_description);
	$('#article-content').html(article.article_content);
	$('#article-regdate').html(article.article_regdate);
	$('#article-pay-type').html(article.article_payment_type);
	$('#article-scope').html(article.article_scope);
	$('#article-writer-nickname').html('<a href="/salmon/sns/feeds?userid='+article.user_nickname+'">'+article.user_nickname+'</a>');
	
	
	var commentsHTML= `<div>
						<div name="comment-area">`;
						
	if(article.comments.length > 0){
		$(article.comments).each(function(i,comment){
			console.log(comment);
			commentsHTML +=
			`<div class="be-comment">
			<input type="hidden" name="comment-id" value="`+comment.comment_id+`">
			<input type="hidden" name="article-id" value="`+comment.article_id+`">
					<div>
						<span class="be-comment-name">
							<a href="/salmon/sns/feeds?userid=`+comment.user_id+`">
							`+comment.user_nickname+`
							</a>
						</span>
						<span class="be-comment-time float-right">`;
			if(myId == comment.user_id){
				commentsHTML +=
				`<span name="comment-delete-btn" class="comment-delete-btn">
				<input type="hidden" name="comment-id" value="`+comment.comment_id+`">
					<i class="fas fa-times"></i>삭제 
				</span>`;
			}
			commentsHTML +=		
						`<i class="fa fa-clock-o"></i>`
						+comment.comment_regdate+
						`</span>
						<p class="be-comment-text">`
						+comment.comment_content+
						`</p>
					</div>
				</div>`;
		})
	}
	commentsHTML +=		`</div>
						<form id="reply-form-`+article.article_id+`" method="get">
							<div class="form-group">
								<input type="hidden" name="article_id" value="`+article.article_id+`">
								<c:out value="${me.user_nickname}"/>
								<input type="text" name="comment_content" required="required" class="form-input">
								<input type="button" id="reply-write-btn-`+article.article_id+`" class="btn-sjh pull-right" value="등록">
							</div>
						</form>
					</div>`;
	//console.log(commentsHTML);
	$('#article-modal #article-comments').html(commentsHTML);
	
	console.log(article.likes);
	if(article.likes != null){ //좋아요 있는 글
		if(article.likes.find(function(like){
			return like.user_id==myId;}) != null) {
			//이미 좋아요 한 글
			setLikedArticle(article.likes.length);
		} else{
			//좋아요 안한 글
			setLikableArticle(article.likes.length);
		}
	}else{ //좋아요 없는 글
		//좋아요 안한 글
		setLikableArticle(article.likes.length);
	}
	
	console.log(article.scraps);
	if(article.scraps != null){ //스크랩 있는 글
		if(article.scraps.find(function(scrap){
			return scraps.user_id==myId;}) != null) {
			//이미 스크랩 한 글
			setScrapedArticle(article.likes.length);
		} else{
			//스크랩 안한 글
			setScrapableArticle(article.likes.length);
		}
	}else{ //스크랩 없는 글
		//스크랩 안한 글
		setScrapableArticle(article.likes.length);
	}
	
	
	$('#article-comments-btn').html('<i class="fa fa-comment-o"></i>'+article.comments.length);
}

function setLikedArticle(likesnum){
	$('#article-like-btn').css('display','none');
	$('#article-unlike-btn').css('display','inline');
	$('#article-unlike-btn').html('<i class="fa fa-thumbs-o-up"></i>'+likesnum);
}

function setLikableArticle(likesnum){
	$('#article-unlike-btn').css('display','none');
	$('#article-like-btn').css('display','inline');
	$('#article-like-btn').html('<i class="fa fa-thumbs-o-up"></i>'+likesnum);
}

function setScrapedArticle(scrapsnum){
	$('#article-scrap-btn').css('display','none');
	$('#article-unscrap-btn').css('display','inline');
	$('#article-unscrap-btn').html('<i class="fas fa-bookmark"></i>'+scrapsnum);
}

function setScrapableArticle(scrapsnum){
	$('#article-unscrap-btn').css('display','none');
	$('#article-scrap-btn').css('display','inline');
	$('#article-scrap-btn').html('<i class="far fa-bookmark"></i>'+scrapsnum);
}

/**
 * 게시글 좋아요 요청
 * @param articleId
 * @returns
 */
function likesArticle(articleId){
	console.log(articleId);
	$.ajax({
		data: articleId,
		type: 'get',
		//async: false,
		url: '/salmon/sns/like/'+articleId,

		success: function (data) {
			data = data.trim();
			setLikedArticle(data);

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
function unlikesArticle(articleId){
	console.log(articleId);
	$.ajax({
		data: articleId,
		type: 'get',
		//async: false,
		url: '/salmon/sns/unlike/'+articleId,

		success: function (data) {
			data = data.trim();
			setLikableArticle(data);
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
 * 게시글 스크랩 요청
 * @param articleId
 * @returns
 */
function scrapArticle(articleId){
	console.log(articleId);
	$.ajax({
		data: articleId,
		type: 'get',
		//async: false,
		url: '/salmon/sns/scrap/'+articleId,

		success: function (data) {
			data = data.trim();
			//setLikedArticle(data);
			setScrapedArticle(data);
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
 * 공개 범위를 판단해 값을 리턴하는 함수
 * @param {*} scope 게시글의 공개 범위
 */
function checkScope(scope) {
    if (scope === 'u') {
        return '공개';
    } else if (scope === 'r') {
        return '나만';
    }
    return 'error';
}

/**
 * 공유 버튼에 이벤트를 설정하는 기능
 * info는 설정하지 않아도 됨.
 * @param {*} article json의 형태로 게시글의 정보가 담겨 있는 변수
 * @param {*} info 
 */
function eventRegistOnShare(article, info) {
    $('#article-share-btn a').off('click');
    $('#article-share-btn a').on('click', function (e) {
        article.articleScope = 'u';
        const scopeT = checkScope(article.articleScope);
        if (info) {
            $(info).find('.ggv-scope').html(scopeT);
        }
        $('#article-scope').html(`, ${scopeT}`);
        e.preventDefault();
        const articleId = article.articleId;
        $.ajax({
            url: '/salmon/accountbook/share',
            data: {
                articleId: articleId
            },
            method: 'get',
            success: function (result) {
                if (result === 'success') {
                    $('#article-share-btn').addClass('hidden');
                    $('#article-share-cancel-btn').removeClass('hidden');
                } else {
                }
            }
        });
    });
    $('#article-share-cancel-btn a').off('click');
    $('#article-share-cancel-btn a').on('click', function (e) {
        article.articleScope = 'r';
        const scopeT = checkScope(article.articleScope);
        if (info) {
            $(info).find('.ggv-scope').html(scopeT);
        }
        $('#article-scope').html(`, ${scopeT}`);
        e.preventDefault();
        const articleId = article.articleId;
        $.ajax({
            url: '/salmon/accountbook/sharecancel',
            data: {
                articleId: articleId
            },
            method: 'get',
            success: function (result) {
                if (result === 'success') {
                    $('#article-share-btn').removeClass('hidden');
                    $('#article-share-cancel-btn').addClass('hidden');
                } else {
                }
            }
        });
    });
}

/**
 * 특정 가계부 정보를 클릭시 보여줄 값들을 세팅하는 함수
 * @param {*} article 가계부 정보
 * @param {*} info 가계부 정보
 */
function setArticle(article, info) {
	//이미지, 공유버튼 세팅
	console.log(article.article_id);
	console.log(article.imagePaths);
    if (!article) {
        alert('data가 없습니다.');
    }
    if (article.imagePaths.length === 0) {
        $('#article-modal .modal-dialog').addClass('ggv-no-image');
    } else {
        $('#article-modal .modal-dialog').removeClass('ggv-no-image');
        for (let i = 0; i < article.imagePaths.length; i += 1) {
            const imagePath = article.imagePaths[i];
            $('.article-carousel').append('<img class="article-image center-block owl-lazy" data-src="/salmon/main/image?fileName='+imagePath+'" alt="">');
        }

        $('.article-carousel').owlCarousel({
            items: 1,
            loop: true,
            margin: 10,
            nav: true,
            navText: [
                "<i class='fa fa-angle-left'></i>",
                "<i class='fa fa-angle-right'></i>"
            ],
            dots: false,
            lazyLoad: true
        });
    }

    // 내가 쓴 글인지 확인
    if (true) {
        if (article.articleScope !== undefined) {
            const scope = checkScope(article.articleScope);
            $('#article-scope').html(`, ${scope}`);

            if (scope === '나만') {
                $('#article-share-btn').removeClass('hidden');
                $('#article-share-cancel-btn').addClass('hidden');
                eventRegistOnShare(article, info);
            } else if (scope === '공개') {
                $('#article-share-btn').addClass('hidden');
                $('#article-share-cancel-btn').removeClass('hidden');
                eventRegistOnShare(article, info);
            }
        } else {
            $('#article-share-btn').addClass('hidden');
            $('#article-share-cancel-btn').addClass('hidden');
        }

        // 내가 쓴 글이면 수정이 보여야 함.
        $('#article-edit-btn').removeClass('hidden');
        $('#article-edit-btn a').attr('href', `/salmon/article/edit?article_id=${article.articleId}`);
    } else {
        $('#article-edit-btn').addClass('hidden');
    }

}


function showImage(path) {
//	alert('프로필사진'+encodeURI(path));
	return encodeURI(path);
}
