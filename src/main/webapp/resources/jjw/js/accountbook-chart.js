
var chartDatas = new Map();

/**
 * 월별 소비 차트 정보를 만드는 함수
 * @param {*} monthSpendDatas 월별 소비 정보
 */
function setMonthSpendChart(monthSpendDatas) {

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
                formatter: function() {
                    return this.value/1000 + '천원';
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

    return chartData;
}

/**
 * 월별 소비량을 보여주는 차트를 만들어주는 함수.
 */
function monthSpendChart() {
    const monthSpendDatas = new Map(); // key = 월 value = 월 차트 데이터 
    calendarData.forEach(function (value, key) {
        const date = key;
        const monthDatas = value;
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
                formatter: function() {
                    return this.value/1000 + '천원';
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

    chartDatas.set('ctgryToSpend', chartData);
}

$(function () {

});