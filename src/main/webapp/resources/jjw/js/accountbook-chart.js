var chartDatas = new Map();

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

    const chartData = {
        chart: {
            type: 'bar'
        },
        title: {
            text: '월별 소비 비율 통계'
        },
        xAxis: {
            categories: months
        },
        yAxis: {
            min: 0,
            title: {
                text: '금액(원)'
            },
            labels: {
                formatter: function () {
                    return this.value / 1000 + '천원';
                }
            }
        },
        legend: {
            reversed: true
        },
        plotOptions: {
            series: {
                stacking: 'normal'
            }
        },
        series: seriesDatas
    };

    chartDatas.set(`monthBarSpendChart-${year}`, chartData);
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

    const chartData = {
        chart: {
            type: 'column'
        },
        title: {
            text: `${year}년 ${month}월 지출/수입`
        },
        xAxis: {
            title: {
                text: '일자'
            },
            tickInterval: 1
        },
        yAxis: {
            min: 0,
            title: {
                text: '금액(원)'
            },
            labels: {
                formatter: function () {
                    return this.value / 1000 + '천원';
                }
            }
        },
        plotOptions: {
            line: {
                dataLabels: {
                    enabled: true
                },
                enableMouseTracking: false
            }
        },
        series: [{
            name: '지출',
            data: spendDataToArray
        }, {
            name: '수입',
            data: incomeDataToArray
        }]
    };

    chartDatas.set(`monthLineSpendIncomeChart-${year}-${month}`, chartData);
}
