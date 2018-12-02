var startDayNum;
var startDateNum;
var startDayToEndDateNum;
var startDayEndDateNum;
var ggvCategory = new Set();
var moneySlider;
var calendarData = new Map();

/**
 * 기본 달력을 만드는 함수
 * @param {*} yearSrc 보고 싶은 년도
 * @param {*} monthSrc 보고 싶은 월
 */
function makeCalendar(yearSrc, monthSrc, daySrc) {
    let year;
    let month;
    let day;
    let daySrcN;
    if (!daySrc) {
        year = Number(yearSrc);
        month = Number(monthSrc);
        day = 1;
    } else {
        daySrcN = Number(daySrc);
        if (daySrcN >= 16 && daySrcN <= 31) {
            year = Number(yearSrc);
            if (monthSrc === 1) {
                month = 12;
            } else {
                month = Number(monthSrc) - 1;
            }
            day = daySrcN;
        } else if (daySrcN >= 1 && daySrcN <= 15) {
            year = Number(yearSrc);
            month = Number(monthSrc);
            day = daySrcN;
        }
    }
    
    let prevStartDate;
    let startDay;
    let startEndDate;
    let endDate;
    let endEndDate;
    if (!year || year < 1900 || year > 3000) {
        alert('잘못된 년도입니다.');
        return;
    }
    if (!month || month < 1 || month > 12) {
        alert('잘못된 월입니다.');
    }

    if (month === 1) {
        prevStartDate = (new Date(year - 1, 11, day - 1)).getDate();
        startDay = new Date(year, month - 1, day).getDay();
        startEndDate = new Date(year, month, 0).getDate();
        endDate = new Date(year, month, day - 1).getDate();
        endEndDate = new Date(year, month + 1, 0).getDate();
    } else if (month === 12) {
        prevStartDate = (new Date(year, month - 1, day - 1)).getDate();
        startDay = new Date(year, month - 1, day).getDay();
        startEndDate = new Date(year + 1, 0, 0).getDate();
        endDate = new Date(year + 1, 0, day - 1).getDate();
        endEndDate = new Date(year, 1, 0).getDate();
    } else {
        prevStartDate = (new Date(year, month - 1, day - 1)).getDate();
        startDay = new Date(year, month - 1, day).getDay();
        startEndDate = new Date(year, month, 0).getDate();
        endDate = new Date(year, month, day - 1).getDate();
        endEndDate = new Date(year, month + 1, 0).getDate();
    }

    startDayNum = Number(startDay);
    startDateNum = Number(day);
    startDayEndDateNum = Number(startEndDate);
    startDayToEndDateNum = Number(startEndDate) - day + 1;
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
    for (let i = day; i <= startEndDate; i += 1) {
        $(`#calendar-${calNum++}`).removeClass('bg-lightgray').find('.calendar-date').removeClass('text-gray').html(`<strong>${i}</strong>`);
    }
    if (day !== 1) {
        for (let i = 1; i <= endDate; i += 1) {
            $(`#calendar-${calNum++}`).removeClass('bg-lightgray').find('.calendar-date').removeClass('text-gray').html(`<strong>${i}</strong>`);
        }
        for (let i = day; i <= endEndDate; i += 1) {
            $(`#calendar-${calNum++}`).addClass('bg-lightgray').find('.calendar-date').removeClass('text-red text-blue').addClass('text-gray').html(`<strong>${i}</strong>`);
        }
    }
    for (let i = 1; calNum <= 42;) {
        $(`#calendar-${calNum++}`).addClass('bg-lightgray').find('.calendar-date').removeClass('text-red text-blue').addClass('text-gray').html(`<strong>${i++}</strong>`);
    }
}

/**
 * 서버로부터 받은 가계부의 공개 범위를 판단해 값을 리턴하는 함수
 * @param {*} scope 가계부의 공개 범위
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
 * 카테고리에 들어 있는 특정 문자를 변경해주는 함수
 * @param {*} ctgryName 카테고리
 * @param {*} delemeter 구분자
 * @param {*} replacer 바꾸고 싶은 구분자
 */
