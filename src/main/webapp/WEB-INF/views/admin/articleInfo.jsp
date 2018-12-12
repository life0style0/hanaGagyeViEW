<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/wordcloud.js"></script>
	
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
                      <li><a href="articleManage">게시글 관리</a></li>
                      <li><a href="userManage">유저 관리</a></li>
                      <li><a href="suggestionManage">역제안 관리</a></li>
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
                    <li>
                    <%-- 로그아웃 추가 --%>
                    <form method="post" action="/salmon/customLogout" class="popup-input-search">
		              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		              <button class="btn" style="background-color:#fff; width:200px;">로그아웃</button>
		            </form>
		            <%-- 로그아웃 추가 --%>
                   <!--  <a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a> -->
                    </li>
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
          	<c:forEach var="summaryInfo" items="${ctgrySummaryList}">
          		<c:choose>
          			<c:when test="${summaryInfo.article_ctgry_id==1 }">
          				 <div class="col-md-3 col-sm-6 col-xs-9 tile_stats_count">
			              <span class="count_top"><i class="fa fa-user"></i> 수입 게시글</span>
			              <div class="count">${summaryInfo.article_ctgry_ct }</div>
			              <span class="count_bottom"><i class="fa fa-user">4% </i></span>
			            </div>
          			</c:when>
          			<c:when test="${summaryInfo.article_ctgry_id==2 }">
          				 <div class="col-md-3 col-sm-6 col-xs-9 tile_stats_count">
			              <span class="count_top"><i class="fa fa-user"></i> 지출 게시글</span>
			              <div class="count">${summaryInfo.article_ctgry_ct }</div>
			              <span class="count_bottom"><i class="fa fa-user">4% </i></span>
			            </div>
          			</c:when>
          			<c:when test="${summaryInfo.article_ctgry_id==3 }">
          				 <div class="col-md-3 col-sm-6 col-xs-9 tile_stats_count">
			              <span class="count_top"><i class="fa fa-user"></i> 역제안 게시글</span>
			              <div class="count">${summaryInfo.article_ctgry_ct }</div>
			              <span class="count_bottom"><i class="fa fa-user">4% </i></span>
			            </div>
          			</c:when>
          		</c:choose>
          	</c:forEach>
          	
          	 <div class="col-md-3 col-sm-6 col-xs-9 tile_stats_count">
	             <span class="count_top"><i class="fa fa-user"></i>총 태그 수</span>
	             	<div class="count">${hashTagTotalCt }</div>
	             <span class="count_bottom"><i class="fa fa-user">4% </i></span>
             </div>
          </div>
          <!-- /top tiles -->

          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="dashboard_graph">

                <div class="row x_title">
                  <div class="col-md-6">
                    <h3>게시글 통계 <small>등록 해시태그</small></h3>
                  </div>
                  <div class="col-md-6">
                    <!-- <div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
                      <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                      <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                    </div> -->
                  </div>
                </div>

                <div id="container"></div>
                <div class="clearfix"></div>
              </div>
            </div>

          </div>
          <br />

          <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_340">
                <div class="x_title">
                  <h2>해시태그 상위 7개 태그</h2>
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
                  <c:forEach var="hashTopInfo" items="${hashTopList}">
                  <div class="widget_summary">
                    <div class="w_left w_25">
                      <span>${hashTopInfo.hashtag_value }</span>
                    </div>
                    <div class="w_center w_55">
                      <div class="progress">
                        <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${Math.ceil(hashTopInfo.hashtag_count/ hashTagTotalCt * 100*10)/10}%;">
                          <span class="sr-only">${Math.ceil(hashTopInfo.hashtag_count/ hashTagTotalCt * 100*10)/10}% Complete</span>
                        </div>
                      </div>
                    </div>
                    <div class="w_right w_20">
                      <span>${hashTopInfo.hashtag_count }(${Math.round(hashTopInfo.hashtag_count/ hashTagTotalCt * 100*10)/10}%)</span>
                    </div>
                    <div class="clearfix"></div>
                   </div>
					</c:forEach>
                </div> 
            </div>
            </div>

        
			<div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_340">
                <div class="x_title">
                  <h2>게시글 카테고리 등록 현황</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 	<div id="categoryChart"  style="min-width: 300px; height: 280px; max-width: 310px; margin: 0 auto"></div>
                </div>
              </div>
            </div>
			
			

            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel tile fixed_height_340">
                <div class="x_title">
                  <h2>게시글 등록현황(최근5일)</h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 	<div id="registCtChart"  style="min-width: 300px; height: 280px; max-width: 310px; margin: 0 auto"></div>
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


    <!-- jQuery -->
    <script src="/salmon/resources/adminTemplate/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/salmon/resources/adminTemplate/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/salmon/resources/adminTemplate/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/salmon/resources/adminTemplate/vendors/nprogress/nprogress.js"></script>
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
	/*워드크라우드 */
	var wordData = [];
	<c:forEach var="word" items="${wordList}">
		var wordTemp = [];
		wordTemp.push('${word.hashtag_value}');
		wordTemp.push(${word.hashtag_ct});
		wordData.push(wordTemp);
	</c:forEach>
	
	/*파이차트*/
	var pieDataSet = [];
	<c:forEach var="articleCtgry" items="${artiCtgryList}">
    	var tempPieData = [];
    	tempPieData.push("${articleCtgry.ctgry_name }");
    	tempPieData.push(${Math.round(articleCtgry.ctgry_ct/ articleCtgryTotal * 100*10)/10});
        pieDataSet.push(tempPieData);
    </c:forEach>
	 console.log(pieDataSet);
	
	//라인차트
	var nowDate = new Date();
	nowDate.getDate();
	var getNow = nowDate.getFullYear() +'-' + (nowDate.getMonth()+1) +'-'+ nowDate.getDate();
	
	function setYesterday(date){
		var dateRegistSet = [];
		
		for(var i = 4; i>= 0; i--){
		    var selectDate = date.split("-");
		    var changeDate = new Date();
		    changeDate.setFullYear(selectDate[0], selectDate[1]-1, selectDate[2]-i);
		    
		    var y = changeDate.getFullYear();
		    var m = changeDate.getMonth() + 1;
		    var d = changeDate.getDate();
		    if(m < 10)    { m = "0" + m; }
		    if(d < 10)    { d = "0" + d; }
		    var resultDate = y + "-" + m + "-" + d;
		    dateRegistSet.push(resultDate);
		}
		
	    return dateRegistSet;
	}
	
	var registDateSet = setYesterday(getNow);

	var registIncomeDataSet= {};
	var tempIncomeDataSet = [];
	for(var t=0; t<registDateSet.length; t++){
		var check = true;
		<c:forEach var="incomeTemp" items="${registCtIncomeList}">
			if(registDateSet[t]=='${incomeTemp.regist_date}'){
				tempIncomeDataSet.push(${incomeTemp.regist_ct});
				check = false;
			}
		</c:forEach>
		if(check){
			tempIncomeDataSet.push(0);
		}
	}

	registIncomeDataSet["name"]="수입";
	registIncomeDataSet["data"]=tempIncomeDataSet;
	
	var registSpendDataSet= {};
	var tempSpendDataSet = [];
	for(var t=0; t<registDateSet.length; t++){
		var check = true;
		<c:forEach var="spendTemp" items="${registCtSpendList}">
			if(registDateSet[t]=='${spendTemp.regist_date}'){
				tempSpendDataSet.push(${spendTemp.regist_ct});
				check = false;
			}
		</c:forEach>
		if(check){
			tempSpendDataSet.push(0);
		}
	}

	registSpendDataSet["name"]="지출";
	registSpendDataSet["data"]=tempSpendDataSet;
	
	console.log(registSpendDataSet);
	console.log(registIncomeDataSet);
	
	var registTotalDataSet = [];
	registTotalDataSet.push(registSpendDataSet);
	registTotalDataSet.push(registIncomeDataSet);
	
	console.log(registTotalDataSet);
	
	 
	</script>
	
	<!-- 안녕차트  -->
	<script>
	console.log(wordData);
	Highcharts.chart('container', {
    series: [{
        type: 'wordcloud',
        data: wordData,
        name: 'Occurrences'
    }],
    title: {
        text: '해시태그 워드클라우드'
    }
});	
	
	Highcharts.chart('categoryChart', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: 0,
	        plotShadow: false
	    },
	    title: {
	        text: '게시글<br>등록 카테고리',
	        align: 'center',
	        verticalAlign: 'middle',
	        y: 40
	    },
	    tooltip: {
	        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	    },
	    plotOptions: {
	        pie: {
	            dataLabels: {
	                enabled: true,
	                distance: -50,
	                style: {
	                    fontWeight: 'bold',
	                    color: 'white'
	                }
	            },
	            startAngle: -90,
	            endAngle: 90,
	            center: ['50%', '75%'],
	            size: '110%'
	        }
	    },
	    series: [{
	        type: 'pie',
	        name: 'Browser share',
	        innerSize: '50%',
	        data: pieDataSet
	    }]
	});
	
	//카테고리 종류에 따른 게시글 등록 현황
		Highcharts.chart('registCtChart', {
		    chart: {
		        type: 'area'
		    },
		    title: {
		        text: '게시글 등록현황(수입/지출)'
		    },
		    xAxis: {
		    	categories: registDateSet,
		        tickmarkPlacement: 'on',
		        title: {
		            enabled: false
		        }
		    },
		    yAxis: {
		        title: {
		            text: '(건)'
		        },
		        labels: {
		            formatter: function () {
		                return this.value;
		            }
		        }
		    },
		    tooltip: {
		        pointFormat: '{series.name} had stockpiled <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
		    },
		    plotOptions: {
		        area: {
		            marker: {
		                symbol: 'circle',
		                radius: 2,
		                states: {
		                    hover: {
		                        enabled: true
		                    }
		                }
		            }
		        }
		    },
		    series: registTotalDataSet
		});

	</script>
	
  </body>
</html>
