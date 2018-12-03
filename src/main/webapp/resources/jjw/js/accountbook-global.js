var chartDatas = new Map();
var psnMonthlyPayment;
var psnMonthStart;

function setMonthSpendChartData(data) {
    const chartData = {
        chart: {
            type: 'bar'
        },
        title: {
            text: '월별 소비 비율 통계'
        },
        xAxis: {
            categories: data[0]
        },
        yAxis: {
            min: 0,
            title: {
                text: '금액(원)'
            }
            // ,
            // labels: {
            //     formatter: function () {
            //         return this.value / 1000 + '천원';
            //     }
            // }
        },
        tooltip: {
            headerFormat: `<span style="font-size: 10px">{point.key}</span><br/>`,
            pointFormat: '<span style="color:{point.color}">●</span> <b>{series.name}</b> <b>{point.y}</b>원<br/>'
        },
        legend: {
            reversed: true
        },
        plotOptions: {
            series: {
                stacking: 'normal'
            }
        },
        series: data[1]
    };
    return chartData;
}

function requestMonthSpendChart(year) {
    if (chartDatas.has(`monthBarSpendChart-${year}`)) {
        Highcharts.chart('accountbook-chart', setMonthSpendChartData(chartDatas.get(`monthBarSpendChart-${year}`)));
    } else {
        chartDatas.set(`monthBarSpendChart-${year}`, monthBarSpendChart(year));
        Highcharts.chart('accountbook-chart', setMonthSpendChartData(chartDatas.get(`monthBarSpendChart-${year}`)));
    }
}

function setMLSIChartData(year, month, data) {
    const chartData = {
        chart: {
            type: 'column'
        },
        title: {
            text: `${year}년 ${month}월 지출/수입`
        },
        xAxis: {
            type: 'datetime',
            dateTimeLabelFormats: {
                day: '%b %e일'
            },
            title: {
                text: '일'
            },
            tickInterval: 86400000
        },
        yAxis: {
            min: 0,
            title: {
                text: '금액(원)'
            }
        },
        tooltip: {
            headerFormat: '<b>{series.name}</b><br>',
            pointFormat: '{point.x:%b %e일}: {point.y}원'
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
            data: data[0]
        }, {
            name: '수입',
            data: data[1]
        }]
    };
    return chartData;
}

function requestMLSIChart(year, month) {
    if (chartDatas.has(`monthLineSpendIncomeChart-${year}-${month}`)) {
        Highcharts.chart('accountbook-chart', setMLSIChartData(year, month, chartDatas.get(`monthLineSpendIncomeChart-${year}-${month}`)));
    } else {
        chartDatas.set(`monthLineSpendIncomeChart-${year}-${month}`, monthLineSpendIncomeChart(year, month));
        Highcharts.chart('accountbook-chart', setMLSIChartData(year, month, chartDatas.get(`monthLineSpendIncomeChart-${year}-${month}`)));
    }
}