function sortCtgryMapping(ctgryName, delemeterSrc, replacerSrc) {
    const delemeter = delemeterSrc || '/';
    const replacer = replacerSrc || '-';
    if (!ctgryName) {
        alert('ctgryName is empty');
    } else if (!ctgryName.includes(delemeter)) {
        return ctgryName;
    } else {
        return ctgryName.replace(delemeter, replacer);
    }
}

/**
 * 달력에 가계부 정보를 받아 입력해주는 함수
 * @param {*} data 가계부 정보
 */
function showGgvToCalendar(data) {
    let html = `<div class="ggv sort-ggv-ctgry-${sortCtgryMapping(data.ctgryName)} sort-ggv-money sort-ggv-scope" data-money="${data.articlePaymentFee}" data-scope="${data.articleScope}"><input type="hidden" name="articleId" value="${data.articleId}"><div class="ggv-title"><span>${data.ctgryName}</span>`;
    html += `<span class="ggv-scope">${checkScope(data.articleScope)}</span></div>`;
    html += `<div class="ggv-content">${data.articlePaymentFee}`;
    html += `</div></div>`;
    return html;
}

/**
 * 달력에 가계부 정보들을 받아 입력하기 위한 함수
 * @param {*} data 가계부 정보
 */
function addDataToCalendar(data) {
    const regdate = data.articleRegdate.split('-'); // 2018-01-01 형식
    let ggv;
    if (Number(regdate[2]) >= startDateNum) {
        ggv = $(`#calendar-${Number(regdate[2]) + startDayNum - startDateNum + 1}`);
    } else {
        ggv = $(`#calendar-${Number(regdate[2]) + startDayNum + startDayToEndDateNum}`);
    }
    if (data.articleCtgryType === 'spend') {
        ggv.find('.calendar-spend').append(showGgvToCalendar(data));
    } else if (data.articleCtgryType === 'income') {
        ggv.find('.calendar-income').append(showGgvToCalendar(data));
    }
}

/**
 * 왼쪽 화면에 카테고리 세팅하는 함수
 */
function setGgvCategories() {
    $('.ggv-category').html('');
    $('.ggv-category').append(`<li><a class="sorting-ggv-ctgry selected">전체</a></li>`);
    ggvCategory.forEach(function (item) {
        $('.ggv-category').append(`<li><a class="sorting-ggv-ctgry">${item}</a></li>`);
    });
}

function setSortingMoney(minMoney, maxMoney) {
    $('.sorting-cal-money').html(`수입/지출액 필터 : 최소 <b class="min-money">${minMoney}</b>원
    <input id="money-slider" type="text" class="" value="" data-slider-min="${minMoney}" data-slider-max="${maxMoney}" data-slider-step="1000"
     data-slider-value="[${minMoney},${maxMoney}]" /> 최대 <b class="max-money">${maxMoney}</b>원`);
    moneySlider = new Slider('#money-slider', {});
}

function setDatasToCalendar(datas) {
    ggvCategory.clear();
    if (!datas || datas.length === 0) {
        setSortingMoney(0, 0);
    } else {
        let minMoney;
        let maxMoney;
        for (let i = 0; i < datas.length; i += 1) {
            const data = datas[i];
            if (!minMoney) {
                minMoney = data.articlePaymentFee;
            } else if (minMoney > data.articlePaymentFee) {
                minMoney = data.articlePaymentFee;
            }
            if (!maxMoney) {
                maxMoney = data.articlePaymentFee;
            } else if (maxMoney < data.articlePaymentFee) {
                maxMoney = data.articlePaymentFee;
            }
            ggvCategory.add(data.ctgryName);
            addDataToCalendar(data);
        }
        setSortingMoney(minMoney, maxMoney);
        sortCalByMoney();
    }
    setGgvCategories();
    return datas;
}

/**
 * 달력에 가계부 정보를 입력하기 위해 서버로부터 ajax 통신을 통해 
 * json 형태의 값을 받아오는 함수
 * @param {*} year 년 정보
 * @param {*} month 월 정보
 */
function requestCalendarDataToServer(year, month) {
    if (calendarData.has(`${month}-${year}`)) {
        setDatasToCalendar(calendarData.get(`${month}-${year}`));
    } else {
        $.ajax({
            url: '/salmon/accountbook/ggv',
            method: 'get',
            data: {
                year: year,
                month: month
            },
            dataType: 'json',
            success: function (datas) {
                setDatasToCalendar(datas);
                calendarData.set(`${month}-${year}`, datas);
            }
        });
    }
}

