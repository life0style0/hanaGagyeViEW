var chartDatas = new Map();

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
            title: {
                text: '일'
            },
            labels: {
                formatter: function () {
                    return `${this.value}일`; // clean, unformatted number for year
                }
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
            data: data[0]
        }, {
            name: '수입',
            data: data[1]
        }]
    };
    return chartData;
}

function requestMLSIChart(year, month) {
    Highcharts.setOptions({
        lang: {
            numericSymbols: ['천원', '백만원'],
            numericSymbolMagnitude: 1000,
            thousandsSep: ','
        }
    });
    if (chartDatas.has(`monthLineSpendIncomeChart-${year}-${month}`)) {
        Highcharts.chart('accountbook-chart', setMLSIChartData(year, month, chartDatas.get(`monthLineSpendIncomeChart-${year}-${month}`)));
    } else {
        chartDatas.set(`monthLineSpendIncomeChart-${year}-${month}`, monthLineSpendIncomeChart(year, month));
        Highcharts.chart('accountbook-chart', setMLSIChartData(year, month, chartDatas.get(`monthLineSpendIncomeChart-${year}-${month}`)));
    }
}

function setStackedSpendChart(data) {
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
            allowDecimals: false,
            labels: {
                formatter: function () {
                    return `${this.value}일`; // clean, unformatted number for year
                }
            },
            tickInterval: 1,
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
            headerFormat: '<b>{point.key}</b>일 누적 금액<table>',
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
            data: [
                [1, 102000],
                [2, 202000],
                [5, 502000],
                [8, 802000],
                [9, 902000],
                [11, 1102000],
                [14, 1202000],
                [15, 1502000],
                [18, 1802000],
                [19, 1902000]
            ]
        }, {
            name: '현재 지출 누계',
            data: data
        }]
    };
    return chartData;
}

function requestStackedSpendChart(year, month) {
    Highcharts.setOptions({
        lang: {
            numericSymbols: ['천원', '백만원'],
            numericSymbolMagnitude: 1000,
            thousandsSep: ','
        }
    });
    if (chartDatas.has(`stackedSpend-${year}-${month}`)) {
        Highcharts.chart('accountbook-chart', setStackedSpendChart(chartDatas.get(`stackedSpend-${year}-${month}`)));
    } else {
        chartDatas.set(`stackedSpend-${year}-${month}`, stackedSpendChart(year, month));
        Highcharts.chart('accountbook-chart', setStackedSpendChart(chartDatas.get(`stackedSpend-${year}-${month}`)));
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
            const monthlist = $('.chart-month-list');
            yearlist.html('');
            monthlist.html('');
            if (yearMonth.length === 0) {
                const today = new Date();
                $('.chart-year-dropdown').html(`${today.getFullYear()}년`);
                $('.chart-month-dropdown').html(`${today.getMonth()}월`);
            } else {
                yearMonth.forEach(data => {
                    const ym = data.split('-');
                    const year = ym[0];
                    const month = ym[1];
                    if (yearlist.children().last().text() !== `${year}년`) {
                        yearlist.append(`<li><a>${year}년</a></li>`);
                    }
                    monthlist.append(`<li><a>${month}월</a></li>`);
                });
                const temp = yearMonth[0].split('-');
                const year = temp[0];
                const month = temp[1];
                $('.chart-year-dropdown').html(`${year}년`);
                $('.chart-month-dropdown').html(`${month}월`);
            }
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