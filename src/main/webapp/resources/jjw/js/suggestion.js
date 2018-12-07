function setSuggestions(page, pageType, event) {
    event.preventDefault();
    const paginationData = $(`#pagination-${pageType}-data`);
    const keyword = paginationData.find('.keyword').val();
    const type = paginationData.find('.type').val();
    const pageNum = $(page).data('page');
    let pageData;
    if (keyword && type) {
        pageData = {
            pageNum: pageNum,
            keyword: keyword,
            type: type
        };
    } else {
        pageData = {
            pageNum: pageNum
        };
    }
    let pageBuilder = null;

    $.ajax({
        async: false,
        url: `/salmon/suggestion/${pageType}`,
        data: pageData,
        method: 'get',
        dataType: 'json',
        success: function (data) {
            const suggestionDatas = data[0];
            pageBuilder = data[1];
            for (let i = 1; i <= suggestionDatas.length; i += 1) {
                const suggestion = suggestionDatas[i - 1];
                const sgt = $(`#sgt-${pageType}-${i}`).removeClass('hidden');
                sgt.find(`.sgt-title`).text((suggestion.articleTitle === undefined) ? '' : suggestion.articleTitle);
                sgt.find(`.sgt-userNickname`).text(suggestion.userNickname);
                sgt.find(`.sgt-like`).text(suggestion.likeCnt);
                sgt.find(`.sgt-comment`).text(suggestion.commentCnt);
                sgt.find(`.sgt-date`).text(`기간 : ${suggestion.articleRegdate} ~ ${suggestion.articleEnddate}`);
                sgt.find(`.sgt-articleId`).val(suggestion.articleId);
            }
            for (let i = suggestionDatas.length + 1; i <= 10; i += 1) {
                $(`#sgt-${pageType}-${i}`).addClass('hidden');
            }
        }
    });
    return pageBuilder;
}

function appendCommentJjw(comment) {
    let html = `<div class="be-comment">
    <input type="hidden" name="comment-id" value="${comment.comment_id}">
    <input type="hidden" name="article-id" value="${comment.article_id}">
    <div class="be-img-comment">
        <a href="">
            <input type="hidden" class="imagePath" value="/salmon/image?fileName=${comment.user_image}">
            <img src="" alt="" class="be-ava-comment image-src thumbnail-comment">
        </a>
    </div>
    <div class="be-comment-content">
        <span class="be-comment-name">
            <a href="">${comment.user_nickname}</a>
        </span>
        <span class="be-comment-time">
                <span name="comment-delete-btn" class="comment-delete-btn">
                    <i class="fas fa-times"></i>삭제
                </span>
            <i class="fa fa-clock-o"></i>
            ${comment.comment_regdate}
        </span>
        <p class="be-comment-text">
            ${comment.comment_content}
        </p>
    </div>
</div>`;
    return html;
}

function writeReplyJjw(form) {
    $.ajax({
        data: $(form).serialize(),
        type: 'post',
        async: false,
        url: `/salmon/sns/comment`,
        success: function (data) {
            data.forEach(function (comment) {
                $(form).before(appendCommentJjw(comment));
            });
            $('.comment-count').html(Number($('.comment-count').html()) + data.length);
            $(form).find('textarea[name="content"]').val('');
        },
        error: function (xhr, status, er) {
            alert('데이터 수신 에러');
            console.log(xhr);
            console.log(status);
            console.log(er);
        }
    });
}

