<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <link rel="stylesheet" href="/salmon/resources/sjh/css/main-sjh.css">
  <link rel="stylesheet" href="/salmon/resources/sjh/css/article.css">
  <link rel="stylesheet" href="/salmon/resources/sjh/css/card-sjh.css">
  
  <link rel="stylesheet" href="/salmon/resources/template/style/idangerous.swiper.css">
  <link rel="stylesheet" href="/salmon/resources/jjw/css/stylesheet_jjw.css">
  <link rel="stylesheet" href="/salmon/resources/jjw/css/common.css">
  <link rel="stylesheet" href="/salmon/resources/jjw/css/stylesheet_jjw.css">
  <link rel="stylesheet" href="/salmon/resources/jjw/css/owl.carousel.min.css">
  <link rel="stylesheet" href="/salmon/resources/jjw/css/owl.theme.default.min.css">

  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <script src="https://code.highcharts.com/modules/export-data.js"></script>


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link rel="stylesheet" href="/salmon/resources/sjh/css/sns-feeds.css">
 
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
              <div class="row">
              	<div class="col-md-6">
              		<div class="custom-column-6">
               			<div id="containerIncome" style="min-width: 30%; height: 400px; max-width: 70%; margin: 0 auto"></div>
               		</div>
               	</div>
               	<div class="col-md-6">
               		<div class="custom-column-4">
               			<div id="containerSpend" style="min-width: 30%; height: 400px; max-width: 90%; margin: 0 auto"></div>
               		</div>
                </div>
                </div>
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
  
  </div>
  
    <div class="container-fluid custom-container">
    <div class="row">

      <div class="col-md-2 left-feild">
      
      	<div class="be-vidget">
	        <div class="creative_filds_block">
		        <div class="controls">
		        <button type="button" class="control btn btn-default my-btn" data-sort="published-date:asc likes-num:desc comments-num:asc">좋아요순</button>
		        <button type="button" class="control btn btn-default my-btn" data-sort="published-date:asc likes-num:asc comments-num:desc">댓글순</button>
		        <button type="button" class="control btn btn-default my-btn" data-sort="published-date:desc likes-num:asc comments-num:asc">최신순</button>
		        </div>
	        </div>
       	</div>
       	
       	
        <div class="be-vidget">
          <h3 class="letf-menu-article">소모임 선택</h3>
          <div class="creative_filds_block">
            <div class="ul">
              <a data-filter="all" class="filter">전체글 </a>
              <c:choose>
              <c:when test="${groupList.size() ==0 }">
               가입한 그룹이 없습니다
              </c:when>
              <c:otherwise>
              <c:forEach var="group" items="${groupList}">
              	<a data-filter=".group-<c:out value="${group.group_id}"/>" class="filter">${group.group_title}</a>
              </c:forEach>
              </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
        
        <div class="be-vidget">
          <h3 class="letf-menu-article">
            인기 해시태그
          </h3>
          <div class="tags_block clearfix">
          
            <ul>
            <li><a data-filter="all" class="filter">전체 (${hashTagList.size()})</a></li>
            <c:if test="${hashTagList.size() > 0 }">
            <c:set var="ctHash" value="1" />
            <c:forEach var="hashTag" items="${hashTagList }">
              <c:if test="${ctHash<10 }">
              <li><a data-filter=".category-hashTag-${hashTag.hashtag_value }" class="filter">${hashTag.hashtag_value }(${hashTag.count_hashtag_value})</a></li>
              </c:if>
              <c:set var="ctHash" value="${ctHash+1 }"/>
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
        
        <div class="be-large-post info-block">
		 <h2>내 주변 활동이 없습니다. 지금 주변을 둘러보고 팔로우를 시작하세요! </h2>
         <h3><a href="/salmon/sns/showall">둘러보기</a></h3>
		</div>

        </c:if>
        <c:if test="${articleList.size() > 0 }">
        <c:forEach var="article" items="${articleList }">
        <c:forEach var="hashLoop" items="${article.hashtags }">
       		<c:set var="tag" scope="page" value="${tag } category-hashTag-${hashLoop }"/>
       	</c:forEach>
       
       <c:choose>
       <c:when test="${article.group_id >0}">
       		<div class="mix custom-column-3 ${tag} group-<c:out value="${group.group_id}"/>"  
       		data-published-date="${article.article_regdate}" 
	        data-likes-num="${article.likes.size()}" data-comments-num="${article.comments.size()}">
       </c:when>
       <c:otherwise>
        	<div class="mix custom-column-3 ${tag} "  data-published-date="${article.article_regdate}" 
	        data-likes-num="${article.likes.size()}" data-comments-num="${article.comments.size()}">
       </c:otherwise>
       </c:choose>
	  
       <%-- 
          <div class="category-1 mix custom-column-3 ${tag }">
             --%>
            
            <div id="article-post-<c:out value="${article.article_id}"/>" class="be-post-sjh">
              <a class="be-img-block">
              <c:if test="${article.imagePaths.size()==0 }">
              	<div class="article-size">
              		<div class="padding-1-sjh">
              			<c:out value="${article.article_content}"/>
              		</div>
              	</div>
              	<!-- <img src="/salmon/resources/hjh/images/noimage.gif" alt="img"> -->
              </c:if>
              <c:if test="${article.imagePaths.size()>0 }">
                <c:set var="imgCt" value="1"/>
	          	<c:forEach var="images" items="${article.imagePaths}">
                <div class="article-size" style="text-align:center;">
                  <c:if test="${imgCt < 2 }">
                  <img src="/salmon/main/image?fileName=${images }" alt="img">
                  </c:if>
                </div>
                <c:set var="imgCt" value="${imgCt+1 }"/>
	            </c:forEach>
              </c:if>
              </a>              
              <a id="article-title-<c:out value="${article.article_id}"/>" class="be-post-title">
                ${article.article_title}
               <!--
             	<c:if test="${article.imagePaths.size()>0 }">
             		<c:set var="imgCt" value="1"/>
              	<c:forEach var="images" items="${article.imagePaths}">
              	<c:if test="${imgCt < 2 }">
                  <img src="/salmon/main/image?fileName=${images }" alt="img">
                </c:if>
                	<c:set var="imgCt" value="${imgCt+1 }"/>
                </c:forEach>
              </c:if>
              --> 

              </a>
              <span>
              	<c:forEach var="tag" items="${article.hashtags }">
                	<a href="blog-detail-2.html" class="be-post-tag">${tag } </a>
                </c:forEach>
              </span>
              <div class="author-post">
                <img src="/salmon/resources/template/img/a1.png" alt="" class="ava-author">
                <span>by 
                <a href="/salmon/sns/feeds?userid=${article.user_nickname}">${article.user_nickname}</a>
                </span>
              </div>
              <div class="info-block">
                <span><i class="far fa-thumbs-up"></i>
                	<%--좋아요 --%>
                	<c:out value="${article.likes.size()}"/>
                </span>
                <span><i class="fas fa-comment"></i>
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
  <%@ include file="/WEB-INF/views/includes/logout.jsp"%>
  <!--  로그아웃 팝업 끝-->
  
  <!-- 게시글 모달 -->
