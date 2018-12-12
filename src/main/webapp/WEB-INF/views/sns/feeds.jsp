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
	  <link rel="stylesheet" href="/salmon/resources/sjh/css/article.css">
	
	<!-- font awsome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<!-- jjw 프로필사진 -->
	<!-- <link rel="stylesheet" href="/salmon/resources/jjw/css/croppie.css"> -->
		
	  <script src="https://code.highcharts.com/highcharts.js"></script>
	  <script src="https://code.highcharts.com/modules/exporting.js"></script>
	  <script src="https://code.highcharts.com/modules/export-data.js"></script>


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
								
							</div>
						
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
				

				<div id="following-user-list" class="be-user-block">
					<h3 class="letf-menu-article text-center feeds-smaller-title">팔로잉하는 사용자</h3>
					<div>
					<c:choose>
					<c:when test="${followingList.size() != 0}">
						<c:forEach var="followingUser" items="${followingList}">
						<!-- <div class="following-user-info"> -->
							<a class="following-user-info" href="/salmon/sns/feeds?userid=${followingUser.user_id}">
								<input type="hidden" name="user-comment-profile-photo" value="${followingUser.user_image}">
								<img src="" alt="" class="following-photo">
								<c:out value="${followingUser.user_nickname}"/>
								(<c:out value="${followingUser.user_id}"/>)
							</a>
						<!-- 	</div> -->
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="empty-alert">팔로잉을 시작하세요!</div>
					</c:otherwise>
					</c:choose>
					</div>
				</div>
				<div id="joinging-group-list"  class="be-user-block">
					<h3 class="letf-menu-article text-center feeds-smaller-title">가입한 모임</h3>
					<div>
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
						<div class="empty-alert">모임에 참여하세요!</div>
					</c:otherwise>
					</c:choose>
					</div>
				</div>
				
			</div>

			<div class="col-md-9 article-menu-bar">
				<div id="myArticles-btn" class="col-md-4 article-menu active">내 게시글</div>
				<div id="likeArticles-btn" class="col-md-4 article-menu">좋아요한 게시글</div>
			</div>

			<div class="row col-md-9" id="myArticles">
			<c:choose>
			<c:when test="${myArticles.size() != 0}">
			<c:forEach var="myArticle" items="${myArticles}">
				<div name="post">
				<!-- <div class="col-md-9 col-md-push-3" style="background-color: crimson;"> -->
					
					<div class="be-large-post" style="margin-bottom: unset;">
						<div class="info-block">
							<div class="be-large-post-align font-larger">
								<input type="hidden" name="article_id" value="<c:out value="${myArticle.article_id}"/>">
								<c:choose>
								<c:when test="${myArticle.isLikedByMe > 0}">
									<%-- 이미 로그인한 유저가 좋아요한 게시글 --%>
									<span name="article-like-btn" class="hidden">
										<i class="far fa-thumbs-up"></i><%--좋아요 --%>
	                					<c:out value="${myArticle.likes.size()}"/>
									</span>
									<span name="article-unlike-btn" class="orange-font">
										<i class="fas fa-thumbs-up"></i><%--안좋아요 --%>
	                					<c:out value="${myArticle.likes.size()}"/>
									</span>
								</c:when>
								<c:otherwise>
									<%-- 아직 로그인한 유저가 좋아요 하지않은 게시글 --%>
									<span name="article-like-btn">
										<i class="far fa-thumbs-up"></i><%--좋아요 --%>
	                					<c:out value="${myArticle.likes.size()}"/>
									</span>
									<span name="article-unlike-btn" class="orange-font hidden">
										<i class="fas fa-thumbs-up"></i><%--안좋아요 --%>
	                					<c:out value="${myArticle.likes.size()}"/>
									</span>
								</c:otherwise>
								</c:choose>
								<span><i class="fas fa-comment"></i>
									<%--댓글수 --%>
	                				<c:out value="${myArticle.comments.size()}"/>
								</span>
								<c:choose>
									<c:when test="${myArticle.isReportedByMe > 0}">
									<span name="article-report-btn" class="hidden">
				                  		<i class="far fa-flag"></i> 신고
				                  	</span>
				                  	<span name="article-report-complete-btn" class="orange-font">
				                  		<i class="fas fa-flag"></i> 신고됨
				                  	</span>
									</c:when>
									<c:otherwise>
									<span name="article-report-btn">
				                  		<i class="far fa-flag"></i> 신고
				                  	</span>
				                  	<span name="article-report-complete-btn" class="orange-font hidden">
				                  		<i class="fas fa-flag"></i> 신고됨
				                  	</span>
									</c:otherwise>
								</c:choose>
								<span style="float:right">
								작성일 
								<c:out value="${myArticle.article_regdate}"/>
								</span>
							</div>
						</div>
						<div class="blog-content be-large-post-align">
						
						<h5 class="feed-article-title">
						<c:choose>
						<c:when test="${myArticle.article_ctgry_id eq 3}">
							<%--역제안 게시글 --%>
							<c:out value="${myArticle.article_title}"/>
						</c:when>
						<c:otherwise>
						   <%--일반 게시글 --%>
							<c:out value="${myArticle.article_payment_fee}"/>원, 
							<c:out value="${myArticle.article_title}"/>
						</c:otherwise>
						</c:choose>
						</h5>
						
							<div class="clear"></div>
							<div class="post-text">
								<pre> ${myArticle.article_content}</pre>
								<c:if test="${myArticle.imagePaths.size()>0 }">
					          	<c:forEach var="images" items="${myArticle.imagePaths}">
					                <div class="image-block">
					                  <img src="/salmon/main/image?fileName=${images}" alt="img">
					                </div>
					            </c:forEach>
				              </c:if>
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
										<li><a href="/salmon/sns/search?search-value=${tag.substring(1)}">${tag}</a></li>
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
					
					<div class=" folded-comments" name="fold-comments-btn" value="folded">
						<h1 class="comments-title">댓글 (<span name="comment-num" id="comment-num-<c:out value="${myArticle.article_id}"/>"><c:out value="${myArticle.comments.size()}"/></span>)</h1>
					</div> 
					<div class="be-comment-block" name="comments-block">
					<%-- 
						<h1 class="comments-title">댓글 (<span name="comment-num" id="comment-num-<c:out value="${myArticle.article_id}"/>"><c:out value="${myArticle.comments.size()}"/></span>)</h1> 
						 --%>
						<!-- <p class="about-comment-block"></p> -->
						<div name="comment-area">
						<c:choose>
						<c:when test="${myArticle.comments.size() ne 0}">
							<c:forEach var="comment" items="${myArticle.comments}">
							<div class="be-comment">
							<input type="hidden" name="comment-id" value="${comment.comment_id}">
							<input type="hidden" name="article-id" value="${comment.article_id}">
									<div class="be-img-comment">	
										<a href="/salmon/sns/feeds?userid=${comment.user_id}">
										<input type="hidden" name="user-comment-profile-photo" value="${comment.user_image}">
										<img src="" alt="" class="be-ava-comment">
										</a>
									</div>
									<div class="be-comment-content">
										<span class="be-comment-name">
											<a href="/salmon/sns/feeds?userid=${comment.user_id}">
											${comment.user_nickname}
											</a>
										</span>
										<span class="be-comment-time">
										<c:if test="${me.user_id eq comment.user_id}">
											<span name="comment-delete-btn" class="comment-delete-btn">
											<input type="hidden" name="comment-id" value="${comment.comment_id}">
												<i class="fas fa-times"></i>삭제 
											</span>
										</c:if>
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
							</div>

						<form id="reply-form-${myArticle.article_id}" method="get">
							<div class="form-group">
								<input type="hidden" name="article_id" value="${myArticle.article_id}">
								<c:out value="${me.user_nickname}"/>
								<input type="text" name="comment_content" required="required" class="form-input">
								<input type="button" id="reply-write-btn-${myArticle.article_id}" class="btn-sjh pull-right" value="등록">
							</div>
						</form>

					</div>
				</div>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="be-large-post info-block">
						<h3>아직 작성한 게시글이 없습니다</h3>
					</div>
				</c:otherwise>
				</c:choose>
			</div>
			
			<div class="row col-md-9" id="likeArticles">
			<c:choose>
			<c:when test="${likeArticles.size() != 0}">
			<c:forEach var="likeArticle" items="${likeArticles}">
				<div name="post">
				<!-- <div class="col-md-9 col-md-push-3" style="background-color: crimson;"> -->
					
					<div class="be-large-post" style="margin-bottom: unset;">
						<div class="info-block">
							<div class="be-large-post-align font-larger">
								<input type="hidden" name="article_id" value="<c:out value="${likeArticle.article_id}"/>">
								<c:choose>
								<c:when test="${likeArticle.isLikedByMe > 0}">
									<%-- 이미 로그인한 유저가 좋아요한 게시글 --%>
									<span name="article-like-btn" class="hidden">
										<i class="far fa-thumbs-up"></i><%--좋아요 --%>
	                					<c:out value="${likeArticle.likes.size()}"/>
									</span>
									<span name="article-unlike-btn" class="orange-font">
										<i class="fas fa-thumbs-up"></i><%--안좋아요 --%>
	                					<c:out value="${likeArticle.likes.size()}"/>
									</span>
								</c:when>
								<c:otherwise>
									<%-- 아직 로그인한 유저가 좋아요 하지않은 게시글 --%>
									<span name="article-like-btn">
										<i class="far fa-thumbs-up"></i><%--좋아요 --%>
	                					<c:out value="${likeArticle.likes.size()}"/>
									</span>
									<span name="article-unlike-btn" class="orange-font hidden">
										<i class="fas fa-thumbs-up"></i><%--안좋아요 --%>
	                					<c:out value="${likeArticle.likes.size()}"/>
									</span>
								</c:otherwise>
								</c:choose>
								<span><i class="fas fa-comment"></i>
									<%--댓글수 --%>
	                				<c:out value="${likeArticle.comments.size()}"/>
								</span>
								<c:choose>
									<c:when test="${likeArticle.isReportedByMe > 0}">
									<span name="article-report-btn" class="hidden">
				                  		<i class="far fa-flag"></i> 신고
				                  	</span>
				                  	<span name="article-report-complete-btn" class="orange-font">
				                  		<i class="fas fa-flag"></i> 신고됨
				                  	</span>
									</c:when>
									<c:otherwise>
									<span name="article-report-btn">
				                  		<i class="far fa-flag"></i> 신고
				                  	</span>
				                  	<span name="article-report-complete-btn" class="orange-font hidden">
				                  		<i class="fas fa-flag"></i> 신고됨
				                  	</span>
									</c:otherwise>
								</c:choose>
								<span style="float:right">
								작성일 
								<c:out value="${likeArticle.article_regdate}"/>
								</span>
							</div>
						</div>
						<div class="blog-content be-large-post-align">
							<h5 class="feed-article-title">
								<c:out value="${likeArticle.article_payment_fee}"/>원, 
								<c:out value="${likeArticle.article_title}"/>
							</h5>
						
							<div class="clear"></div>
							<div class="post-text">
								<p> ${likeArticle.article_content}</p>
								<c:if test="${likeArticle.imagePaths.size()>0 }">
					          	<c:forEach var="images" items="${likeArticle.imagePaths}">
					                <div class="image-block">
					                  <img src="/salmon/main/image?fileName=${images}" alt="img">
					                </div>
					            </c:forEach>
				              </c:if>
							</div>
						</div>
						<div class="be-large-post-align">
							<h3 class="letf-menu-article">
								Tags
							</h3>
							<div class="tags_block clearfix">
								<ul>
								<c:choose>
								<c:when test="${likeArticle.hashtags.size() ne 0}">
									<c:forEach var="tag" items="${likeArticle.hashtags}">
										<li><a href="/salmon/sns/search?search-value=${tag.substring(1)}">${tag}</a></li>
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
					
					<div class=" folded-comments" name="fold-comments-btn" value="folded">
						<h1 class="comments-title">댓글 (<span name="comment-num" id="comment-num-<c:out value="${likeArticle.article_id}"/>"><c:out value="${likeArticle.comments.size()}"/></span>)</h1>
					</div> 
					<div class="be-comment-block" name="comments-block">
					<%-- 
						<h1 class="comments-title">댓글 (<span name="comment-num" id="comment-num-<c:out value="${myArticle.article_id}"/>"><c:out value="${myArticle.comments.size()}"/></span>)</h1> 
						 --%>
						<!-- <p class="about-comment-block"></p> -->
						<div name="comment-area">
						<c:choose>
						<c:when test="${likeArticle.comments.size() ne 0}">
							<c:forEach var="comment" items="${likeArticle.comments}">
							<div class="be-comment">
							<input type="hidden" name="comment-id" value="${comment.comment_id}">
							<input type="hidden" name="article-id" value="${comment.article_id}">
									<div class="be-img-comment">	
										<a href="/salmon/sns/feeds?userid=${comment.user_id}">
										<input type="hidden" name="user-comment-profile-photo" value="${comment.user_image}">
										<img src="" alt="" class="be-ava-comment">
										</a>
									</div>
									<div class="be-comment-content">
										<span class="be-comment-name">
											<a href="/salmon/sns/feeds?userid=${comment.user_id}">
											${comment.user_nickname}
											</a>
										</span>
										<span class="be-comment-time">
										<c:if test="${me.user_id eq comment.user_id}">
											<span name="comment-delete-btn" class="comment-delete-btn">
											<input type="hidden" name="comment-id" value="${comment.comment_id}">
												<i class="fas fa-times"></i>삭제 
											</span>
										</c:if>
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
							</div>

						<form id="reply-form-${likeArticle.article_id}" method="get">
							<div class="form-group">
								<input type="hidden" name="article_id" value="${likeArticle.article_id}">
								<c:out value="${me.user_nickname}"/>
								<input type="text" name="comment_content" required="required" class="form-input">
								<input type="button" id="reply-write-btn-${likeArticle.article_id}" class="btn-sjh pull-right" value="등록">
							</div>
						</form>

					</div>
				</div>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="be-large-post info-block">
						<h3>아직 좋아요한 게시글이 없습니다</h3>
					</div>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	
 <!-- THE FOOTER -->
  <%@ include file="/WEB-INF/views/includes/footer.jsp"%>

	<div class="be-fixed-filter"></div>
	
   <!--  로그아웃 팝업 -->
  <%@ include file="/WEB-INF/views/includes/logout.jsp"%>
  <!--  로그아웃 팝업 끝-->
  
    <!-- 게시글 신고 모달 -->
<%@ include file="/WEB-INF/views/includes/reportModal.jsp"%>
<%@ include file="/WEB-INF/views/includes/reportConfirmModal.jsp"%>
  <!--  게시글 신고 모달끝 -->
  
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
  
  <script type="text/javascript">
	var me;
	$(function(){ 
		  //내정보 불러오기
		  me= ${meJSON};
		});
	</script>
	
	</body>
</html>