$(function () {
    $('.sgt-new-paging').on('click', '.paginate-new', function (event) {
        const pageBuilder = setSuggestions(this, 'new', event);
        console.log('pageBuilder :', pageBuilder);
        if ($(this).hasClass('previous') || $(this).hasClass('next')) {
            let liH = '';
            if (pageBuilder.isPrevPrev) {
                liH += `<li class="paginate-new previous" data-page="${pageBuilder.startPageNum - 1}">Prev</li>`;
            }
            for (let i = pageBuilder.startPageNum; i <= pageBuilder.lastPageNum; i += 1) {
                liH += `<li class="paginate-new" data-page="${i}">${i}</li>`;
            }
            if (pageBuilder.isNextNext) {
                liH += `<li class="paginate-new next" data-page="${pageBuilder.lastPageNum + 1}">Next</li>`;
            }
            $('.sgt-new-paging').html(liH);
        }
        $(this).closest('.pull-right').find('input[class="page"]').val(pageBuilder.pageNum);
    });

    $('.sgt-like-paging').on('click', '.paginate-like', function (event) {
        const pageBuilder = setSuggestions(this, 'like', event);
        if ($(this).hasClass('previous') || $(this).hasClass('next')) {
            let liH = '';
            if (pageBuilder.isPrevPrev) {
                liH += `<li class="paginate-like previous" data-page="${pageBuilder.startPageNum - 1}">Prev</li>`;
            }
            for (let i = pageBuilder.startPageNum; i <= pageBuilder.lastPageNum; i += 1) {
                liH += `<li class="paginate-like" data-page="${i}">${i}</li>`;
            }
            if (pageBuilder.isNextNext) {
                liH += `<li class="paginate-like next" data-page="${pageBuilder.lastPageNum + 1}">Next</li>`;
            }
            $('.sgt-like-paging').html(liH);
        }
        $(this).closest('.pull-right').find('input[class="page"]').val(pageBuilder.pageNum);
    });

    $('.sgt-recommend-paging').on('click', '.paginate-recommend', function (event) {
        const pageBuilder = setSuggestions(this, 'recommend', event);
        console.log('pageBuilder :', pageBuilder);
        if ($(this).hasClass('previous') || $(this).hasClass('next')) {
            let liH = '';
            if (pageBuilder.isPrevPrev) {
                liH += `<li class="paginate-recommend previous" data-page="${pageBuilder.startPageNum - 1}">Prev</li>`;
            }
            for (let i = pageBuilder.startPageNum; i <= pageBuilder.lastPageNum; i += 1) {
                liH += `<li class="paginate-recommend" data-page="${i}">${i}</li>`;
            }
            if (pageBuilder.isNextNext) {
                liH += `<li class="paginate-recommend next" data-page="${pageBuilder.lastPageNum + 1}">Next</li>`;
            }
            $('.sgt-recommend-paging').html(liH);
        }
        $(this).closest('.pull-right').find('input[class="page"]').val(pageBuilder.pageNum);
    });

    $('.suggestion-entry').on('click', function () {
        const sid = $(this).find('.sgt-articleId').val();
        const form = $('#articleForm');
        form.find('input[name="pageNum"]').val($(this).closest('.tab-info').find('input[class="page"]').val());
        form.find('input[name="keyword"]').val($(this).closest('.tab-info').find('input[class="keyword"]').val());
        form.find('input[name="type"]').val($(this).closest('.tab-info').find('input[class="type"]').val());
        form.attr('action', `${form.attr('action')}${sid}`);
        form.submit();
    });

    $('.comment-form').on('submit', function (event) {
        event.preventDefault();
        const lastCID = $('.be-comment').last().find('input[name="comment-id"]').val();
        $(this).find('input[name="lastCommentId"]').val(lastCID);
        console.log($(this).serialize());
        writeReplyJjw(this);
        // return false;
    })

    $('.be-comment-block').on('click', '.comment-delete-btn', function (e) {
        e.preventDefault();
        const btn = this;
        $.ajax({
            type: 'get',
            //async: false,
            url: '/salmon/sns/deletecomment/' + $(btn).closest('.be-comment').find('input[name="comment-id"]').val(),
            success: function (data) {
                $(btn).closest('.be-comment').remove();
                $('.comment-count').html(Number($('.comment-count').html()) - 1);
            },
            error: function (xhr, status, er) {
                alert('데이터 수신 에러');
                console.log(xhr);
                console.log(status);
                console.log(er);
            }
        });
    });

    $('.like-btn').on('click', function (e) {
        const btn = this;
        e.preventDefault();
        $.ajax({
            url: `/salmon/sns/like/${$(this).attr('href')}`,
            method: 'get',
            success: function (data) {
                $('.like-count').html(data);
                const percent = (Number(data) / 10) > 100 ? '100' : (Number(data) / 10);
                $('.progress-bar').attr('aria-valuenow', `${percent}%`);
                $('.progress-bar').css('width', `${percent}%`);
                $('.progress-bar').html(`${percent}%`);
                $(btn).addClass('hidden');
                $('.like-cancel-btn').removeClass('hidden');
            }
        });
    });

    $('.like-cancel-btn').on('click', function (e) {
        const btn = this;
        e.preventDefault();
        $.ajax({
            url: `/salmon/sns/unlike/${$(this).attr('href')}`,
            method: 'get',
            success: function (data) {
                $('.like-count').html(data);
                const percent = (Number(data) / 10) > 100 ? '100' : (Number(data) / 10);
                $('.progress-bar').attr('aria-valuenow', `${percent}%`);
                $('.progress-bar').css('width', `${percent}%`);
                $('.progress-bar').html(`${percent}%`);
                $(btn).addClass('hidden');
                $('.like-btn').removeClass('hidden');
            }
        });
    });

    $('.new-article').on('click', function () {
        
    });
});