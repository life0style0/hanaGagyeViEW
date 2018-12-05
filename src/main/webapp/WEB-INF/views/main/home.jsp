<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <title>HANA 가계ViEW</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="shortcut icon" href="/salmon/resources/template/img/favicon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/salmon/resources/template/style/bootstrap.min.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/salmon/resources/template/style/icon.css">
  <link rel="stylesheet" href="/salmon/resources/template/style/loader.css">
  <link rel="stylesheet" href="/salmon/resources/template/style/idangerous.swiper.css">
  <link rel="stylesheet" href="/salmon/resources/template/style/jquery-ui.css">
  <link rel="stylesheet" href="/salmon/resources/template/style/stylesheet.css">
  <link rel="stylesheet" href="/salmon/resources/jjw/css/stylesheet_jjw.css">
  <link rel="stylesheet" href="/salmon/resources/sjh/css/main-sjh.css">
  <link rel="stylesheet" href="/salmon/resources/sjh/css/article.css">
  <link rel="stylesheet" href="/salmon/resources/sjh/css/card-sjh.css">

  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <script src="https://code.highcharts.com/modules/export-data.js"></script>


  <!--[if lt IE 10]>
			<link rel="stylesheet" type="text/css" href="style/ie-9.css" />
		<![endif]-->
  <!--[if lt IE 9]>
		    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
</head>

