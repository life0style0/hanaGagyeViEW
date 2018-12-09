<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="utf-8">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="/salmon/resources/adminTemplate/images/favicon.png" type="image/ico" />

    <title>HANA 가계ViEW </title>

    <!-- Bootstrap -->
    <link href="/salmon/resources/adminTemplate/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/salmon/resources/adminTemplate/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/salmon/resources/adminTemplate/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/salmon/resources/adminTemplate/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="/salmon/resources/adminTemplate/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/salmon/resources/adminTemplate/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="/salmon/resources/adminTemplate/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/salmon/resources/adminTemplate/build/css/custom.min.css" rel="stylesheet">
    
    <!-- 안녕 차트  -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
            	<a href="/salmon">
            		<img class="logo-c active be_logo" src="/salmon/resources/template/img/logo.png" alt="logo" style="width:200px;height:48px">
            	</a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="/salmon/resources/adminTemplate/images/favicon.png" alt="hana" class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>안녕하세요,</span>
                <h2>관리자님</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>관리자 메뉴</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-table"></i> 통계분석 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="index">유저 분석</a></li>
                      <li><a href="paymentInfo">소비 분석</a></li>
                      <li><a href="articleInfo">게시글 분석</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> 게시글 및 유저 관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="form.html">게시글 관리</a></li>
                      <li><a href="form_advanced.html">유저 관리</a></li>
                      <li><a href="form_validation.html">역제안 관리</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="/salmon/resources/adminTemplate/images/favicon.png" alt="">관리자님
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>
				<!--푸쉬알람  -->
                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="/salmon/resources/adminTemplate/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="/salmon/resources/adminTemplate/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="/salmon/resources/adminTemplate/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="/salmon/resources/adminTemplate/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row tile_count">
            <div class="col-md-3 col-sm-6 col-xs-9 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>총 가계부 작성</span>
              <div class="count">${adminPayInfoTotal.article_ct}</div>
              <span class="count_bottom"><i class="fa fa-user">4% </i></span>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-9 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>가계부 총 금액</span>
              <div class="count">${adminPayInfoTotal.article_sum}</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-9 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 가계부 건당 평균</span>
              <div class="count green">${adminPayInfoTotal.article_avg}</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-9 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 가계부 표준편차</span>
              <div class="count">${adminPayInfoTotal.article_stddev}</div>
              <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>
            </div>
            
          </div>
          <!-- /top tiles -->

          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">

                <div class="row x_title">
                  <div class="col-md-6">
                    <h3>소비 통계 <small>연령대별 카테고리 분류</small></h3>
                  </div>
                  <div class="col-md-6">
                    <!-- <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                      <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                      <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                    </div> -->
                  </div>
                </div>

                <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                <div class="clearfix"></div>
              </div>
            </div>

          </div>
          <br />

          <div class="row">


            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_340">
                <div class="x_title">
                  <h2>카테고리별 소득 비중</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="javascript:incomePer('10')">10대</a>
                        </li>
                        <li><a href="javascript:incomePer('20')">20대</a>
                        </li>
                        <li><a href="javascript:incomePer('30')">30대</a>
                        </li>
                      </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 	<div id="incomPer"></div>
                </div>
              </div>
            </div>

            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_340 overflow_hidden">
                <div class="x_title">
                  <h2>카테고리별 소비 비중</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="javascript:spendPer('10')">10대</a>
                        </li>
                        <li><a href="javascript:spendPer('20')">20대</a>
                        </li>
                        <li><a href="javascript:spendPer('30')">30대</a>
                        </li>
                      </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 	<div id="spendPer"></div>
                </div>
                </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 widget_tally_box">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>지역에 따른 소비 분포도</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="javascript:areaChart('spend')">지출</a>
                          </li>
                          <li><a href="javascript:areaChart('income')">수입</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  	<div id="areaChart"></div> 
                  </div>
                </div>
              </div>

          </div>


          

          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="/salmon/resources/adminTemplate/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/salmon/resources/adminTemplate/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/salmon/resources/adminTemplate/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/salmon/resources/adminTemplate/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="/salmon/resources/adminTemplate/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="/salmon/resources/adminTemplate/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="/salmon/resources/adminTemplate/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="/salmon/resources/adminTemplate/vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="/salmon/resources/adminTemplate/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="/salmon/resources/adminTemplate/vendors/Flot/jquery.flot.js"></script>
    <script src="/salmon/resources/adminTemplate/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="/salmon/resources/adminTemplate/vendors/Flot/jquery.flot.time.js"></script>
    <script src="/salmon/resources/adminTemplate/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="/salmon/resources/adminTemplate/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="/salmon/resources/adminTemplate/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="/salmon/resources/adminTemplate/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="/salmon/resources/adminTemplate/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="/salmon/resources/adminTemplate/vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="/salmon/resources/adminTemplate/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="/salmon/resources/adminTemplate/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="/salmon/resources/adminTemplate/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="/salmon/resources/adminTemplate/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="/salmon/resources/adminTemplate/build/js/custom.min.js"></script>
	
	<!-- 데이터 받기 -->
	<script>
	//랭킹 차트용
	var makeRankDataSet = {};
	var makeRankDataSetIncome = {};
	/*메인 차트*/
	var categories = [];
	<c:forEach var="ctgry" items="${ctgryList}">
	<c:if test="${ctgry=='none'}">
	
	</c:if>
	<c:if test="${ctgry!='none'}">
	categories.push('${ctgry}');
	makeRankDataSet['${ctgry}'] = [];
	makeRankDataSetIncome['${ctgry}'] = [];
	</c:if>
	</c:forEach>
	
	var age10 = [];
	var age20 = [];
	var age30 = [];
	
	for(var i = 0; i< categories.length;i++){
		age10.push(0);
		age20.push(0);
		age30.push(0);
	}
	
	<c:if test="${groupByAgeHashMap.get('10대').size()>0}">
	<c:set var="ageGroup10" value="${groupByAgeHashMap.get('10대')}"/>
	<c:forEach var="group10" items="${ageGroup10}">
	for(var i = 0; i< categories.length;i++ ){
		if(categories[i]=="${group10.ctgry_name}"){
			age10[i] = ${group10.ctgry_avg};
		}
	}
	</c:forEach>
	</c:if>
	
	<c:if test="${groupByAgeHashMap.get('20대').size()>0}">
	<c:set var="ageGroup20" value="${groupByAgeHashMap.get('20대')}"/>
	<c:forEach var="group20" items="${ageGroup20}">	
	for(var i = 0; i< categories.length;i++ ){	
		if(categories[i]=="${group20.ctgry_name}"){
			age20[i] = ${group20.ctgry_avg};

		}
	}
	</c:forEach> 
	</c:if>
	
	<c:if test="${groupByAgeHashMap.get('30대').size()>0}">
	<c:set var="ageGroup30" value="${groupByAgeHashMap.get('30대')}"/>
	<c:forEach var="group30" items="${ageGroup30}">
		for(var i = 0; i< categories.length;i++ ){
			if(categories[i]=="${group30.ctgry_name}"){
				age30[i] = ${group30.ctgry_avg};
			}
		}
	</c:forEach> 
	</c:if>

	
	/* 분포도 데이터 만들기 Default(10대)*/
	var dataIncomePer10 = [];
	var ctgryIncomePer10 = [];
	<c:set var="totalIncome10" value="${incomeTotalList.get(0)}"/>
	<c:set var="targetData10" value="${adminPayInfoPstageIncomeHash.get('10')}"/>
	<c:forEach var="incomePer10" items="${targetData10}">
		var dataIncomePer10Temp = [];
		dataIncomePer10Temp.push("${incomePer10.ctgry_name}");
		ctgryIncomePer10.push("${incomePer10.ctgry_name}");
		dataIncomePer10Temp.push(${Math.ceil(incomePer10.ctgry_sum / totalIncome10 * 100)});
		if(dataIncomePer10.length ==0){
			dataIncomePer10Temp.push(true);
		}else{
			dataIncomePer10Temp.push(false);
		}
		dataIncomePer10.push(dataIncomePer10Temp);
	</c:forEach>
	
	var dataSpendPer10 = [];
	var ctgrySpendPer10 = [];
	<c:set var="totalSpend10" value="${spendTotalList.get(0)}"/>
	<c:set var="targetData10" value="${adminPayInfoPstageSpendHash.get('10')}"/>
	<c:forEach var="spendPer10" items="${targetData10}">
		var dataSpendPer10Temp = [];
		dataSpendPer10Temp.push("${spendPer10.ctgry_name}");
		ctgrySpendPer10.push("${spendPer10.ctgry_name}");
		dataSpendPer10Temp.push(${Math.ceil(spendPer10.ctgry_sum / totalSpend10 * 100)});
		if(dataSpendPer10.length ==0){
			dataSpendPer10Temp.push(true);
		}else{
			dataSpendPer10Temp.push(false);
		}
		dataSpendPer10.push(dataSpendPer10Temp);
	</c:forEach>
	
	
	var dataIncomePer20 = [];
	var ctgryIncomePer20 = [];
	<c:set var="totalIncome20" value="${incomeTotalList.get(0)}"/>
	<c:set var="targetData20" value="${adminPayInfoPstageIncomeHash.get('20')}"/>
	<c:forEach var="incomePer20" items="${targetData20}">
		var dataIncomePer20Temp = [];
		dataIncomePer20Temp.push("${incomePer20.ctgry_name}");
		ctgryIncomePer20.push("${incomePer20.ctgry_name}");
		dataIncomePer20Temp.push(${Math.ceil(incomePer20.ctgry_sum / totalIncome20 * 200)});
		if(dataIncomePer20.length ==0){
			dataIncomePer20Temp.push(true);
		}else{
			dataIncomePer20Temp.push(false);
		}
		dataIncomePer20.push(dataIncomePer20Temp);
	</c:forEach>
	
	var dataSpendPer20 = [];
	var ctgrySpendPer20 = [];
	<c:set var="totalSpend20" value="${spendTotalList.get(0)}"/>
	<c:set var="targetData20" value="${adminPayInfoPstageSpendHash.get('20')}"/>
	<c:forEach var="spendPer20" items="${targetData20}">
		var dataSpendPer20Temp = [];
		dataSpendPer20Temp.push("${spendPer20.ctgry_name}");
		ctgrySpendPer20.push("${spendPer20.ctgry_name}");
		dataSpendPer20Temp.push(${Math.ceil(spendPer20.ctgry_sum / totalSpend20 * 200)});
		if(dataSpendPer20.length ==0){
			dataSpendPer20Temp.push(true);
		}else{
			dataSpendPer20Temp.push(false);
		}
		dataSpendPer20.push(dataSpendPer20Temp);
	</c:forEach>
	
	
	
	var dataIncomePer30 = [];
	var ctgryIncomePer30 = [];
	<c:set var="totalIncome30" value="${incomeTotalList.get(0)}"/>
	<c:set var="targetData30" value="${adminPayInfoPstageIncomeHash.get('30')}"/>
	<c:forEach var="incomePer30" items="${targetData30}">
		var dataIncomePer30Temp = [];
		dataIncomePer30Temp.push("${incomePer30.ctgry_name}");
		ctgryIncomePer30.push("${incomePer30.ctgry_name}");
		dataIncomePer30Temp.push(${Math.ceil(incomePer30.ctgry_sum / totalIncome30 * 300)});
		if(dataIncomePer30.length ==0){
			dataIncomePer30Temp.push(true);
		}else{
			dataIncomePer30Temp.push(false);
		}
		dataIncomePer30.push(dataIncomePer30Temp);
	</c:forEach>
	
	var dataSpendPer30 = [];
	var ctgrySpendPer30 = [];
	<c:set var="totalSpend30" value="${spendTotalList.get(0)}"/>
	<c:set var="targetData30" value="${adminPayInfoPstageSpendHash.get('30')}"/>
	<c:forEach var="spendPer30" items="${targetData30}">
		var dataSpendPer30Temp = [];
		dataSpendPer30Temp.push("${spendPer30.ctgry_name}");
		ctgrySpendPer30.push("${spendPer30.ctgry_name}");
		dataSpendPer30Temp.push(${Math.ceil(spendPer30.ctgry_sum / totalSpend30 * 300)});
		if(dataSpendPer30.length ==0){
			dataSpendPer30Temp.push(true);
		}else{
			dataSpendPer30Temp.push(false);
		}
		dataSpendPer30.push(dataSpendPer30Temp);
	</c:forEach>


	function incomePer(group){
		var targetData;
		var targetCategory;
		if(group=='10'){
			targetData=dataIncomePer10;
			targetCategory = ctgryIncomePer10;
		}else if(group=='20'){
			targetData=dataIncomePer20;
			targetCategory = ctgryIncomePer20;
		}else if(group=='30'){
			targetData=dataIncomePer30
			targetCategory = ctgryIncomePer30;
		}
		
		incomePerChart.update({
			title: {
		        text: '카테고리별 소득 분포('+group +'대)'
		    },  
			xAxis: {
			        categories: targetCategory
			    },

			    series: [{
			        type: 'pie',
			        allowPointSelect: true,
			        keys: ['name', 'y', 'selected', 'sliced'],
			        data: targetData,
			        showInLegend: true
			   }]
	    });
	}
	
	function spendPer(group){
		var targetData;
		var targetCategory;
		if(group=='10'){
			targetData=dataSpendPer10;
			targetCategory = ctgrySpendPer10;
		}else if(group=='20'){
			targetData=dataSpendPer20;
			targetCategory = ctgrySpendPer20;
		}else if(group=='30'){
			targetData=dataSpendPer30
			targetCategory = ctgrySpendPer30;
		}
		
		spendPerChart.update({
			title: {
		        text: '카테고리별 지출 분포('+group +'대)'
		    },
		    
			xAxis: {
			        categories: targetCategory
			    },

			    series: [{
			        type: 'pie',
			        allowPointSelect: true,
			        keys: ['name', 'y', 'selected', 'sliced'],
			        data: targetData,
			        showInLegend: true
			   }]
	    });
	}
	
	//지역별 랭킹rankInfoHash
	
	var rankCategorySet = [];
	<c:forEach var="location" items="${locationList}">
		<c:choose>
		<c:when test="${rankInfoHash.containsKey(location)}">
			<c:set var="targetLocation" value="${rankInfoHash.get(location)}"/>
			<c:forEach var="ctgry" items="${ctgryList}">
				var check = false;
				<c:choose>
				<c:when test="${ctgry=='none'}">
				</c:when>
				<c:otherwise>
				<c:forEach var="locationDataSet" items="${targetLocation}">
					<c:choose>
					<c:when test="${locationDataSet.containsKey(ctgry)}">
						check = true;
						makeRankDataSet['${ctgry}'].push(${locationDataSet.get(ctgry)});
						var checkCtgryIn = true;
						for(var checkCtgry=0; checkCtgry<rankCategorySet.length; checkCtgry++){
							if(rankCategorySet[checkCtgry]=='${ctgry}'){
								checkCtgryIn = false;
							}
						}
						if(checkCtgryIn){
							rankCategorySet.push('${ctgry}');
						}
					</c:when>
					</c:choose>
				</c:forEach>
				if(!check){
					makeRankDataSet['${ctgry}'].push(0);
				}
				</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:when>
		<c:when test="${!rankInfoHash.containsKey(location)}">
			<c:forEach var="ctgry" items="${ctgryList}">
			<c:choose>
			<c:when test="${ctgry=='none'}">
			</c:when>
			<c:otherwise>
					makeRankDataSet['${ctgry}'].push(0);	
			</c:otherwise>
			</c:choose>
			</c:forEach>
		</c:when>
		</c:choose>
	</c:forEach>
	
	var rankCategorySetIncome = [];
	<c:forEach var="location" items="${locationList}">
		<c:choose>
		<c:when test="${rankInfoHashIncome.containsKey(location)}">
			<c:set var="targetLocationIncome" value="${rankInfoHashIncome.get(location)}"/>
			<c:forEach var="ctgry" items="${ctgryList}">
				var check = false;
				<c:choose>
				<c:when test="${ctgry=='none'}">
				</c:when>
				<c:otherwise>
				<c:forEach var="locationDataSetIncome" items="${targetLocationIncome}">
					<c:choose>
					<c:when test="${locationDataSetIncome.containsKey(ctgry)}">
						check = true;
						makeRankDataSetIncome['${ctgry}'].push(${locationDataSetIncome.get(ctgry)});
						var checkCtgryIn = true;
						for(var checkCtgry=0; checkCtgry<rankCategorySetIncome.length; checkCtgry++){
							if(rankCategorySetIncome[checkCtgry]=='${ctgry}'){
								checkCtgryIn = false;
							}
						}
						if(checkCtgryIn){
							rankCategorySetIncome.push('${ctgry}');
						}
					</c:when>
					</c:choose>
				</c:forEach>
				if(!check){
					makeRankDataSetIncome['${ctgry}'].push(0);
				}
				</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:when>
		<c:when test="${!rankInfoHashIncome.containsKey(location)}">
			<c:forEach var="ctgry" items="${ctgryList}">
			<c:choose>
			<c:when test="${ctgry=='none'}">
			</c:when>
			<c:otherwise>
					makeRankDataSetIncome['${ctgry}'].push(0);	
			</c:otherwise>
			</c:choose>
			</c:forEach>
		</c:when>
		</c:choose>
	</c:forEach>
	
	
	
	console.log(makeRankDataSet);
	console.log(makeRankDataSetIncome);
	
	var locationInfo = [];
	<c:forEach var="location" items="${locationList}">
	var tempObejct = {};
	var tempLocData = [];
	locationInfo.push('${location}');
	</c:forEach>
	
	var locationDataSet = [];
	for(var ctgryIndex=0; ctgryIndex<rankCategorySet.length; ctgryIndex++){
		var tempObj = {};
		tempObj['name']=rankCategorySet[ctgryIndex];
		tempObj['data']=makeRankDataSet[rankCategorySet[ctgryIndex]];
		locationDataSet.push(tempObj);	
	}
	
	var locationDataSetIncome = [];
	for(var ctgryIndex=0; ctgryIndex<rankCategorySetIncome.length; ctgryIndex++){
		var tempObj = {};
		tempObj['name']=rankCategorySetIncome[ctgryIndex];
		tempObj['data']=makeRankDataSetIncome[rankCategorySetIncome[ctgryIndex]];
		locationDataSetIncome.push(tempObj);	
	}
	
	
	console.log(locationDataSetIncome);
	console.log(locationDataSet);
	
	
	
	function areaChart(checkType){
		var targetAreaData;
		var targetTitle;
		var targetLocation;
		if(checkType=="income"){
			targetLocation=locationInfo;
			targetAreaData = locationDataSetIncome;
			targetTitle='수입';
		}else if(checkType=="spend"){
			targetLocation=locationInfo;
			targetAreaData = locationDataSet;
			targetTitle='지출';
		}
		
		Highcharts.chart('areaChart', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: '지역별 상위3개 평균 ' + targetTitle +' 카테고리'
		    },
		    xAxis: {
		        categories: locationInfo,
		        crosshair: true
		    },
		    yAxis: {
		        min: 0,
		        title: {
		            text: '평균 금액 (원)'
		        }
		    },
		    tooltip: {
		        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		            '<td style="padding:0"><b>{point.y:.1f} 원</b></td></tr>',
		        footerFormat: '</table>',
		        shared: true,
		        useHTML: true
		    },
		    plotOptions: {
		        column: {
		            pointPadding: 0.2,
		            borderWidth: 0
		        }
		    },
		    series: targetAreaData
		});
	}
	
	
	
	</script>
	
	<!-- 안녕차트  -->
	<script>
	
	/* 메인차트  */
	
	Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: '연령별 카테고리 평균 소비금액'
    },
    xAxis: {
        categories: categories ,
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: '(원)'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} 원</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: '10대',
        data: age10

    }, {
        name: '20대',
        data: age20

    }, {
        name: '30대',
        data: age30

    }]
});
	
	/* 소비 지출 별 카테고리 퍼센티지  */
	var incomePerChart = Highcharts.chart('incomPer', {

    title: {
        text: '카테고리별 소득 분포(10대)'
    },

    xAxis: {
        categories: ctgryIncomePer10
    },

    series: [{
        type: 'pie',
        allowPointSelect: true,
        keys: ['name', 'y', 'selected', 'sliced'],
        data: dataIncomePer10,
        showInLegend: true
    }]
});
	
	
	
var spendPerChart =	Highcharts.chart('spendPer', {

	    title: {
	        text: '카테고리별 소비 분포(10대)'
	    },

	    xAxis: {
	        categories: ctgrySpendPer10
	    },

	    series: [{
	        type: 'pie',
	        allowPointSelect: true,
	        keys: ['name', 'y', 'selected', 'sliced'],
	        data: dataSpendPer10,
	        showInLegend: true
	    }]
	});
	
	/*지역 차트  */
var spendAreaChart =Highcharts.chart('areaChart', {
    chart: {
        type: 'column'
    },
    title: {
        text: '지역별 상위3개 평균소비 카테고리'
    },
    xAxis: {
        categories: locationInfo,
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: '평균 금액 (원)'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} 원</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: locationDataSet
});
	
	</script>
	
  </body>
</html>