<%@ include file="/WEB-INF/views/includes/articlemodal.jsp"%>
  <!--  게시글 모달끝 -->
  
  <!-- 게시글 신고 모달 -->
<%@ include file="/WEB-INF/views/includes/reportModal.jsp"%>
<%@ include file="/WEB-INF/views/includes/reportConfirmModal.jsp"%>
  <!--  게시글 신고 모달끝 -->

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
<!--   <script src="/salmon/resources/template/script/jquery.mixitup.js"></script> -->
  <script src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>
  <script src="/salmon/resources/template/script/filters.js"></script>
  <script src="/salmon/resources/template/script/global.js"></script>
  <script src="/salmon/resources/sjh/js/main-article.js"></script>
  <script src="/salmon/resources/jjw/js/owl.carousel.min.js"></script>
  
  
	<script type="text/javascript">
	var articlelist;
	var me;
	$(function(){ 
		  //article 불러오기
		  var article= new Object();
		  articlelist= ${articleListJSON};
		  var i=0;
		 
		  $(articlelist).each(function(i,e){
			  console.log(e);
		  });
		  
		//  $('#myfeed-btn').trigger('click'); //필터 적용
		  
		  //내정보 불러오기
		  me= ${meJSON};
		})
	</script>
	
	<!--  게시글 정렬  -->
 	<script src="/salmon/resources/sjh/js/mixitup.min.js"></script>
    <script>
    var containerEl = document.querySelector('#container-mix');
    var mixer = mixitup(containerEl, {
                load: {
                    sort: 'published-date:desc likes-num:asc comments-num:asc'
                }
    			
    			/* 	,
                animation: {
                	duration: 200
               } */
            });

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
  
  <jsp:useBean id="today" class="java.util.Date" />
  
  <!-- data만들기 -->
  <script>
  var incomeData = [];
  <c:set var="chartIncomeInfo" scope="page" value="${mainchartIncomeInfo}"/>
  <c:forEach var='categoryIncomeInfo' items='${chartIncomeInfo.ctGroupFee}'>
  	var categoryBlock = {};
  	categoryBlock['name']='${categoryIncomeInfo.ctgry_name}';
  	categoryBlock['y']=parseFloat(parseFloat('${categoryIncomeInfo.ctgry_fee_sum/chartIncomeInfo.totalFee*100}').toFixed(2));
  	incomeData.push(categoryBlock);
  </c:forEach>
  console.log(incomeData);
  var spendData = [];
  <c:set var="chartSpendInfo" scope="page" value="${mainchartSpendInfo}"/>
  <c:forEach var='categorySpendInfo' items='${chartSpendInfo.ctGroupFee}'>
  	var categoryBlock = {};
  	categoryBlock['name']='${categorySpendInfo.ctgry_name}';
  	categoryBlock['y']=parseFloat(parseFloat('${categorySpendInfo.ctgry_fee_sum/chartSpendInfo.totalFee*100}').toFixed(2));
  	spendData.push(categoryBlock);
  </c:forEach>
  console.log(spendData);
  </script>
  
  <script>
    Highcharts.createElement('link', {
      href: 'https://fonts.googleapis.com/css?family=Unica+One',
      rel: 'stylesheet',
      type: 'text/css'
    }, null, document.getElementsByTagName('head')[0]);

    Highcharts.theme = {
    	    colors: ['#7cb5ec', '#f7a35c', '#90ee7e', '#7798BF', '#aaeeee', '#ff0066',
    	        '#eeaaee', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
    	    chart: {
    	        backgroundColor: null,
    	        style: {
    	            fontFamily: 'Dosis, sans-serif'
    	        }
    	    },
    	    title: {
    	        style: {
    	            fontSize: '16px',
    	            fontWeight: 'bold',
    	            textTransform: 'uppercase'
    	        }
    	    },
    	    tooltip: {
    	        borderWidth: 0,
    	        backgroundColor: 'rgba(219,219,216,0.8)',
    	        shadow: false
    	    },
    	    legend: {
    	        itemStyle: {
    	            fontWeight: 'bold',
    	            fontSize: '13px'
    	        }
    	    },
    	    xAxis: {
    	        gridLineWidth: 1,
    	        labels: {
    	            style: {
    	                fontSize: '12px'
    	            }
    	        }
    	    },
    	    yAxis: {
    	        minorTickInterval: 'auto',
    	        title: {
    	            style: {
    	                textTransform: 'uppercase'
    	            }
    	        },
    	        labels: {
    	            style: {
    	                fontSize: '12px'
    	            }
    	        }
    	    },
    	    plotOptions: {
    	        candlestick: {
    	            lineColor: '#404048'
    	        }
    	    },


    	    // General
    	    background2: '#F0F0EA'

    	};

    // 카테고리별 분포
    Highcharts.setOptions(Highcharts.theme);


    Highcharts.chart('containerIncome', {
      chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
      },
      title: {
        text: '<fmt:formatDate value="${today}" type="DATE" pattern="MM"/>월 수입 현황'
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
        data: incomeData
      }]
    });
    
    Highcharts.chart('containerSpend', {
        chart: {
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false,
          type: 'pie'
        },
        title: {
          text: '<fmt:formatDate value="${today}" type="DATE" pattern="MM"/>월 지출 현황'
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
          data: spendData
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