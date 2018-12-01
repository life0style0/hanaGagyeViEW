
function requestChartMonthSpend(year) {
    if (chartDatas.has(`monthBarSpendChart-${year}`)) {
        Highcharts.chart('accountbook-chart', chartDatas.get(`monthBarSpendChart-${year}`));
    } else {
        monthBarSpendChart(year);
        Highcharts.chart('accountbook-chart', chartDatas.get(`monthBarSpendChart-${year}`));
    }
}

function requestMLSIChart(year, month) {
    if (chartDatas.has(`monthLineSpendIncomeChart-${year}-${month}`)) {
        Highcharts.chart('accountbook-chart', chartDatas.get(`monthLineSpendIncomeChart-${year}-${month}`));
    } else {
        monthLineSpendIncomeChart(year, month);
        Highcharts.chart('accountbook-chart', chartDatas.get(`monthLineSpendIncomeChart-${year}-${month}`));
    }
}

$(function () {
    $('.view-calendar').on('click', function () {
        $('.accountbook-calendar').removeClass('hidden');
        $('.accountbook-chart').addClass('hidden');
    });

    $('.view-chart').on('click', function () {
        $('.accountbook-calendar').addClass('hidden');
        $('.accountbook-chart').removeClass('hidden');
        requestChartMonthSpend(2018);
    });

    $('.chart-month-spend').on('click', function () {
        requestChartMonthSpend(2018);
    });

    $('.chart-day-line').on('click', function () {
        requestMLSIChart(2018, 11);
    });


});