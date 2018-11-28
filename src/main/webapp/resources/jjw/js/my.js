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



function addDataToCalendar(data) {
    const regdate = data.article_regdate.split('-'); // 2018-01-01 형식
    const ggv = $(`#calendar-${regdate[2] + startDayNum}`);
    
    if (data.article_ctgry_type === '지출') {
        
        if (data.article_scope === 'public') {
            ggv.find('.calendar-spend')
        } else if (data.article_scope === 'private') {

        }
    } else if (data.article_ctgry_type === '수입') {
        ggv.find('.calendar-income')
        if (data.article_scope === 'public') {} else if (data.article_scope === 'private') {

        }
    }
}

function makeGgv() {
    let html = '';
    html = `<div class="ggv">
    <div class="ggv-title"><span>제목</span><span class="ggv-scope">공개범위</span></div>
    <div class="ggv-content">내용</div>
    </div>`;

    return html;
}



$(function () {
    makeCalendar(2018, 11);

    const data = {
        article_ctgry_type: '지출',
        article_scope: 'public',
        ctgry_name: '식비',
        article_payment_fee: '100000',
        article_regdate: '2018-11-27'
    };

    addDataToCalendar(data);
});