function requestCalendarDataToServerByYear(year) {
    $.ajax({
        async: false,
        url: `/salmon/accountbook/ggv/year/${year}`,
        method: 'get',
        dataType: 'json',
        success: function (datas) {
            $.each(datas, function (month, data) {
                if (!calendarData.has(`${month}-${year}`)) {
                    calendarData.set(`${month}-${year}`, data);
                }
            });
        }
    });
}

/**
 * 달력의 년도와 월을 설정해주는 함수
 */
function setCalendarMY(moveDirection) {
    const month = Number($('.calendar.month').text());
    const year = Number($('.calendar.year').text());
    let monthChanged;
    let yearChanged;

    if (!month || !year) {
        alert('달력의 월, 년도가 없습니다.');
        return;
    }

    if (!moveDirection) {
        if (!$('#datePic').val()) {
            return;
        }
        const datePic = $('#datePic').val().split('/');
        monthChanged = Number(datePic[0]);
        yearChanged = Number(datePic[1]);

        if (monthChanged == month && yearChanged == year) {
            return;
        }
    } else if (moveDirection === 'left') {
        if (month !== 1) {
            monthChanged = month - 1;
            yearChanged = year;
        } else {
            monthChanged = 12;
            yearChanged = year - 1;
        }
    } else if (moveDirection === 'right') {
        if (month !== 12) {
            monthChanged = month + 1;
            yearChanged = year;
        } else {
            monthChanged = 1;
            yearChanged = year + 1;
        }
    } else {
        alert('moveDirection input error');
    }

    resetCalendar();
    console.log('monthChanged :', monthChanged);
    makeCalendar(yearChanged, monthChanged, 25);

    if (monthChanged < 10) {
        monthChanged = '0' + monthChanged;
    }

    requestCalendarDataToServer(yearChanged, monthChanged);

    $('.calendar.month').html(monthChanged);
    $('.calendar.year').html(yearChanged);
}

/**
 * 특정 가계부 정보를 클릭시 보여줄 값들을 세팅하는 함수
 * @param {*} data 가계부 정보
 */
