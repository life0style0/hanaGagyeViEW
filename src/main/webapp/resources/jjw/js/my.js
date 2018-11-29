var startDayNum;

/**
 * 기본 달력을 만드는 함수
 * @param {*} yearSrc 
 * @param {*} monthSrc 
 */
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

/**
 * 서버로부터 받은 가계부의 공개범위를 판단해 값을 리턴하는 함수
 * @param {*} scope 
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
 * 달력에 가계부 정보를 받아 입력해주는 함수
 * @param {*} data 
 */
function showGgvToCalendar(data) {
    let html = '';
    html = `<div class="ggv"><input type="hidden" name="articleId" value="${data.articleId}"><div class="ggv-title"><span>카테고리 : ${data.ctgryName}</span>`;
    html += `<span class="ggv-scope">${checkScope(data.articleScope)}</span></div>`;
    html += `<div class="ggv-content">${data.articlePaymentFee}</div></div>`;
    return html;
}

/**
 * 달력에 가계부 정보들을 받아 입력하기 위한 함수
 * @param {*} data 
 */
function addDataToCalendar(data) {
    const regdate = data.articleRegdate.split('-'); // 2018-01-01 형식
    const ggv = $(`#calendar-${Number(regdate[2]) + Number(startDayNum)}`);
    if (data.articleCtgryType === '지출') {
        ggv.find('.calendar-spend').append(showGgvToCalendar(data));
    } else if (data.articleCtgryType === '수입') {
        ggv.find('.calendar-income').append(showGgvToCalendar(data));
    }
}

/**
 * 달력에 가계부 정보를 입력하기 위해 서버로부터 ajax 통신을 통해 json
 * 형태의 값을 받아오는 함수
 * @param {*} year 
 * @param {*} month 
 */
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

/**
 * 달력의 년도와 월을 설정해주는 함수
 */
function setCalendarMY() {
    const month = $('.calendar.month').html();
    const year = $('.calendar.year').html();
    const datePic = $('#datePic').val().split('/');
    if (datePic[0] == month && datePic[1] == year) {
        return;
    } else {
        resetCalendar();

        makeCalendar(datePic[1], Number(datePic[0]));
        
        $('.calendar.month').html(`${datePic[0]}`);
        $('.calendar.year').html(`${datePic[1]}`);

        requestCalendarDataToServer(datePic[1], datePic[0]);
    }
}

/**
 * 특정 가계부 정보를 클릭시 보여줄 값들을 세팅하는 함수
 * @param {*} data 
 */
function setGgv(data) {
    for (let i = 0; i < data.imagePaths.length; i += 1) {
        const imagePath = data.imagePaths[i];
        $('.ggv-carousel').append(`<img class="ggv-image center-block" src="/salmon/image?fileName=${imagePath}" alt="">`);
    }
    const scope = checkScope(data.articleScope);
    $('#ggvScope').html(scope);
    $('#ggvMoney').html(`${data.articlePaymentFee}원`);
    $('#ggvCtgry').html(data.articleCtgryType);
    $('#ggvPayType').html(data.articlePaymentType);
    $('#ggvContent').html(data.articleContent);

    if (scope === '나만') {
        $('.ggv-footer').html(`<button type="button" class="btn btn-primary ggv-btn" id="ggv-edit">수정하기</button>
        <button type="button" class="btn btn-info ggv-btn" id="ggv-share">공유하기</button>
        <button type="button" class="btn btn-warning ggv-btn" data-dismiss="modal">닫기</button>`);
    } else if (scope === '공개') {
        $('.ggv-footer').html(`<button type="button" class="btn btn-primary ggv-btn" id="ggv-edit>수정하기</button>
        <button type="button" class="btn btn-warning ggv-btn" data-dismiss="modal">닫기</button>`);
    }
}

/**
 * 특정 가계부 정보를 초기화하는 메소드
 */
function resetGgvModal() {
    $('.ggv-carousel').trigger('destroy.owl.carousel');
    $('.ggv-carousel').html('');
}

/**
 * 서버로부터 달력에 보여줄 가계부 정보들을 ajax 통신을 통해
 * json 형태로 받아오는 함수
 * @param {*} info 
 */
function setGgvInfos(info) {
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
            setGgv(data);

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

            $('#ggv-modal').modal('show');

            $('#ggv-modal').on('shown.bs.modal', function () {
                $('.owl-prev').css('top', `-${(400 + 50) / 2}px`);
                $('.owl-next').css('top', `-${(400 + 50) / 2}px`);
            });
        }
    });

}

function resetCalendar() {
    $('.calendar-spend').each(function () {
        $(this).html('');
    });
    $('.calendar-income').each(function () {
        $(this).html('');
    });
}

/**
 * DOM 객체가 load 된 이후에 실행하기 위한 코드들
 */
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
        setCalendarMY();
    });

    $('.calendar-spend').on('click', '.ggv', function () {
        setGgvInfos(this);
    });

    $('.calendar-income').on('click', '.ggv', function () {
        setGgvInfos(this);
    });

    $('#ggv-modal').on('hidden.bs.modal', function () {
        resetGgvModal();
    });
});