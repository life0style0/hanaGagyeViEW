var registReady = true;
var categoryNum = 0;

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
            <img src="/salmon/image?fileName=${showImage(comment.user_image)}" alt="" class="be-ava-comment image-src thumbnail-comment">
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

function initCategoriesJjw() {
    if ($('[name="category"]') != null) {
        var cats = $('[name="category"]');
        cats.each(function (i, cat) {

            $(cat).on('click', function (e) {
                //alert('category'+i);
                var selectedVal = $(cat).find('div').attr('value');
                if ($(cat).hasClass('unselected')) {
                    //선택

                    if (categoryNum == 0) {
                        clickCategory(cat);
                        $('#CTGRY_1').attr('value', selectedVal);
                    } else if (categoryNum == 1) {
                        clickCategory(cat);
                        $('#CTGRY_2').attr('value', selectedVal);
                    } else if (categoryNum == 2) {
                        clickCategory(cat);
                        $('#CTGRY_3').attr('value', selectedVal);
                    } else {
                        //4개 이상 선택 불가
                        //categoryNum이 3일때부터 가만히있기
                    }

                } else if ($(cat).hasClass('selected')) {
                    //선택해제

                    if (categoryNum == 1) {
                        unclickCategory(cat);
                        $('#CTGRY_1').removeAttr('value');
                        $('#CTGRY_1').attr('value', -1);
                        //다 뺴면 categoryNum = 0 됨
                    } else if (categoryNum == 2) {
                        unclickCategory(cat);
                        $('#CTGRY_2').removeAttr('value');
                        $('#CTGRY_2').attr('value', -1);
                    } else if (categoryNum == 3) {
                        unclickCategory(cat);
                        $('#CTGRY_3').removeAttr('value');
                        $('#CTGRY_3').attr('value', -1);
                    } else {

                    }
                }

                //console.log(categoryNum);

            });
        });
    }
}

function clickCategory(cat) {
    $(cat).removeClass('unselected');
    $(cat).addClass('selected');
    //$(cat).css('color','red');
    categoryNum++;
}

function unclickCategory(cat) {
    $(cat).removeClass('selected');
    $(cat).addClass('unselected');
    //$(cat).css('color','black');
    categoryNum--;
}

function setPaginateButtons(pageBuilder, pageType, pageButton) {
    if ($(pageButton).hasClass('previous')) {
        let liH = '';
        if (pageBuilder.isPrevPrev) {
            liH += `<li class="paginate-${pageType} previous" data-page="${pageBuilder.startPageNum - 1}">Prev</li>`;
        }
        for (let i = pageBuilder.startPageNum; i <= pageBuilder.lastPageNum; i += 1) {
            if (i === pageBuilder.lastPageNum) {
                liH += `<li class="paginate-${pageType} active" data-page="${i}">${i}</li>`;
            } else {
                liH += `<li class="paginate-${pageType}" data-page="${i}">${i}</li>`;
            }
        }
        if (pageBuilder.isNextNext) {
            liH += `<li class="paginate-${pageType} next" data-page="${pageBuilder.lastPageNum + 1}">Next</li>`;
        }
        $(`.sgt-${pageType}-paging`).html(liH);
    } else if ($(pageButton).hasClass('next')) {
        let liH = '';
        if (pageBuilder.isPrevPrev) {
            liH += `<li class="paginate-${pageType} previous" data-page="${pageBuilder.startPageNum - 1}">Prev</li>`;
        }
        for (let i = pageBuilder.startPageNum; i <= pageBuilder.lastPageNum; i += 1) {
            if (i === pageBuilder.startPageNum) {
                liH += `<li class="paginate-${pageType} active" data-page="${i}">${i}</li>`;
            } else {
                liH += `<li class="paginate-${pageType}" data-page="${i}">${i}</li>`;
            }
        }
        if (pageBuilder.isNextNext) {
            liH += `<li class="paginate-${pageType} next" data-page="${pageBuilder.lastPageNum + 1}">Next</li>`;
        }
        $(`.sgt-${pageType}-paging`).html(liH);
    } else {
        $(`.paginate-${pageType}`).removeClass('active');
        $(pageButton).addClass('active');
    }
}