function setGgv(data) {
    if (!data) {
        alert('data가 없습니다.');
    }
    for (let i = 0; i < data.imagePaths.length; i += 1) {
        const imagePath = data.imagePaths[i];
        $('.ggv-carousel').append(`<img class="ggv-image center-block" src="/salmon/image?fileName=${imagePath}" alt="">`);
    }
    const scope = checkScope(data.articleScope);
    $('#ggvScope').html(scope);
    $('#ggvMoney').html(`${data.articlePaymentFee}원`);
    $('#ggvCtgry').html(data.articleCtgryType);
    $('#ggvPayType').html(data.articlePaymentType);
    $('#ggvTitle').html(data.articleTitle);

    $('#ggv-modal-label').html(data.articleRegdate);

    let articleContentHTML = data.articleContent;
    for (let i = 0; i < data.hashtags.length; i += 1) {
        const hashtag = data.hashtags[i];
        articleContentHTML += ` <a class="hashtag">${hashtag}</a>`;
    }
    $('#ggvContent').html(articleContentHTML);

    if (scope === '나만') {
        $('.ggv-footer').html(`<button type="button" class="btn btn-primary ggv-btn" id="ggv-edit">수정하기</button>
        <button type="button" class="btn btn-info ggv-btn" id="ggv-share">공유하기</button>
        <button type="button" class="btn btn-warning ggv-btn" data-dismiss="modal">닫기</button>`);
    } else if (scope === '공개') {
        $('.ggv-footer').html(`<button type="button" class="btn btn-primary ggv-btn" id="ggv-edit">수정하기</button>
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
                $('.owl-prev').css('top', `-${(523 + 50) / 2}px`);
                $('.owl-next').css('top', `-${(523 + 50) / 2}px`);
            });
        }
    });
}

/**
 * 달력 월 변경시 초기화 하는 함수
 */
function resetCalendar() {
    $('.calendar-spend').each(function () {
        $(this).html('');
    });
    $('.calendar-income').each(function () {
        $(this).html('');
    });
}

/**
 * 달력 초기화 함수
 */
function initCalendar() {
    const date = new Date();
    makeCalendar(date.getFullYear(), date.getMonth() + 1, 25);
    requestCalendarDataToServer(date.getFullYear(), date.getMonth() + 1);
    $('.calendar.month').html(date.getMonth() + 1);
    $('.calendar.year').html(date.getFullYear());
}

/**
 * 필터 기능 초기화 함수
 */
function initSorting() {
    $(".ggv-type-list li").on("click", function () {
        const ggvType = $(this).text().trim();
        if (!ggvType) {
            alert('값이 없습니다.');
            return;
        } else if (ggvType === '수입/지출') {
            $('[class*="sort-cal-"]').removeClass('hidden-ggvType');
        } else if (ggvType === '수입') {
            $('[class*="sort-cal-"]').addClass('hidden-ggvType');
            $('.sort-cal-income').removeClass('hidden-ggvType');
        } else if (ggvType === '지출') {
            $('[class*="sort-cal-"]').addClass('hidden-ggvType');
            $('.sort-cal-spend').removeClass('hidden-ggvType');
        }
    });

    $(".ggv-scope-list li").on("click", function () {
        const ggvScope = $(this).text().trim();
        if (!ggvScope) {
            alert('값이 없습니다.');
            return;
        } else if (ggvScope === '나만/공개') {
            $('.sort-ggv-scope').removeClass('hidden-ggvScope');
        } else if (ggvScope === '나만') {
            $('.sort-ggv-scope').addClass('hidden-ggvScope');
            $('.sort-ggv-scope').each(function () {
                if ($(this).data('scope') === 'r') {
                    $(this).removeClass('hidden-ggvScope');
                }
            });
        } else if (ggvScope === '공개') {
            $('.sort-ggv-scope').addClass('hidden-ggvScope');
            $('.sort-ggv-scope').each(function () {
                if ($(this).data('scope') === 'u') {
                    $(this).removeClass('hidden-ggvScope');
                }
            });
        }
    });

    $('.ggv-category').on('click', '.sorting-ggv-ctgry', function () {
        $('.sorting-ggv-ctgry').removeClass('selected');
        $(this).addClass('selected');
        const ggvCtgry = $(this).text();
        if (!ggvCtgry) {
            alert('값이 없습니다.');
            return;
        } else if (ggvCtgry === '전체') {
            $('[class*="sort-ggv-ctgry-"]').removeClass('hidden-ctgry');
        } else {
            $('[class*="sort-ggv-ctgry-"]').addClass('hidden-ctgry');
            $(`.sort-ggv-ctgry-${sortCtgryMapping(ggvCtgry)}`).removeClass('hidden-ctgry');
        }
    });
}

/**
 * 금액 기준으로 필터해주는 함수
 */
function sortCalByMoney() {
    moneySlider.on('slideStop', function () {
        const min = moneySlider.getValue()[0];
        const max = moneySlider.getValue()[1];
        $('.min-money').html(min);
        $('.max-money').html(max);
        $('.sort-ggv-money').each(function () {
            const money = Number($(this).data('money'));
            if (money < min || money > max) {
                $(this).addClass('hidden-money');
            } else {
                $(this).removeClass('hidden-money');
            }
        });
    });
}

function calendarMYClicked() {
    const month = $('.calendar.month').html();
    const year = $('.calendar.year').html();
    $('.calendar-head .datepic').datepicker('update', new Date(year, month - 1, 1));
    $('.calendar-head .datepic').datepicker('show');
}

/**
 * DOM 객체가 load 된 이후에 실행하기 위한 코드들
 */
$(function () {
    initCalendar();

    $('.calendar-head .datepic').datepicker({
        format: "mm/yyyy",
        startView: 1,
        minViewMode: 1,
        language: "kr",
        orientation: "top left",
        autoclose: true
    });

    $('.calendar.month').on('click', function () {
        calendarMYClicked();
    });

    $('.calendar.year').on('click', function () {
        calendarMYClicked();
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

    $('.calendar-left').on('click', function () {
        setCalendarMY('left');
    });

    $('.calendar-right').on('click', function () {
        setCalendarMY('right');
    });

    initSorting();

});