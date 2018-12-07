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
                      <li><a href="index.html">유저 분석</a></li>
                      <li><a href="index2.html">소비 분석</a></li>
                      <li><a href="index3.html">게시글 분석</a></li>
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
                    <h3>유저 통계 <small>월별 신규 가입 인원</small></h3>
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
              <div class="x_panel tile fixed_height_320">
                <div class="x_title">
                  <h2>유저 등록 카테고리</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                      </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <h4>카테고리 상위 5</h4>
                  <c:forEach var="ctgryDto" items="${adminUserInfoDTO.getUserCtgry }">
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>${ctgryDto.ctgry_name }</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${Math.ceil(ctgryDto.ctgry_ct/ adminUserInfoDTO.ctgryTotal * 100)}%;">
                          <span class="sr-only">${Math.ceil(ctgryDto.ctgry_ct/ adminUserInfoDTO.ctgryTotal * 100)}% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>${ctgryDto.ctgry_ct}</span>
                    </div>
                    <div class="clearfix"></div>
                  </div>
				</c:forEach>
                </div>
              </div>
            </div>

            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_320 overflow_hidden">
                <div class="x_title">
                  <h2>팔로워 보유 현황</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                      </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <table class="" style="width:100%">
                    <tr>
                      <th style="width:37%;">
                        <p>Top 5</p>
                      </th>
                      <th>
                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                          <p class="">사용자 아이디</p>
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                          <p class="">팔로워수</p>
                        </div>
                      </th>
                    </tr>
                    <tr>
                      <td>
                        <canvas class="canvasDoughnut" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
                      </td>
                      <td>
                        <table class="tile_info">
                        <c:forEach var="follower" items="${adminUserInfoDTO.followerTopList }">
                          <tr>
                            <td>
                              <p><i class="fa fa-square blue"></i>${follower.user_id } </p>
                            </td>
                            <td>${follower.follower_ct }명</td>
                          </tr>
                        </c:forEach>
                        </table>
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>


            <div class="col-md-4 col-sm-6 col-xs-12 widget_tally_box">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>성별에 따른 소비 분포도</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  	<div id="container2" style="width: 100%; height: 240px; margin: 0 auto"></div> 
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
	
	/*산포도*/
	var categories = [];
	<c:forEach var="ctgry" items="${ctgryList}">
	<c:if test="${ctgry=='none'}">
	
	</c:if>
	<c:if test="${ctgry!='none'}">
	categories.push('${ctgry}');
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
	
	</script>
	
  </body>
</html>
