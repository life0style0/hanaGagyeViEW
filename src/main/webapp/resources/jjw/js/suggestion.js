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
                const sgtNew = $(`#sgt-${pageType}-${i}`).removeClass('hidden');
                sgtNew.find(`.sgt-title`).text((suggestion.articleTitle === undefined) ? '' : suggestion.articleTitle);
                sgtNew.find(`.sgt-userId`).text(suggestion.userId);
                sgtNew.find(`.sgt-like`).text(suggestion.likeCnt);
                sgtNew.find(`.sgt-comment`).text(suggestion.commentCnt);
                sgtNew.find(`.sgt-date`).text(`기간 : ${suggestion.articleRegdate} ~ ${suggestion.articleEnddate}`);
                sgtNew.find(`.sgt-articleId`).val(suggestion.articleId);
            }
            for (let i = suggestionDatas.length + 1; i <= 10; i += 1) {
                $(`#sgt-new-${i}`).addClass('hidden');
            }
        }
    });
    return pageBuilder;
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
    });

    $('.sgt-like-paging').on('click', '.paginate-like', function (event) {
        const pageBuilder = setSuggestions(this, 'like', event);
        console.log('pageBuilder :', pageBuilder);
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
    });

    $('.suggestion-entry').on('click', function () {
        const sid = $(this).find('.sgt-articleId').val();
        $.ajax({
            async: false,
            url: `/salmon/suggestion/article/${sid}`,
            method: 'get',
            dataType: 'json',
            success: function (suggestion) {
                setArticle(suggestion);
            }
        });
    });
});