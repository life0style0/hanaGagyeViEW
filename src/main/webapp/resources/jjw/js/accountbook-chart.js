var monthSpendDatas = new Map(); // key = 월 value = 월 차트 데이터 
var chartData;

function monthSpendChart() {
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
}

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

    chartData = {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Stacked column chart'
        },
        xAxis: {
            categories: months
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Total fruit consumption'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                }
            }
        },
        legend: {
            align: 'right',
            x: -30,
            verticalAlign: 'top',
            y: 25,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        tooltip: {
            headerFormat: '<b>{point.x}</b><br/>',
            pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                }
            }
        },
        series: seriesDatas
    }

    Highcharts.chart('accountbook-chart', chartData);
}

$(function () {

});