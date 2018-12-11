/**
 * 공개 범위를 판단해 값을 리턴하는 함수
 * @param {*} scope 게시글의 공개 범위
 */
function checkScope(scope) {
    if (scope === 'u') {
        return '공개';
    } else if (scope === 'r') {
        return '나만';
    } else if (scope === 'g') {
    	return '소모임';
    }
    return 'error';
}

/**
 * 게시글의 카테고리 체크를 위한 함수
 * @param {*} type 
 */
function checkArticleCtgryType(type) {
    if (!type) {
        alert('빈 type 입력');
    } else if (type === 'income') {
        return '수입';
    } else if (type === 'spend') {
        return '지출';
    } else {
        return type;
    }
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
                } else {}
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
                } else {}
            }
        });
    });
}

/**
 * 특정 가계부 정보를 초기화하는 메소드
 */
function resetArticleModal() {
    $('.article-carousel').trigger('destroy.owl.carousel');
    $('.article-carousel').removeClass('owl-hidden');
    $('.article-carousel').html('');
    // $('#article-modal').off('shown.bs.modal');
}

/**
 * 특정 가계부 정보를 클릭시 보여줄 값들을 세팅하는 함수
 * @param {*} article 가계부 정보
 * @param {*} info 가계부 정보
 */
function setArticle(article, info) {
    if (!article) {
        alert('data가 없습니다.');
    }
    if (article.imagePaths.length === 0) {
        $('.article-modal .modal-dialog').addClass('no-image-modal');
    } else {
        $('.article-modal .modal-dialog').removeClass('no-image-modal');
        for (let i = 0; i < article.imagePaths.length; i += 1) {
            const imagePath = article.imagePaths[i];
            $('.article-carousel').append(`<img class="center-block owl-lazy invisible" data-src="/salmon/image?fileName=${imagePath}" alt="">`);
        }
        $('.article-carousel').one('loaded.owl.lazy', function () {
            $('.article-carousel').trigger('prev.owl.carousel');
            $('.article-carousel .owl-lazy').each(function (key, value) {
                if ($(value).height() > $(value).width()) {
                    $(value).addClass('article-image-h');
                    $(value).removeClass('article-image-w');
                } else if ($(value).height() < $(value).width()) {
                    $(value).addClass('article-image-w');
                    $(value).removeClass('article-image-h');
                } else {
                    $(value).removeClass('article-image-w');
                    $(value).removeClass('article-image-h');
                    $(value).addClass('article-image');
                }
            });
            $('.article-carousel .owl-lazy').removeClass('invisible');
        });

        $('#article-modal').one('shown.bs.modal', function () {
            setTimeout(() => {
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
            }, 500);
        });

        $('#article-modal').one('hide.bs.modal', function () {
            resetArticleModal();
        });
    }

    if (article.articleCtgryType !== undefined) {
        $('#article-ctgry').html(`(${checkArticleCtgryType(article.articleCtgryType)})`);
    } else {
        $('#article-ctgry').html('');
    }
    if (!article.articleTitle) {
        $('#article-money').html(`${article.articlePaymentFee}원`);
        $('#article-title').html('');
    } else {
        $('#article-money').html(`${article.articlePaymentFee}원, `);
        $('#article-title').html(`${article.articleTitle}`);
    }

    let articleContentHTML = article.articleContent;
    for (let i = 0; i < article.hashtags.length; i += 1) {
        const hashtag = article.hashtags[i];
        articleContentHTML += ` <a class="hashtag">${hashtag}</a>`;
    }
    $('#article-content').html(`${articleContentHTML}`);
    $('#article-writer-nickname').html($('#loginUserId').text());
    $('#article-regdate').html(article.articleRegdate);
    if (article.articlePaymentType !== undefined) {
        $('#article-pay-type').html(`, ${article.articlePaymentType}`);
    } else {
        $('#article-pay-type').html('');
    }
    if (article.ctgryNames !== undefined && article.ctgryNames.length > 0) {
        let ctgries = article.ctgryNames[0];
        for (let i = 1; i < article.ctgryNames.length; i += 1) {
            ctgries += `, ${article.ctgryNames[i]}`;
        }
        $('#article-ctgry-name').html(ctgries);
    } else {
        $('#article-ctgry-name').html('');
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
        $('#article-delete-btn').removeClass('hidden');
        $('#article-delete-btn a').attr('href', `/salmon/article/delete?article_id=${article.articleId}`);
    } else {
        $('#article-edit-btn').addClass('hidden');
    }

    $('#article-modal').modal('show');
}

function showImage(path) {
    return encodeURI(path);
}

function imageLoad(imagePath, image) {
    if (image.hasClass('image-src')) {
        const imgPath = imagePath;
        const img = image;
        if (img.hasClass('thumbnail-comment')) {
            let imgPathT = '';
            if (imgPath.includes('\\')) {
                imgPathT = imgPath.split('\\');
                imgPathT.push(`s_${imgPathT.pop()}`);
                img.attr('src', showImage(imgPathT.join('/')));
            } else if (imgPath.includes('/')) {
                imgPathT = imgPath.split('/');
                imgPathT.push(`s_${imgPathT.pop()}`);
                img.attr('src', showImage(imgPathT.join('/')));
            } else {
                img.attr('src', showImage(`s_${imgPath}`));
            }
        } else {
            img.attr('src', showImage(imgPath));
        }
    }
}

$(function () {
    const imagePathHiddens = $('.imagePath');
    const images = imagePathHiddens.next();
    // for (let i = 0; i < images.size(); i += 1) {
    for (let i = 0; i < images.length; i += 1) {
        const imagePath = imagePathHiddens.eq(i).val();
        const image = images.eq(i);
        imageLoad(imagePath, image);
    }

    $('#article-modal').on('hidden.bs.modal', function () {
        resetArticleModal();
    });
});