function makeHashtag(input) {
    let hashtagInput = $(input).val();
    hashtagInput = hashtagInput.trim();
    $(input).val('');
    if (!hashtagInput.startsWith('#')) {
        hashtagInput = `#${hashtagInput}`;
    }
    let checkDuple = false;
    $('.input-hashtag-hidden').children().each(function (key, value) {
        if ($(value).val() === hashtagInput) {
            checkDuple = true;
            return false;
        }
    });
    if (checkDuple) {
        return;
    } else {
        const html = `<input type="hidden" name="hashtags" value="${hashtagInput}">`;
        const tagSpan = `<span class="hashtag" data-hashtag="${hashtagInput}">${hashtagInput}<span class="hashtag-close" aria-hidden="true">×</span></span>`;
        $(input).before(tagSpan);
        $('.input-hashtag-hidden').append(html);
    }
}

$(function () {
    $('.sgt-new-paging').on('click', '.paginate-new', function (event) {
        const pageBuilder = setSuggestions(this, 'new', event);
        setPaginateButtons(pageBuilder, 'new', this);
        $(this).closest('.text-center').find('input[class="page"]').val(pageBuilder.pageNum);
    });

    $('.sgt-like-paging').on('click', '.paginate-like', function (event) {
        const pageBuilder = setSuggestions(this, 'like', event);
        setPaginateButtons(pageBuilder, 'like', this);
        $(this).closest('.text-center').find('input[class="page"]').val(pageBuilder.pageNum);
    });

    $('.sgt-recommend-paging').on('click', '.paginate-recommend', function (event) {
        const pageBuilder = setSuggestions(this, 'recommend', event);
        setPaginateButtons(pageBuilder, 'recommend', this);
        $(this).closest('.text-center').find('input[class="page"]').val(pageBuilder.pageNum);
    });

    $('.sgt-judge-paging').on('click', '.paginate-judge', function (event) {
        const pageBuilder = setSuggestions(this, 'judge', event);
        setPaginateButtons(pageBuilder, 'judge', this);
        $(this).closest('.text-center').find('input[class="page"]').val(pageBuilder.pageNum);
    });

    $('.sgt-confirm-paging').on('click', '.paginate-confirm', function (event) {
        const pageBuilder = setSuggestions(this, 'confirm', event);
        setPaginateButtons(pageBuilder, 'confirm', this);
        $(this).closest('.text-center').find('input[class="page"]').val(pageBuilder.pageNum);
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

    $('.be-comment-block').off('click');
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

    initCategoriesJjw();

    $('#submitT').on('click', function () {
        const title = $('input[name="articleTitle"]');
        if (!title.val()) {
            if (!title.next().hasClass('jjw-alert')) {
                title.after(`<div class="jjw-alert alert-month-start alert-monthly-payment alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>경고!</strong> 제목을 입력해주세요!</div>`);
            }
            $('html, body').animate({
                scrollTop: title.height() + title.offset().top - 200
            }, 400);
            return;
        }

        const content = $('[name="articleContent"]');
        if (!content.val()) {
            if (!content.next().hasClass('jjw-alert')) {
                content.after(`<div class="jjw-alert alert-month-start alert-monthly-payment alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>경고!</strong> 내용을 입력해주세요!</div>`);
            }
            $('html, body').animate({
                scrollTop: content.height() + content.offset().top - 400
            }, 400);
            return;
        }

        $('#formT').submit();
    });

    $('.new-article').on('click', function () {
        $(this).addClass('hidden');
        $('.show-article').removeClass('hidden');
        $('.new-article-main').removeClass('hidden');
        $('.show-article-main').addClass('hidden');
    });

    $('.show-article').on('click', function () {
        $(this).addClass('hidden');
        $('.new-article').removeClass('hidden');
        $('.new-article-main').addClass('hidden');
        $('.show-article-main').removeClass('hidden');
    });

    $('.tag-input').on('keydown', function (e) {
        const value = $(this).val().trim();
        if (value.length > 0) {
            if (e.keyCode == 32 || e.keyCode == 44 || e.keyCode == 13 || e.keyCode == 9) {
                e.preventDefault();
                makeHashtag(this);
                $(this).val('');
                return false;
            }
            $(this).width(200 + value.length * 3);
        } else {
            if (e.keyCode == 32 || e.keyCode == 44) {
                e.preventDefault();
            }
        }
    });

    $('.form-hashtag').on('click', '.hashtag-close', function () {
        const hashtagTag = $(this).closest('.hashtag');
        const hashtag = hashtagTag.data('hashtag');
        $('.input-hashtag-hidden').children().each(function (key, value) {
            if ($(value).val() === hashtag) {
                hashtagTag.remove();
                $(value).remove();
                return false;
            }
        });
    });

    $('.form-hashtag').on('click', function () {
        $('.tag-input').focus();
    });
});