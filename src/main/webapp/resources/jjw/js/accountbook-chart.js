/**
 * 월별 소비량을 보여주는 차트를 만들어주는 함수.
 */
function monthBarSpendChart(yearSrc) {
    const year = yearSrc || (new Date()).getFullYear();

    requestCalendarDataToServerByYear(year);

    const monthSpendDatas = new Map(); // key = 월 value = 월 차트 데이터 
    calendarData.forEach(function (monthDatas, date) {
        if (monthDatas.length > 0) {
            if (date.substr(3, 4) === year) {
                const monthSpendChartData = new Map();
                monthDatas.forEach(function (monthData) {
                    if (!monthData.articleCtgryType === 'spend') {
                        console.log('not spend');
                    } else if (monthSpendChartData.has(monthData.ctgryNames[0])) {
                        monthSpendChartData.set(monthData.ctgryNames[0], monthSpendChartData.get(monthData.ctgryNames[0]) + Number(monthData.articlePaymentFee));
                    } else {
                        monthSpendChartData.set(monthData.ctgryNames[0], Number(monthData.articlePaymentFee));
                    }
                });
                monthSpendDatas.set(date, monthSpendChartData);
            }
        }
    });

    const sortedMonthSpendDatas = new Map([...monthSpendDatas.entries()].sort());
    const months = [];
    const ctgryToSpend = new Map(); // key=ctgry, value=spend
    sortedMonthSpendDatas.forEach(function (monthSpendChartData, date) {
        months.push(`${date.substr(3,4)}년 ${date.substr(0,2)}월`);
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
    const month = monthSrc || (new Date()).getMonth() + 1;
    const monthSpendLineData = new Map();
    const monthIncomeLineData = new Map();

    calendarData.forEach(function (monthDatas, date) {
        if (date === `${month}-${year}`) {
            monthDatas.forEach(function (monthData) {
                const yearA = Number(monthData.articleRegdate.substr(0, 4)); //2018년 01월 12일 ~~ 형식
                const monthA = Number(monthData.articleRegdate.substr(6, 2)); //2018년 01월 12일 ~~ 형식
                const day = Number(monthData.articleRegdate.substr(10, 2)); //2018년 01월 12일 ~~ 형식
                const utc = Date.UTC(yearA, monthA - 1, day);
                if (monthData.articleCtgryType === 'spend') {
                    if (monthSpendLineData.has(utc)) {
                        monthSpendLineData.set(utc, monthSpendLineData.get(utc) + Number(monthData.articlePaymentFee));
                    } else {
                        monthSpendLineData.set(utc, Number(monthData.articlePaymentFee));
                    }
                } else if (monthData.articleCtgryType === 'income') {
                    if (monthIncomeLineData.has(utc)) {
                        monthIncomeLineData.set(utc, monthIncomeLineData.get(utc) + Number(monthData.articlePaymentFee));
                    } else {
                        monthIncomeLineData.set(utc, Number(monthData.articlePaymentFee));
                    }
                }
            });
        }
    });

    const spendDataToArray = [...monthSpendLineData.entries()];
    const incomeDataToArray = [...monthIncomeLineData.entries()];

    return [spendDataToArray, incomeDataToArray];
}

/**
 * 지출 목표량과 현재 지출의 데이터를 리턴하는 함수
 * @param {*} yearSrc 
 * @param {*} monthSrc 
 */
function stackedSpendChart(yearSrc, monthSrc) {
    const year = yearSrc || (new Date()).getFullYear();
    const month = monthSrc || (new Date()).getMonth() + 1;

    let spendNowTotal = 0;
    const spendNow = []; // key=ctgry, value=spend
    if (chartDatas.has(`monthLineSpendIncomeChart-${year}-${month}`)) {
        const spendDataToArray = chartDatas.get(`monthLineSpendIncomeChart-${year}-${month}`)[0];
        spendDataToArray.forEach(function (data) {
            spendNowTotal += parseInt(data[1]);
            spendNow.push([data[0], spendNowTotal]);
        });
    } else {
        calendarData.forEach(function (monthDatas, date) {
            if (date === `${month}-${year}`) {
                const monthSpendLineData = new Map();
                monthDatas.forEach(function (monthData) {
                    const yearA = Number(monthData.articleRegdate.substr(0, 4)); //2018년 01월 12일 ~~ 형식
                    const monthA = Number(monthData.articleRegdate.substr(6, 2)); //2018년 01월 12일 ~~ 형식
                    const day = Number(monthData.articleRegdate.substr(10, 2));
                    const utc = Date.UTC(yearA, monthA - 1, day);
                    if (monthData.articleCtgryType === 'spend') {
                        if (monthSpendLineData.has(utc)) {
                            monthSpendLineData.set(utc, monthSpendLineData.get(utc) + Number(monthData.articlePaymentFee));
                        } else {
                            monthSpendLineData.set(utc, Number(monthData.articlePaymentFee));
                        }
                    }
                });
                monthSpendLineData.forEach(function (money, utc) {
                    spendNowTotal += Number(money);
                    spendNow.push([utc, spendNowTotal]);
                });
            }
        });
    }
    return spendNow;
}

function settingMonths(year) {
    $('[class^="chart-month-data-"]').addClass('hidden');
    calendarData.forEach(function (value, key) {
        if (key.substr(3, 4) === year) {
            $(`.chart-month-data-${key.substr(0, 2)}`).removeClass('hidden');
        }
    });
}

$(function () {
    $(".chart-year-list").on('click', 'li', function () {
        const year = $('.chart-year-dropdown').text().substr(0, 4);
        const month = $('.chart-month-dropdown').text().substr(0, 2);
        if ($('.chart-month-spend').hasClass('active')) {
            requestMonthSpendChart(year);
        } else if ($('.chart-day-bar').hasClass('active')) {
            settingMonths(year);
            requestMLSIChart(year, month);
        } else if ($('.chart-month-goal').hasClass('active')) {
            settingMonths(year);
            requestStackedSpendChart(year, month);
        }
    });

    $(".chart-month-list").on("click", 'li', function () {
        const year = $('.chart-year-dropdown').text().substr(0, 4);
        const month = $('.chart-month-dropdown').text().substr(0, 2);
        if ($('.chart-day-bar').hasClass('active')) {
            requestMLSIChart(year, month);
        } else if ($('.chart-month-goal').hasClass('active')) {
            requestStackedSpendChart(year, month);
        }
    });

    Highcharts.setOptions({
        lang: {
            numericSymbols: ['천원', '백만원'],
            numericSymbolMagnitude: 1000,
            thousandsSep: ',',
            shortMonths: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
        }
    });
});