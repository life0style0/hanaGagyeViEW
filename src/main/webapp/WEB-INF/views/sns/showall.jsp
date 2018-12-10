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
  
  <link rel="stylesheet" href="/salmon/resources/sjh/css/sns-feeds.css">

  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <script src="https://code.highcharts.com/modules/export-data.js"></script>


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
  
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
  	<div class="head-bg">
      <div class="head-bg-img" style="padding-top: 225px; 
      background-image: url(/salmon/resources/sjh/img/telescope.jpg); 
      background-position: 50% 50%; background-repeat: no-repeat; opacity: 0.8;"></div>
     <!--  <div class="head-bg-content"></div> -->
      <div class="head-bg-content font-sjh">
        <h1> 둘러보기 </h1>
        <p> 다른 분들은 어떤 소비를 하고 있을까요? </p>
      </div>
    </div>
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
              <c:when test="${groupsBynewArticleList.size() ==0 }">
               <div class="empty-alert">조회된 그룹이 없습니다</div> 
              </c:when>
              <c:otherwise>
              <c:forEach var="group" items="${groupsBynewArticleList}">
              	<a data-filter=".group-<c:out value="${group.group_id}"/>" class="filter">${group.group_title}</a>
              </c:forEach>
              </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
        
        <div class="be-vidget">
          <h3 class="letf-menu-article">인기 해시태그</h3>
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
              <li><div class="empty-alert">등록된 태그가 없습니다.</div></li>
            </c:if>
            </ul>
          </div>
        </div>
      </div>

      <div class="col-md-10">
        <div id="container-mix" class="row _post-container_">
        
        
        <c:if test="${newArticleList.size() == 0 }">
        	<!-- <div class="category-my mix custom-column-3"> -->
        	<div name="myfeed-article" class="mix custom-column-3">
            <div class="be-post">
             	등록된 게시글이 없습니다.
            </div>
            </div>
        </c:if>
        
        
        <c:if test="${newArticleList.size() > 0 }">
        <c:forEach var="article" items="${newArticleList }">
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
	    
            <div id="article-post-<c:out value="${article.article_id}"/>" class="be-post-sjh" 
            style="background-color:#cecece1f">
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
  <script src="/salmon/resources/template/script/jquery.mixitup.js"></script>
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
		  articlelist= ${newArticleListJSON};
		  var i=0;
		 
		  $(articlelist).each(function(i,e){
			  console.log(e);
		  });
		  
		//  $('#myfeed-btn').trigger('click'); //필터 적용
		  
		  //내정보 불러오기
		  me= ${meJSON};
		  console.log(me);
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
            });
        </script>
	
  
 
</body>

</html>