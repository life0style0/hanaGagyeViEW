var s;
var e;

function makeCalendar(year, month) {
    const year = Number(year);
    const month = Number(month);
    if (!year || year < 1900 || year > 3000) {
        alert('잘못된 년도입니다.');
        return;
    }
    if (!month || month < 1 || month > 12) {
        alert('잘못된 월입니다.');
    }
    if (month === 1) {
        const prevStartDate = (new Date(year - 1, 11, 0)).getDate();
        const startDay = new Date(year, month - 1, 1);
        const endDay = new Date(year, month, 0);
    } else if (month === 12) {
        const prevStartDate = (new Date(year, month - 1, 0)).getDate();
        const startDay = new Date(year, month - 1, 1);
        const endDay = new Date(year + 1, 0, 0);
    } else {
        const prevStartDate = (new Date(year, month - 1, 0)).getDate();
        const startDay = new Date(year, month - 1, 1);
        const endDay = new Date(year, month, 0);
    }
    const lastDate = endDay.getDate();
    s = startDay;
    startDay.getDay() // 해당일이 그 주에 몇 번째인지(목요일이면 4)
    const calendar = $('#calendar');
    for (let i = 0; i < startDay.getDay(); i += 1) {

    }
    for (let i = 1; i <= lastDate; i += 1) {
        for (let j = 0; j < lastDate / 7; j += 1) {

        }
    }
}