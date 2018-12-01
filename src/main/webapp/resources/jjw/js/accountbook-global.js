$(function () {
    $('.view-calendar').on('click', function () {
        $('.accountbook-calendar').removeClass('hidden');
        $('.accountbook-chart').addClass('hidden');
    });

    $('.view-chart').on('click', function () {
        $('.accountbook-calendar').addClass('hidden');
        $('.accountbook-chart').removeClass('hidden');
        if (chartDatas.has('ctgryToSpend')) {
            Highcharts.chart('accountbook-chart', chartDatas.get('ctgryToSpend'));
        } else {
            monthSpendChart();
            Highcharts.chart('accountbook-chart', chartDatas.get('ctgryToSpend'));
        }
    });

});