var startDayNum;

function makeCalendar(yearSrc, monthSrc) {
    const year = Number(yearSrc);
    const month = Number(monthSrc);
    let prevStartDate;
    let startDay;
    let endDate;
    if (!year || year < 1900 || year > 3000) {
        alert('잘못된 년도입니다.');
        return;
    }
    if (!month || month < 1 || month > 12) {
        alert('잘못된 월입니다.');
    }

    if (month === 1) {
        prevStartDate = (new Date(year - 1, 11, 0)).getDate();
        startDay = new Date(year, month - 1, 1).getDay();
        endDate = new Date(year, month, 0).getDate();
    } else if (month === 12) {
        prevStartDate = (new Date(year, month - 1, 0)).getDate();
        startDay = new Date(year, month - 1, 1).getDay();
        endDate = new Date(year + 1, 0, 0).getDate();
    } else {
        prevStartDate = (new Date(year, month - 1, 0)).getDate();
        startDay = new Date(year, month - 1, 1).getDay();
        endDate = new Date(year, month, 0).getDate();
    }
    startDayNum = startDay;
    let calNum = 1;
    for (let i = 1; i <= 42; i += 7) {
        $(`#calendar-${i}`).find('.calendar-date').addClass('text-red');
    }
    for (let i = 7; i <= 42; i += 7) {
        $(`#calendar-${i}`).find('.calendar-date').addClass('text-blue');
    }
    for (let i = startDay - 1; i >= 0; i -= 1) {
        $(`#calendar-${calNum++}`).addClass('bg-lightgray').find('.calendar-date').removeClass('text-red').addClass('text-gray').html(`<strong>${prevStartDate - i}</strong>`);
    }
    for (let i = 1; i <= endDate; i += 1) {
        $(`#calendar-${calNum++}`).removeClass('bg-lightgray').find('.calendar-date').removeClass('text-gray').html(`<strong>${i}</strong>`);
    }
    for (; calNum <= 42;) {
        $(`#calendar-${calNum++}`).addClass('bg-lightgray').find('.calendar-date').removeClass('text-red text-blue').addClass('text-gray').html(`<strong>${calNum - endDate - startDay - 1}</strong>`);
    }

}

function checkScope(scope) {
    if (scope === 'u') {
        return '공개';
    } else if (scope === 'r') {
        return '나만';
    }
    return 'error';
}

function showGgvToCalendar(data) {
    let html = '';
    html = `<div class="ggv"><input type="hidden" name="articleId" value="${data.articleId}"><div class="ggv-title"><span>카테고리 : ${data.ctgryName}</span>`;
    html += `<span class="ggv-scope">${checkScope(data.articleScope)}</span></div>`;
    html += `<div class="ggv-content">${data.articlePaymentFee}</div></div>`;
    return html;
}

function addDataToCalendar(data) {
    const regdate = data.articleRegdate.split('-'); // 2018-01-01 형식
    const ggv = $(`#calendar-${Number(regdate[2]) + Number(startDayNum)}`);
    if (data.articleCtgryType === '지출') {
        ggv.find('.calendar-spend').append(showGgvToCalendar(data));
    } else if (data.articleCtgryType === '수입') {
        ggv.find('.calendar-income').append(showGgvToCalendar(data));
    }
}

function requestCalendarDataToServer(year, month) {
    $.ajax({
        url: '/salmon/accountbook/ggv',
        method: 'get',
        data: {
            'year': year,
            'month': month
        },
        dataType: 'json',
        success: function (datas) {
            for (let i = 0; i < datas.length; i += 1) {
                const data = datas[i];
                addDataToCalendar(data);
            }
        }
    });
}

function setCalendar() {
    const month = $('.calendar.month').html();
    const year = $('.calendar.year').html();
    const datePic = $('#datePic').val().split('/');
    if (datePic[0] == month && datePic[1] == year) {
        return;
    } else {
        $('.calendar.month').html(`${datePic[0]}`);
        $('.calendar.year').html(`${datePic[1]}`);

        requestCalendarDataToServer(datePic[1], datePic[0]);
    }
}

function showGgv(data) {
    for (let i = 0; i < data.imagePaths.length; i += 1) {
        const imagePath = data.imagePaths[i];
        $('.ggv-carousel').append(`<img class="ggv-image center-block" src="/salmon/image?fileName=${imagePath}" alt="">`);
    }
    $('#ggvScope').html(checkScope(data.articleScope));
    $('#ggvMoney').html(`${data.articlePaymentFee}원`);
    $('#ggvCtgry').html(data.articleCtgryType);
    $('#ggvPayType').html(data.articlePaymentType);
    $('#ggvContent').html(data.articleContent);
}

function resetGgvModal() {
    $('.ggv-carousel').trigger('destroy.owl.carousel');
    $('.ggv-carousel').html('');
}

function showGgvInfos(info) {
    const articleId = $(info).find('input[name="articleId"]').val();
    if (!articleId) {
        alert("error!");
        return;
    }
    $.ajax({
        url: `/salmon/accountbook/ggv/${articleId}`,
        method: 'get',
        dataType: 'json',
        success: function (data) {
            showGgv(data);

            $('#ggv-modal').modal('show');

            $('.ggv-carousel').owlCarousel({
                items: 1,
                loop: true,
                margin: 10,
                nav: true,
                navText: [
                    "<i class='fa fa-angle-left'></i>",
                    "<i class='fa fa-angle-right'></i>"
                ],
                dots: false,
                lazyLoad: false
            });

            $('#ggv-modal').on('shown.bs.modal', function () {
                setTimeout(() => {
                    $('.owl-prev').css('top', `-${$('.owl-stage-outer').outerHeight() / 2 + 25}px`);
                    $('.owl-next').css('top', `-${$('.owl-stage-outer').outerHeight() / 2 + 25}px`);
                }, 300);
            });
        }
    });

}

$(function () {
    const date = new Date();
    makeCalendar(date.getFullYear(), date.getMonth() + 1);
    requestCalendarDataToServer(date.getFullYear(), date.getMonth() + 1);

    $('.calendar-head .datepic').datepicker({
        format: "mm/yyyy",
        startView: 1,
        minViewMode: 1,
        language: "kr",
        orientation: "top right",
        autoclose: true
    });


    $('.calendar.month').on('click', function () {
        $('.calendar-head .datepic').datepicker('show');
    });

    $('.calendar.year').on('click', function () {
        $('.calendar-head .datepic').datepicker('show');
    });

    $('.calendar-head .datepic').datepicker().on('hide', function () {
        setCalendar();
    });

    $('.calendar-spend').on('click', '.ggv', function () {
        showGgvInfos(this);
    });

    $('.calendar-income').on('click', '.ggv', function () {
        showGgvInfos(this);
    });

    $('#ggv-modal').on('hidden.bs.modal', function () {
        resetGgvModal();
    });
});