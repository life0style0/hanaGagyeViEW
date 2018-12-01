$(function () {
    $('.view-calendar').on('click', function () {
        $('.accountbook-calendar').removeClass('hidden');
        $('.accountbook-chart').addClass('hidden');
    });

    $('.view-chart').on('click', function () {
        $('.accountbook-calendar').addClass('hidden');
        $('.accountbook-chart').removeClass('hidden');
        if (chartDatas.has('monthBarSpendChart')) {
            Highcharts.chart('accountbook-chart', chartDatas.get('monthBarSpendChart'));
        } else {
            monthBarSpendChart();
            Highcharts.chart('accountbook-chart', chartDatas.get('monthBarSpendChart'));
        }
    });

    $('.chart-month-spend').on('click', function () {
        if (chartDatas.has('monthBarSpendChart')) {
            Highcharts.chart('accountbook-chart', chartDatas.get('monthBarSpendChart'));
        } else {
            monthBarSpendChart();
            Highcharts.chart('accountbook-chart', chartDatas.get('monthBarSpendChart'));
        }
    });

    $('.chart-day-line').on('click', function () {
        if (chartDatas.has('monthLineSpendIncomeChart')) {
            // Highcharts.chart('accountbook-chart', chartDatas.get('monthLineSpendIncomeChart'));
        } else {
            Highcharts.chart('accountbook-chart', monthLineSpendIncomeChart(2018, 11));
        }
    });


});