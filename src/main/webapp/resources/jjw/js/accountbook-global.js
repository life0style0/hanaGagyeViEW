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
        requestChartMonthSpend($('.chart-year-dropdown').text().substr(0, 4));
    });

    $('.chart-month-spend').on('click', function () {
        requestChartMonthSpend($('.chart-year-dropdown').text().substr(0, 4));
        $('.chart-month-dropdown').parent().addClass('hidden');
    });

    $('.chart-day-line').on('click', function () {
        requestMLSIChart($('.chart-year-dropdown').text().substr(0, 4), $('.chart-month-dropdown').text().substr(0, 2));
        $('.chart-month-dropdown').parent().removeClass('hidden');
    });

});