function setStackedSpendChart(data, yearSrc, monthSrc) {
    const year = Number(yearSrc) || Number((new Date()).getFullYear());
    const month = Number(monthSrc) - 1;
    const psnMonthStartT = Number(psnMonthStart) || 1;
    let betweenDays;
    let dayStartUTC;
    if (psnMonthStartT >= 16 && psnMonthStartT <= 31) {
        if (month === 0) {
            betweenDays = ((new Date(year, 0, psnMonthStartT)) - (new Date(year - 1, 11, psnMonthStartT))) / 86400000;
            dayStartUTC = (new Date(year-1, 11, psnMonthStartT))*1;
        } else {
            betweenDays = ((new Date(year, month, psnMonthStartT)) - (new Date(year, month - 1, psnMonthStartT))) / 86400000;
            dayStartUTC = (new Date(year, month-1, psnMonthStartT))*1;
        }
    } else if (psnMonthStartT >= 1 && psnMonthStartT <= 15) {
        if (month === 11) {
            betweenDays = ((new Date(year + 1, 0, psnMonthStartT)) - (new Date(year, 11, psnMonthStartT))) / 86400000;
            dayStartUTC = (new Date(year, 11, psnMonthStartT))*1;
        } else {
            betweenDays = ((new Date(year, month + 1, psnMonthStartT)) - (new Date(year, month, psnMonthStartT))) / 86400000;
            dayStartUTC = (new Date(year, month, psnMonthStartT))*1;
        }
    } else {
        alert('개인화 정보 오류');
        return;
    }
    const oneDayMax = psnMonthlyPayment / betweenDays;
    const spendGoal = [];
    for (let i = 1; i <= betweenDays; i += 1) {
        // 86400000 값은 하루의 millisecond 값이고
        // 32400000 값은 Date.UTC()와 new Date() 함수가 같은 날이어도 millisecond 값의 차이가 나는데
        // 이를 방지하기 위해 더함
        spendGoal.push([dayStartUTC + 86400000 * (i - 1) + 32400000, oneDayMax * i]);
    }
    const chartData = {
        chart: {
            type: 'area'
        },
        title: {
            text: 'US and USSR nuclear stockpiles'
        },
        subtitle: {
            text: 'Sources: <a href="https://thebulletin.org/2006/july/global-nuclear-stockpiles-1945-2006">' +
                'thebulletin.org</a> &amp; <a href="https://www.armscontrol.org/factsheets/Nuclearweaponswhohaswhat">' +
                'armscontrol.org</a>'
        },
        xAxis: {
            type: 'datetime',
            dateTimeLabelFormats: {
                day: '%b %e일'
            },
            title: {
                text: '일'
            },
            tickInterval: 86400000,
            tickmarkPlacement: 'on'
        },
        yAxis: {
            title: {
                text: '누적 금액'
            }
        },
        tooltip: {
            shared: true,
            useHTML: true,
            headerFormat: '<b>{point.x:%b %e일} 누적 금액<table>',
            pointFormat: '<tr><td style="color: {series.color}">{series.name}: </td>' +
                '<td style="text-align: right"><b>{point.y} 원</b></td></tr>',
            footerFormat: '</table>',
        },
        plotOptions: {
            area: {
                lineColor: '#666666',
                lineWidth: 1,
                marker: {
                    lineWidth: 1,
                    lineColor: '#666666'
                }
            }
        },
        series: [{
            name: '목표 지출 금액',
            data: spendGoal
        }, {
            name: '현재 지출 누계',
            data: data
        }]
    };
    return chartData;
}

function requestStackedSpendChart(year, month) {
    if (chartDatas.has(`stackedSpend-${year}-${month}`)) {
        Highcharts.chart('accountbook-chart', setStackedSpendChart(chartDatas.get(`stackedSpend-${year}-${month}`), year, month));
    } else {
        chartDatas.set(`stackedSpend-${year}-${month}`, stackedSpendChart(year, month));
        Highcharts.chart('accountbook-chart', setStackedSpendChart(chartDatas.get(`stackedSpend-${year}-${month}`), year, month));
    }
}

$(function () {
    $('.chart-year-dropdown').text(`${(new Date()).getFullYear()}년`);

    $.ajax({
        url: '/salmon/accountbook/ggv/year',
        method: 'get',
        dataType: 'json',
        success: function (yearMonth) {
            const yearlist = $('.chart-year-list');
            yearlist.html('');
            if (yearMonth.length !== 0) {
                yearMonth.forEach(data => {
                    const ym = data.split('-');
                    const year = ym[0];
                    if (yearlist.children().last().text() !== `${year}년`) {
                        yearlist.append(`<li><a>${year}년</a></li>`);
                    }
                });
            }
            const today = new Date();
            $('.chart-year-dropdown').html(`${today.getFullYear()}년`);
            $('.chart-month-dropdown').html(`${today.getMonth()+1}월`);
        }
    });

    $('.view-calendar').on('click', function () {
        $('.accountbook-calendar').removeClass('hidden');
        $('.accountbook-chart').addClass('hidden');
    });

    $('.view-chart').on('click', function () {
        $('.accountbook-calendar').addClass('hidden');
        $('.accountbook-chart').removeClass('hidden');
        requestMonthSpendChart($('.chart-year-dropdown').text().substr(0, 4));
    });

    $('.chart-month-spend').on('click', function () {
        requestMonthSpendChart($('.chart-year-dropdown').text().substr(0, 4));
        $('.chart-month-dropdown').parent().addClass('hidden');
    });

    $('.chart-day-bar').on('click', function () {
        requestMLSIChart($('.chart-year-dropdown').text().substr(0, 4), $('.chart-month-dropdown').text().substr(0, 2));
        $('.chart-month-dropdown').parent().removeClass('hidden');
    });

    $('.chart-month-goal').on('click', function () {
        requestStackedSpendChart($('.chart-year-dropdown').text().substr(0, 4), $('.chart-month-dropdown').text().substr(0, 2));
        $('.chart-month-dropdown').parent().removeClass('hidden');
    });

});