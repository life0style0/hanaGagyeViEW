<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	  <link rel="stylesheet" href="/salmon/resources/sjh/css/sns-feeds.css">
	
	<!-- font awsome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<!-- jjw 프로필사진 -->
	<!-- <link rel="stylesheet" href="/salmon/resources/jjw/css/croppie.css"> -->
		
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
		<div class="container custom-container be-detail-container">

			<div class="col-md-3">
				<div class="be-user-block">
					<div class="be-user-detail">
					
					<input type="hidden" id="profilePath" value="/salmon/image?fileName=${user.user_image}">
					<img class="img-responsive" id="profileImage" alt="">
							
						<!-- <a class="be-ava-user" href="blog-detail-2.html"> 
							<img src="img/ava.png" alt="">
						</a> -->
						<p class="be-use-name">
							<c:out value="${user.user_nickname}" />
						</p>
						<span class="be-user-info"> <c:out value="${user.user_id}" />
						</span>
					</div>
					<div class="be-user-activity-block">
						<div class="row">
							<div class="col-lg-12">
							<c:choose>
							<c:when test="${follow eq 'followable'}">
								<a id="follow-ask-do-<c:out value="${user.user_id}"/>"
									class="ask-follow">
									<i class="far fa-heart"></i>
									FOLLOW
								</a>
							</c:when>
							<c:when test="${follow eq 'unfollowable'}">
								<a id="follow-ask-undo-<c:out value="${user.user_id}"/>"
									class="ask-follow">
									<i class="fa fa-heart"></i>
									UNFOLLOW
								</a>
							</c:when>
							<c:otherwise>
								<a id="follow-ask-mypage" class="ask-follow">
									<i class="fa fa-leaf"></i>
									MYPAGE
								</a>
								<a id="write-article" href="/salmon/article/register" class="ask-follow">
									<i class="fas fa-pen"></i>
									글쓰기
								</a>
							</c:otherwise>
							</c:choose>
								
								<%-- <a id="follow-ask-do-<c:out value="${user.user_id}"/>"
									class="ask-follow">
									<i class="fa fa-plus"></i>
									FOLLOW
								</a> --%>
								<%-- <a id="follow-ask-undo-<c:out value="${user.user_id}"/>"
									class="ask-follow">
									<i class="fa fa-plus"></i>
									UNFOLLOW
								</a> --%>
							</div>
							<!-- <div class="col-lg-6">
								<a href="blog-detail-2.html"
									class="col-lg-6 be-user-activity-button send-btn be-message-type"><i
									class="fa fa-envelope-o"></i>MESSAGE</a>
							</div> -->
						</div>
					</div>
					<h5 class="be-title">관심사</h5>
					<c:choose>
					<c:when test="${fn:length(userPsnsInfo.ctgryNames) > 0}">
						<c:forEach var="category" items="${userPsnsInfo.ctgryNames}">
							<p class="be-text-userblock">
							<c:out value="${category}"/>
							</p>
						</c:forEach>
					</c:when>
					</c:choose>
				</div>
				<!-- 
				<a href="blog-detail-2.html"
					class="be-button-vidget like-btn blue-style"><i
					class="fa fa-thumbs-o-up"></i>LIKE PROJECT</a> 
				<a
					href="blog-detail-2.html"
					class="be-button-vidget add-btn grey-style"><i
					class="fa fa-file-o"></i>ADD TO COLLECTION</a> -->

				<div id="following-user-list" class="be-user-block">
					<h3 class="letf-menu-article text-center">팔로잉하는 사용자</h3>
					<div style="background-color:beige;">
					<c:choose>
					<c:when test="${followingList.size() != 0}">
						<c:forEach var="followingUser" items="${followingList}">
						<!-- <div class="following-user-info"> -->
							<a class="following-user-info" href="/salmon/sns/feeds?userid=${followingUser.user_id}">
								<c:out value="${followingUser.user_nickname}"/>
								(<c:out value="${followingUser.user_id}"/>)
							</a>
						<!-- 	</div> -->
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div>팔로잉을 시작하세요!</div>
					</c:otherwise>
					</c:choose>
					</div>
				</div>
				<div id="joinging-group-list"  class="be-user-block">
					<h3 class="letf-menu-article text-center">가입한 모임</h3>
					<div style="background-color:beige;">
					<c:choose>
					<c:when test="${groupList.size() != 0}">
						<c:forEach var="group" items="${groupList}">
						<!-- <div class="following-user-info"> -->
							<a class="following-user-info" href="">
								<c:out value="${group.group_title}"/>
							</a>
						<!-- 	</div> -->
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div>모임에 참여하세요!</div>
					</c:otherwise>
					</c:choose>
					</div>
				</div>
				<!-- <div class="swiper-container" data-loop="1" data-speed="500"
					data-center="0" data-slides-per-view="1">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div class="be-post">
								<a href="blog-detail-2.html" class="be-img-block"> <img
									src="img/p9.jpg" height="202" width="269" alt="omg">
								</a> <a href="blog-detail-2.html" class="be-post-title">NAHA
									Finalist Hairstylist of the Year Allen Ruiz</a> <span> <a
									href="blog-detail-2.html" class="be-post-tag">Art direction</a>,
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>,
									<a href="blog-detail-2.html" class="be-post-tag">Interactiob
										design</a>
								</span>
								<div class="author-post">
									<img src="img/ava.png" alt="" class="ava-author"> <span>by
										<a href="blog-detail-2.html">Daniel Ng</a>
									</span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 253</span> <span><i
										class="fa fa-eye"></i> 753</span> <span><i
										class="fa fa-comment-o"></i> 50</span>
								</div>
							</div>
						</div>
					</div>
					<div class="pagination"></div>
				</div> -->
			</div>

			<div class="col-md-9 article-menu-bar">
				<div id="myArticles-btn" class="col-md-4 article-menu">내 게시글</div>
				<div id="likeArticles-btn" class="col-md-4 article-menu">좋아요한 게시글</div>
			</div>

			<div class="row col-md-9" id="myArticles">
			<c:choose>
			<c:when test="${myArticles.size() != 0}">
			<c:forEach var="myArticle" items="${myArticles}">
				<div style="background-color: beige;">
				<!-- <div class="col-md-9 col-md-push-3" style="background-color: crimson;"> -->
					
					<div class="be-large-post">
						<div class="info-block">
							<div class="be-large-post-align">
								<span><i class="fa fa-thumbs-o-up"></i>
									<%--좋아요 --%>
                					<c:out value="${myArticle.likes.size()}"/>
								</span>
								<span><i class="fa fa-eye"></i>
									<%--스크랩수 --%>
	                				<c:out value="${myArticle.scraps.size()}"/>
								</span>
								<span><i class="fa fa-comment-o"></i>
									<%--댓글수 --%>
	                				<c:out value="${myArticle.comments.size()}"/>
								</span>
							</div>
						</div>
						<!-- <div class="blog-content popup-gallery be-large-post-align"> -->
						<div class="blog-content be-large-post-align">
							<h5 class="feed-article-title">
								<c:out value="${myArticle.article_title}"></c:out>
							</h5>
							<%-- 
							<span class="be-text-tags">
							<c:forEach var="tag" items="${myArticle.hashtags}">
								<a href="blog-detail-2.html" class="be-post-tag">${tag}</a>, 
			                </c:forEach>
							</span>
							 --%>
							<div class="clear"></div>
							<div class="post-text">
								<p> 
								${myArticle.article_content}
								</p>

								<!-- <div class="image-block">
								    <a class="popup-a" href="img/l1.jpg">
									<img src="/salmon/resources/sjh/img/l1.jpg" alt="">
									</a>
									<div class="image-text">Ut pulvinar tellus sed elilectus eros, quis sollicitudin lacinia.</div>
								</div> -->
								  <!--   <a class="popup-a" href="img/l2.jpg">
									<img src="/salmon/resources/sjh/img/l2.jpg" alt="" style="height:100px">
									</a> -->
								
								<img alt="" style="height:100px">								

							</div>
						</div>
						<div class="be-large-post-align">
							<h3 class="letf-menu-article">
								Tags
							</h3>
							<div class="tags_block clearfix">
								<ul>
								<c:choose>
								<c:when test="${myArticle.hashtags.size() ne 0}">
									<c:forEach var="tag" items="${myArticle.hashtags}">
										<li><a href="">${tag}</a></li>
				                	</c:forEach>
								</c:when>
								<c:otherwise>
									<li>태그가 없습니다</li>
								</c:otherwise>
								</c:choose>
								</ul>
							</div>
						</div>						
					</div>
				
					<div class="be-comment-block">
						<h1 class="comments-title">Comments (<c:out value="${myArticle.comments.size()}"/>)</h1>
						<p class="about-comment-block">
							<!-- You must <a href="blog-detail-2.html" class="be-signup-link">SIGN UP</a>
							 to join the conversation. -->
						</p>
						
						<c:choose>
						<c:when test="${myArticle.comments.size() ne 0}">
							<c:forEach var="comment" items="${myArticle.comments}">
							<div class="be-comment">
									<div class="be-img-comment">	
										<a href="/salmon/sns/feeds?userid=${comment.user_id}">
											<img src="img/c1.png" alt="" class="be-ava-comment">
										</a>
									</div>
									<div class="be-comment-content">
										<span class="be-comment-name">
										<a href="/salmon/sns/feeds?userid=${comment.user_id}">
										${comment.user_nickname}
										</a>
										</span>
										<span class="be-comment-time">
										<i class="fa fa-clock-o"></i>
										${comment.comment_regdate}
										</span>
										<p class="be-comment-text">
										${comment.comment_content}
										</p>
									</div>
								</div>
							</c:forEach>
							</c:when>
							<c:otherwise>
							</c:otherwise>
							</c:choose>

						<form id="reply-form-${myArticle.article_id}" method="get">
							<input type="hidden" name="article_id" value="${myArticle.article_id}">
							<c:out value="${user.user_nickname}"/>
							<input type="text" name="comment_content" required="required">
							<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> --%>
							<input type="button" id="reply-write-btn-${myArticle.article_id}" value="등록">
						</form>

					</div>
				</div>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="be-large-post info-block">
						<h3>아직 게시글이 없습니다</h3>
					</div>
				</c:otherwise>
				</c:choose>
			</div>
			
			<div class="row col-md-9" id="likeArticles">
			좋아요 한 게시글
			</div>
		</div>
	</div>
	
	
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
<!-- 	
	<div class="large-popup send-m">
		<div class="large-popup-fixed"></div>
		<div class="container large-popup-container">
			<div class="row">
				<div class="col-md-10 col-md-push-1 col-lg-8 col-lg-push-2 large-popup-content">
					<div class="row">
						<div class="col-md-12">
							<i class="fa fa-times close-m close-button"></i>
							<h5 class="large-popup-title">Send message</h5>
						</div>
						<form action="./" class="popup-input-search">
							<div class="col-md-6">
								<input class="input-signtype" type="text" required="" placeholder="First Name">
							</div>
							<div class="col-md-6">
								<input class="input-signtype" type="text" required="" placeholder="Last Name">
							</div>
							<div class="col-md-6">
								<div class="be-custom-select-block">
									<select class="be-custom-select">
										<option value="" disabled selected>
											Country
										</option>
										<option value="">USA</option>
										<option value="">Canada</option>
										<option value="">England</option>
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<input class="input-signtype" type="email" required="" placeholder="Email">
							</div>
							<div class="col-md-12">
								<textarea class="message-area" placeholder="Message"></textarea>
							</div>
							<div class="col-md-12 for-signin">
								<input type="submit" class="be-popup-sign-button" value="SEND">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<div class="theme-config">
	    <div class="main-color">
	        <div class="title">Main Color:</div>
	        <div class="colours-wrapper">
	            <div class="entry color1 m-color active" data-colour="style/stylesheet.css"></div>   
	            <div class="entry color3 m-color"  data-colour="style/style-green.css"></div>
	            <div class="entry color6 m-color"  data-colour="style/style-orange.css"></div>
	            <div class="entry color8 m-color"  data-colour="style/style-red.css"></div>  
	            <div class="title">Second Color:</div>  
	            <div class="entry s-color  active color10"  data-colour="style/stylesheet.css"></div>
	            <div class="entry s-color color11"  data-colour="style/style-oranges.css"></div> 
	            <div class="entry s-color color12"  data-colour="style/style-greens.css"></div>
	            <div class="entry s-color color13"  data-colour="style/style-reds.css"></div>
	                       
	        </div>
	    </div>
	   <div class="open"><img src="img/icon-134.png" alt=""></div>
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
  <!-- <script src="/salmon/resources/sjh/js/main-article.js"></script> -->
  
  <script src="/salmon/resources/sjh/js/feeds.js"></script>
  
  <!-- jjw 프로필사진 -->
<!--   <script type="text/javascript" src="/salmon/resources/jjw/js/croppie.min.js"></script> -->
  <!-- <script type="text/javascript" src="/salmon/resources/sjh/js/image.js"></script> -->

	</body>
</html>