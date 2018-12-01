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
        $().on('click', function () {
            Highcharts.chart('accountbook-chart', chartDatas.get('monthLineSpendIncomeChart')) 
        });
    });

});