<body>

  <!-- THE LOADER -->

  <div class="be-loader">
    <div class="spinner">
      <img src="/salmon/resources/template/img/logo-loader.png" alt="">
      <p class="circle">
        <span class="ouro">
          <span class="left"><span class="anim"></span></span>
          <span class="right"><span class="anim"></span></span>
        </span>
      </p>
    </div>
  </div>
  <!-- THE HEADER -->
  <!-- THE HEADER -->
  <%@ include file="/WEB-INF/views/includes/header.jsp"%>

  <!-- MAIN CONTENT -->
  <div id="content-block">
    <div class="head-bg-sjh" id="chartInfoBlock">
      <div class="head-bg-img"></div>
      <div class="head-bg-content font-sjh">
        <h1>당신의 소중한 자산관리 하나에게 맡기세요</h1>
        <p>이제부터 눈으로 가계부를 쓰세요</p>

        <!-- 통계 출력 부분 -->
        <div class="be-large-post-align">
          <div class="tab-wrapper style-2 color-2">
            <div class="tab-nav-wrapper">
              <div class="nav-tab  clearfix">
                <div class="nav-tab-item active">
                  <span>카테고리별 소비 분포</span>
                </div>
                <div class="nav-tab-item ">
                  <span>목표 달성 현황</span>
                </div>
                <div class="stat-sort be-drop-down">
                  <span class="be-dropdown-content"> 월 선택 </span>
                  <ul class="drop-down-list">
                    <li><a>11월</a></li>
                    <li><a>10월</a></li>
                    <li><a>9월</a></li>
                    <li><a>8월</a></li>
                    <li><a>7월</a></li>
                  </ul>
                </div>
              </div>

            </div>
            <div class="tabs-content clearfix">
              <div class="tab-info chart-info  active">
                <div id="container" style="min-width: 30%; height: 300px; max-width: 40%px; margin: 0 auto"></div>
              </div>
              <div class="tab-info chart-info">
                <div id="container2" style="min-width: 30%; height: 300px; max-width: 40%px; margin: 0 auto"></div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>

  <div class="container-fluid cd-main-content custom-container">
    <div class="row">
      <div class="col-md-2 left-feild">
        <form action="./" class="input-search">
          <input type="text" required="" placeholder="Enter keyword">
          <i class="fa fa-search"></i>
          <input type="submit" value="">
        </form>
      </div>
      <div class="col-md-10 ">
        <div class="for-be-dropdowns">
          <div class="be-drop-down">
            <i class="icon-projects"></i>
            <span class="be-dropdown-content"> 닉네임검색 </span>
            <ul class="drop-down-list">
              <li class="filter" data-filter=".category-1"><a data-type="category-1">닉네임검색</a></li>
              <li class="filter" data-filter=".category-2"><a data-type="category-2">해시태그 검색</a></li>
              <li class="filter" data-filter=".category-3"><a data-type="category-3">카테고리 검색</a></li>
            </ul>
          </div>
          <div class="be-drop-down">
            <i class="icon-creative"></i>
            <span class="be-dropdown-content">All Creative Filds
            </span>
            <ul class="drop-down-list">
              <li class="filter" data-filter=".category-4"><a>Item - 1</a></li>
              <li class="filter" data-filter=".category-5"><a>Item - 2</a></li>
              <li class="filter" data-filter=".category-1"><a>Item - 3</a></li>
            </ul>
          </div>
          
          <div>
          	<input type="button" id="infoChangeBtn" class="btn btn-danger" value="통계정보 숨기기">
          </div>

          <!-- 불필요 드랍 박스 주석 -->
          <!-- <div class="be-drop-down">
							<i class="icon-features"></i>
							<span class="be-dropdown-content">Features
							</span>
							<ul class="drop-down-list">
								<li class="filter" data-filter=".category-2"><a>Featured</a></li>
								<li class="filter" data-filter=".category-3"><a>Most Appreciated</a></li>
								<li class="filter" data-filter=".category-4"><a>Most Viewed</a></li>
								<li class="filter" data-filter=".category-5"><a>Most Discussed</a></li>
								<li class="filter" data-filter=".category-1"><a>Most Recent</a></li>
							</ul>
						</div>
						<div class="be-drop-down">
							<i class="icon-worldwide"></i>
							<span class="be-dropdown-content">Worldwide
							</span>
							<ul class="drop-down-list">
								<li class="filter" data-filter=".category-2"><a>WorldWide</a></li>
								<li class="filter" data-filter=".category-3"><a>United States</a></li>
								<li class="filter" data-filter=".category-4"><a>Germany</a></li>
								<li class="filter" data-filter=".category-5"><a>United Kingdom</a></li>
							</ul>
						</div> -->

        </div>
      </div>
    </div>
  </div>
  <div class="container-fluid custom-container">
    <div class="row">

      <div class="col-md-2 left-feild">
        <div class="be-vidget">
          <h3 class="letf-menu-article">
            소모임 선택
          </h3>
          <div class="creative_filds_block">
            <div class="ul">
              <a data-filter=".category-1" class="filter">동적생성 1 </a>
              <a data-filter=".category-2" class="filter">동적생성2 </a>
              <!-- <a data-filter=".category-3" class="filter">Interaction Design	</a>
								<a data-filter=".category-4" class="filter">Art Direction		</a>
								<a data-filter=".category-5" class="filter">Illustration		</a> -->
            </div>
          </div>
        </div>
        <div class="be-vidget">
          <h3 class="letf-menu-article">
            인기 해시태그
          </h3>
          <div class="tags_block clearfix">
            <ul>
            <c:if test="${hashTagList.size() > 0 }">
            <c:forEach var="hashTag" items="${hashTagList }">
              <li><a data-filter=".category-hashTag-${hashTag.hashtag_value }" class="filter">${hashTag.hashtag_value }(${hashTag.count_hashtag_value})</a></li>
            </c:forEach>
            </c:if>
            <c:if test="${hashTagList.size() == 0 }">
              <li>등록된 태그가 없습니다.</li>
            </c:if>
            </ul>
          </div>
        </div>
      </div>

      <div class="col-md-10">
        <div id="container-mix" class="row _post-container_">
        <c:if test="${articleList.size() == 0 }">
        	<div class="category-1 mix custom-column-3">
            <div class="be-post">
             	등록된 게시글이 없습니다.
            </div>
          </div>
        </c:if>
        <c:if test="${articleList.size() > 0 }">
        <c:forEach var="article" items="${articleList }">
        <c:forEach var="hashLoop" items="${article.hashtags }">
       		<c:set var="tag" scope="page" value="${tag } category-hashTag-${hashLoop }"/>
       	</c:forEach>
          <div class="category-1 mix custom-column-3 ${tag }">
            <div class="be-post-sjh">
              <a href="page1.html" class="be-img-block">
              <c:if test="${article.imagePaths.size()==0 }">
              	<div class="article-size">
              		<div class="padding-1-sjh">
              			<c:out value="${article.article_content}"/>
              		</div>
              	</div>
              	<!-- <img src="/salmon/resources/hjh/images/noimage.gif" alt="img"> -->
              </c:if>
              <c:if test="${article.imagePaths.size()>0 }">
	          	<c:forEach var="images" items="${article.imagePaths}">
	          		<div class="article-size" style="text-align:center;">
	            		<img src="/salmon/main/image?fileName=${images }" alt="img">
	            	</div>
	            </c:forEach>
               </c:if>
              </a>
              <a id="article-title-<c:out value="${article.article_id}"/>" class="be-post-title">
              	${article.article_title}
              </a>
              <span>
              	<c:forEach var="tag" items="${article.hashtags }">
                	<a href="blog-detail-2.html" class="be-post-tag">${tag } </a>
                </c:forEach>
              </span>
              <div class="author-post">
                <img src="/salmon/resources/template/img/a1.png" alt="" class="ava-author">
                <span>by <a href="page1.html">${article.user_id }</a></span>
              </div>
              <div class="info-block">
                <span><i class="fa fa-thumbs-o-up"></i>
                	<%--좋아요 --%>
                	<c:out value="${article.likes.size()}"/>
                </span>
                <span><i class="fa fa-eye"></i>
                	<%--스크랩수 --%>
                	<c:out value="${article.scraps.size()}"/>
                </span>
                <span><i class="fa fa-comment-o"></i>
                	<%--댓글수 --%>
                	<c:out value="${article.comments.size()}"/>
                </span>
              </div>
            </div>
          </div>
          </c:forEach>
          </c:if>
          
        </div>
      </div>
    </div>
  </div>
  <!-- </div> -->
  <!-- THE FOOTER -->
  <%@ include file="/WEB-INF/views/includes/footer.jsp"%>

  <div class="be-fixed-filter"></div>

  <!--  로그아웃 팝업 -->
  <div class="large-popup login">
    <div class="large-popup-fixed"></div>
    <div class="container large-popup-container">
      <div class="row">
        <div class="col-md-8 col-md-push-2 col-lg-6 col-lg-push-3  large-popup-content">
          <div class="row">
            <div class="col-md-12">
              <i class="fa fa-times close-button"></i>
              <h5 class="large-popup-title">로그아웃</h5>
            </div>

            <form method="post" action="/salmon/customLogout" class="popup-input-search">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
              <button class="be-popup-sign-button">로그아웃</button>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
  <!--  로그아웃 팝업 끝-->
  
  <!-- 게시글 모달 -->
