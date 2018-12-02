/**
 * 월별 소비량을 보여주는 차트를 만들어주는 함수.
 */
function monthBarSpendChart(yearSrc) {
    const year = yearSrc || (new Date()).getFullYear();

    requestCalendarDataToServerByYear(year);

    const monthSpendDatas = new Map(); // key = 월 value = 월 차트 데이터 
    calendarData.forEach(function (monthDatas, date) {
        const monthSpendChartData = new Map();
        monthDatas.forEach(function (monthData) {
            if (!monthData.articleCtgryType === 'spend') {
                console.log('not spend');
            } else if (monthSpendChartData.has(monthData.ctgryName)) {
                monthSpendChartData.set(monthData.ctgryName, monthSpendChartData.get(monthData.ctgryName) + Number(monthData.articlePaymentFee));
            } else {
                monthSpendChartData.set(monthData.ctgryName, Number(monthData.articlePaymentFee));
            }
        });
        monthSpendDatas.set(date, monthSpendChartData);
    });

    const sortedMonthSpendDatas = new Map([...monthSpendDatas.entries()].sort());
    const months = [];
    const ctgryToSpend = new Map(); // key=ctgry, value=spend

    sortedMonthSpendDatas.forEach(function (monthSpendChartData, date) {
        months.push(date);
        let lenMax = ctgryToSpend.size === 0 ? 0 : ctgryToSpend.values().next().value.length;
        monthSpendChartData.forEach(function (articlePaymentFee, ctgryName) {
            if (ctgryToSpend.has(ctgryName)) {
                ctgryToSpend.get(ctgryName).push(articlePaymentFee);
            } else {
                const blankArray = [];
                for (let i = 0; i < lenMax; i += 1) {
                    blankArray.push(0);
                }
                blankArray.push(articlePaymentFee);
                ctgryToSpend.set(ctgryName, blankArray);
            }
        });

        ctgryToSpend.forEach(function (spend, ctgryName) {
            if (!monthSpendChartData.has(ctgryName)) {
                spend.push(0);
            }
        });

    });
    const seriesDatas = [];
    ctgryToSpend.forEach(function (spend, ctgry) {
        seriesDatas.push({
            name: ctgry,
            data: spend
        });
    });

    return [months, seriesDatas];
}

/**
 * 일 단위로 지출과 소비의 총합을 선 그래프로 보여주는 함수
 * @param {*} year 보고 싶은 년도
 * @param {*} month 보고 싶은 월
 */
function monthLineSpendIncomeChart(yearSrc, monthSrc) {
    const year = yearSrc || (new Date()).getFullYear();
    const month = monthSrc || (new Date()).getMonth();
    const monthSpendLineData = new Map();
    const monthIncomeLineData = new Map();

    calendarData.forEach(function (monthDatas, date) {
        if (date === `${month}-${year}`) {
            monthDatas.forEach(function (monthData) {
                const day = Number(monthData.articleRegdate.split('-')[2]);
                if (monthData.articleCtgryType === 'spend') {
                    if (monthSpendLineData.has(day)) {
                        monthSpendLineData.set(day, monthSpendLineData.get(day) + Number(monthData.articlePaymentFee));
                    } else {
                        monthSpendLineData.set(day, Number(monthData.articlePaymentFee));
                    }
                } else if (monthData.articleCtgryType === 'income') {
                    if (monthIncomeLineData.has(day)) {
                        monthIncomeLineData.set(day, monthIncomeLineData.get(day) + Number(monthData.articlePaymentFee));
                    } else {
                        monthIncomeLineData.set(day, Number(monthData.articlePaymentFee));
                    }
                }
            });
        }
    });

    const spendDataToArray = [...monthSpendLineData.entries()];
    const incomeDataToArray = [...monthIncomeLineData.entries()];

    return [spendDataToArray, incomeDataToArray];
}

function stackedSpendChart(yearSrc, monthSrc) {
    const year = yearSrc || (new Date()).getFullYear();
    const month = monthSrc || (new Date()).getMonth();

    let spendNowTotal = 0;
    const spendNow = []; // key=ctgry, value=spend
    calendarData.forEach(function (monthDatas, date) {
        if (date === `${month}-${year}`) {
            if (chartDatas.has(`monthLineSpendIncomeChart-${year}-${month}`)) {
                const spendDataToArray = chartDatas.get(`monthLineSpendIncomeChart-${year}-${month}`)[0];
                spendDataToArray.forEach(function (data) {
                    spendNowTotal += Number(data[1]);
                    spendNow.push([data[0], spendNowTotal]);
                });
            } else {
                const monthSpendLineData = new Map();
                monthDatas.forEach(function (monthData) {
                    const day = Number(monthData.articleRegdate.split('-')[2]);
                    if (monthData.articleCtgryType === 'spend') {
                        if (monthSpendLineData.has(day)) {
                            monthSpendLineData.set(day, monthSpendLineData.get(day) + Number(monthData.articlePaymentFee));
                        } else {
                            monthSpendLineData.set(day, Number(monthData.articlePaymentFee));
                        }
                    }
                });
                monthSpendLineData.forEach(function (money, day) {
                    spendNowTotal += Number(money);
                    spendNow.push([day, spendNowTotal]);
                });
            }
        }
    });

    return spendNow;
}


$(function () {
    $(".chart-year-list").on("click", 'li', function () {
        console.log('start');
        if ($('.chart-month-spend').hasClass('active')) {
            console.log('here');
            requestChartMonthSpend($('.chart-year-dropdown').text().substr(0, 4));
        } else if ($('.chart-day-bar').hasClass('active')) {
            requestMLSIChart($('.chart-year-dropdown').text().substr(0, 4), $('.chart-month-dropdown').text().substr(0, 2));
        }
    });

    $(".chart-month-list").on("click", 'li', function () {
        requestMLSIChart($('.chart-year-dropdown').text().substr(0, 4), $('.chart-month-dropdown').text().substr(0, 2));
    });
});