<div class="modal fade ggv-modal blog-list" id="ggv-modal" tabindex="-1" role="dialog" aria-labelledby="ggv-modal-label"
       aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-body">
                  <div class="blog-post">
                     <div class="row">
                        <div class="col-xs-12 col-sm-6 h-404">
                           <div class="post-preview">
                              <div class="ggv-carousel owl-carousel owl-theme">
                              </div>
                           </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 h-404">
                           <div class="post-desc">
                              <div class="post-category">Art, Street, Drawing</div>
                              <div id="article-modal-title" class="post-label">
                              	<!-- 게시글 제목 -->
                              </div>
                              <div class="post-text">
                                 Morbi efficitur feugiat erat a efficitur. Donec interdum, nunc ac elementum auctor,
                                 dui nisl placerat odio, eget sagittis sem neque venenatis libero. Vestibulum pharetra sollicitudin urna nec
                                 eleifend.Suspendisse id augue ut nunc vestibulum euismod. Donec a libero ut lectus ullamcorper rhoncus vel
                                 quis erat. Nunc ornare sed dolor sed mattis.</div>
                              <div class="author-post">
                                 <img src="img/a1.png" alt="" class="ava-author">
                                 <span>by <a href="blog-detail-2.html">Hoang Nguyen</a>, April 23, 2015</span>
                              </div>
                              <div class="info-block">
                                 <span><i class="fa fa-thumbs-o-up"></i> 360</span>
                                 <span><i class="fa fa-eye"></i> 789</span>
                                 <span><i class="fa fa-comment-o"></i> 20</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!--  게시글 모달끝 -->

  <div class="theme-config">
    <div class="main-color">
      <div class="title">Main Color:</div>
      <div class="colours-wrapper">
        <div class="entry color1 m-color active" data-colour="/salmon/resources/template/style/stylesheet.css"></div>
        <div class="entry color3 m-color" data-colour="/salmon/resources/template/style/style-green.css"></div>
        <div class="entry color6 m-color" data-colour="/salmon/resources/template/style/style-orange.css"></div>
        <div class="entry color8 m-color" data-colour="/salmon/resources/template/style/style-red.css"></div>
        <div class="title">Second Color:</div>
        <div class="entry s-color  active color10" data-colour="/salmon/resources/template/style/stylesheet.css"></div>
        <div class="entry s-color color11" data-colour="/salmon/resources/template/style/style-oranges.css"></div>
        <div class="entry s-color color12" data-colour="/salmon/resources/template/style/style-greens.css"></div>
        <div class="entry s-color color13" data-colour="/salmon/resources/template/style/style-reds.css"></div>
      </div>
    </div>
    <div class="open"><img src="/salmon/resources/template/img/icon-134.png" alt=""></div>
  </div>
  
  <!-- SCRIPTS	 -->
  <script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
  <script src="/salmon/resources/template/script/jquery-ui.min.js"></script>
  <script src="/salmon/resources/template/script/bootstrap.min.js"></script>
  <script src="/salmon/resources/template/script/idangerous.swiper.min.js"></script>
  <script src="/salmon/resources/template/script/jquery.mixitup.js"></script>
  <script src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>
  <script src="/salmon/resources/template/script/filters.js"></script>
  <script src="/salmon/resources/template/script/global.js"></script>
  <script src="/salmon/resources/sjh/js/main-article.js"></script>
  
  
	<script type="text/javascript">
	var articlelist;
	$(function(){ 
		  //article 불러오기
		  var article= new Object();
		  articlelist= ${articleListJSON};
		  var i=0;
		  /* 
		  <c:forEach items="${articleListJSON}" var="article">
		  		//console.log(e);
			  articlelist[i]="${article}";
			  i++;
		  </c:forEach>
		 */
		  $(articlelist).each(function(i,e){
			  console.log(e);
		  });
		})
	</script>
	
  
  <script type="text/javascript">
  //재혁쓰
  $("#infoChangeBtn").on("click", function(){
	  if($("#infoChangeBtn").val()=="통계정보 숨기기"){
		  $("#infoChangeBtn").val("통계정보 보기");
		  $("#infoChangeBtn").attr("class","btn btn-primary");
		  $("#chartInfoBlock").hide();
	  }else{
		  $("#infoChangeBtn").val("통계정보 숨기기");
		  $("#infoChangeBtn").attr("class","btn btn-danger");
		  $("#chartInfoBlock").show();
	  }
  });
  </script>
  <!-- data만들기 -->
  <script>
  var data = [];
  <c:set var="chartInfo" scope="page" value="${mainchartInfo}"/>
  <c:forEach var='categoryInfo' items='${chartInfo.ctGroupFee}'>
  	var categoryBlock = {};
  	categoryBlock['name']='${categoryInfo.ctgry_name}';
  	categoryBlock['y']=parseFloat(parseFloat('${categoryInfo.ctgry_fee_sum/chartInfo.totalFee*100}').toFixed(2));
  	data.push(categoryBlock);
  </c:forEach>
  console.log(data);
  </script>
  
  <script>
    Highcharts.createElement('link', {
      href: 'https://fonts.googleapis.com/css?family=Unica+One',
      rel: 'stylesheet',
      type: 'text/css'
    }, null, document.getElementsByTagName('head')[0]);

    Highcharts.theme = {
      colors: ['#2b908f', '#90ee7e', '#f45b5b', '#7798BF', '#aaeeee', '#ff0066',
        '#eeaaee', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'
      ],
      chart: {
        backgroundColor: {
          linearGradient: {
            x1: 0,
            y1: 0,
            x2: 1,
            y2: 1
          },
          stops: [
            [0, '#2a2a2b'],
            [1, '#3e3e40']
          ]
        },
        style: {
          fontFamily: '\'Unica One\', sans-serif'
        },
        plotBorderColor: '#606063'
      },
      title: {
        style: {
          color: '#E0E0E3',
          textTransform: 'uppercase',
          fontSize: '20px'
        }
      },
      subtitle: {
        style: {
          color: '#E0E0E3',
          textTransform: 'uppercase'
        }
      },
      xAxis: {
        gridLineColor: '#707073',
        labels: {
          style: {
            color: '#E0E0E3'
          }
        },
        lineColor: '#707073',
        minorGridLineColor: '#505053',
        tickColor: '#707073',
        title: {
          style: {
            color: '#A0A0A3'

          }
        }
      },
      yAxis: {
        gridLineColor: '#707073',
        labels: {
          style: {
            color: '#E0E0E3'
          }
        },
        lineColor: '#707073',
        minorGridLineColor: '#505053',
        tickColor: '#707073',
        tickWidth: 1,
        title: {
          style: {
            color: '#A0A0A3'
          }
        }
      },
      tooltip: {
        backgroundColor: 'rgba(0, 0, 0, 0.85)',
        style: {
          color: '#F0F0F0'
        }
      },
      plotOptions: {
        series: {
          dataLabels: {
            color: '#B0B0B3'
          },
          marker: {
            lineColor: '#333'
          }
        },
        boxplot: {
          fillColor: '#505053'
        },
        candlestick: {
          lineColor: 'white'
        },
        errorbar: {
          color: 'white'
        }
      },
      legend: {
        itemStyle: {
          color: '#E0E0E3'
        },
        itemHoverStyle: {
          color: '#FFF'
        },
        itemHiddenStyle: {
          color: '#606063'
        }
      },
      credits: {
        style: {
          color: '#666'
        }
      },
      labels: {
        style: {
          color: '#707073'
        }
      },

      drilldown: {
        activeAxisLabelStyle: {
          color: '#F0F0F3'
        },
        activeDataLabelStyle: {
          color: '#F0F0F3'
        }
      },

      navigation: {
        buttonOptions: {
          symbolStroke: '#DDDDDD',
          theme: {
            fill: '#505053'
          }
        }
      },

      // scroll charts
      rangeSelector: {
        buttonTheme: {
          fill: '#505053',
          stroke: '#000000',
          style: {
            color: '#CCC'
          },
          states: {
            hover: {
              fill: '#707073',
              stroke: '#000000',
              style: {
                color: 'white'
              }
            },
            select: {
              fill: '#000003',
              stroke: '#000000',
              style: {
                color: 'white'
              }
            }
          }
        },
        inputBoxBorderColor: '#505053',
        inputStyle: {
          backgroundColor: '#333',
          color: 'silver'
        },
        labelStyle: {
          color: 'silver'
        }
      },

      navigator: {
        handles: {
          backgroundColor: '#666',
          borderColor: '#AAA'
        },
        outlineColor: '#CCC',
        maskFill: 'rgba(255,255,255,0.1)',
        series: {
          color: '#7798BF',
          lineColor: '#A6C7ED'
        },
        xAxis: {
          gridLineColor: '#505053'
        }
      },

      scrollbar: {
        barBackgroundColor: '#808083',
        barBorderColor: '#808083',
        buttonArrowColor: '#CCC',
        buttonBackgroundColor: '#606063',
        buttonBorderColor: '#606063',
        rifleColor: '#FFF',
        trackBackgroundColor: '#404043',
        trackBorderColor: '#404043'
      },

      // special colors for some of the
      legendBackgroundColor: 'rgba(0, 0, 0, 0.5)',
      background2: '#505053',
      dataLabelsColor: '#B0B0B3',
      textColor: '#C0C0C0',
      contrastTextColor: '#F0F0F3',
      maskColor: 'rgba(255,255,255,0.3)'
    };

    // 카테고리별 분포
    Highcharts.setOptions(Highcharts.theme);


    Highcharts.chart('container', {
      chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
      },
      title: {
        text: '기준 월 소비 현황, 12월'
      },
      tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
      },
      plotOptions: {
        pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
            enabled: true,
            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
            style: {
              color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
            }
          }
        }
      },
      series: [{
        name: 'category',
        colorByPoint: true,
        data: data
      }]
    });

    //목표 지출 달성

    Highcharts.chart('container2', {
      chart: {
        type: 'column'
      },
      title: {
        text: '목표지출 달성 현황'
      },
      xAxis: {
        categories: [
          '총 지출',
          '더넣을거잇나..',
          '없겟지?'
        ]
      },
      yAxis: [{
        min: 0,
        title: {
          text: 'Employees'
        }
      }, {
        title: {
          text: 'Profit (millions)'
        },
        opposite: true
      }],
      legend: {
        shadow: false
      },
      tooltip: {
        shared: true
      },
      plotOptions: {
        column: {
          grouping: false,
          shadow: false,
          borderWidth: 0
        }
      },
      series: [{
        name: 'Employees',
        color: 'rgba(165,170,217,1)',
        data: [150, 73, 20],
        pointPadding: 0.3,
        pointPlacement: -0.2
      }, {
        name: 'Employees Optimized',
        color: 'rgba(126,86,134,.9)',
        data: [140, 90, 40],
        pointPadding: 0.4,
        pointPlacement: -0.2
      }, {
        name: 'Profit',
        color: 'rgba(248,161,63,1)',
        data: [183.6, 178.8, 198.5],
        tooltip: {
          valuePrefix: '$',
          valueSuffix: ' M'
        },
        pointPadding: 0.3,
        pointPlacement: 0.2,
        yAxis: 1
      }, {
        name: 'Profit Optimized',
        color: 'rgba(186,60,61,.9)',
        data: [203.6, 198.8, 208.5],
        tooltip: {
          valuePrefix: '$',
          valueSuffix: ' M'
        },
        pointPadding: 0.4,
        pointPlacement: 0.2,
        yAxis: 1
      }]
    });
  </script>
</body>

</html>