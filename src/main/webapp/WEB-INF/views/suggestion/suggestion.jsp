<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<title>NGRNetwork</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="shortcut icon" href="img/favicon.png">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/salmon/resources/template/style/bootstrap.min.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/salmon/resources/template/style/icon.css">
	<link rel="stylesheet" href="/salmon/resources/template/style/loader.css">
	<link rel="stylesheet" href="/salmon/resources/template/style/idangerous.swiper.css">
	<link rel="stylesheet" href="/salmon/resources/template/style/stylesheet.css">
	<link rel="stylesheet" href="/salmon/resources/jjw/css/suggestion.css">
	<link rel="stylesheet" href="/salmon/resources/sjh/css/sns-feeds.css">
	<!-- font awsome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	 crossorigin="anonymous">
</head>

<body>

	<!-- THE LOADER -->

	<div class="be-loader" style="display: none;">
		<div class="spinner">
			<img src="img/logo-loader.png" alt="">
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
		<div class="head-bg-sjh" id="chartInfoBlock">
			<div class="head-bg-img"></div>
			<div class="head-bg-content font-sjh">
				<h1>여러분들이 가진 의견을 보여주세요</h1>
				<p>원하시는 상품을 기획해 제안해 사람들과 공유하고 추천을 받아보세요</p>
			</div>
		</div>
		<div class="container be-detail-container">
			<h1 class="article-title">${article.articleTitle}</h1>
			<h2 class="content-title">참여인원 : ${article.likeCnt}명, ${article.articleProposalStatus == 'R' ? '진행중' : ''}${article.articleProposalStatus == 'J' ? '심사 중' : ''}${article.articleProposalStatus == 'C' ? '개발 중' : ''}${article.articleProposalStatus == 'F' ? '개발 완료' : ''}</h2>
			<div class="row row-progress">
				<div class="col-xs-3 col-md-2">0명</div>
				<div class="col-xs-6 col-md-8">
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="${article.likeCnt gt 0 && article.likeCnt lt 1000 ? article.likeCnt/10 : ''}${article.likeCnt ge 1000 ? '100' : ''}"
						 aria-valuemin="0" aria-valuemax="100" style="width:${article.likeCnt gt 0 && article.likeCnt lt 1000 ? article.likeCnt/10 : ''}${article.likeCnt ge 1000 ? '100' : ''}%;">
							${article.likeCnt gt 0 && article.likeCnt lt 1000 ? article.likeCnt/10 : '' }${article.likeCnt ge 1000 ? '100' :
							''}%
						</div>
					</div>
				</div>
				<div class="col-xs-3 col-md-2">1000명</div>
			</div>
			<div class="row">
				<div class="col-md-9">
					<div class="blog-wrapper blog-list">

						<div class="blog-post be-large-post">
							<div class="info-block clearfix">
								<div class="be-large-post-align">
									<span><i class="fa fa-thumbs-o-up"></i> ${article.likeCnt}</span>
									<span><i class="fa fa-eye"></i> 753</span>
									<span><i class="fa fa-comment-o"></i> ${article.commentCnt}</span>
									<span class="be-text-tags">
										<c:forEach items="${article.ctgryNames}" var="ctgryName" varStatus="status">
											<a class="be-post-tag">${ctgryName}<c:if test="${!status.last}">, </c:if></a>
										</c:forEach>
									</span>
								</div>
							</div>
							<div class="be-large-post-align">
								<h3 class="be-post-title">${article.articleTitle}</h3>
								<div class="be-text-tags clearfix">
									<div class="post-date">
										<i class="fa fa-clock-o"></i> ${article.articleRegdate} ~ ${article.articleEnddate}
									</div>
									<div class="author-post">
										<img src="img/a1.png" alt="" class="ava-author">
										<span>by <a href="blog-detail-2.html">${article.userPsns.userId}</a></span>
									</div>
								</div>
								<div class="clear"></div>
							</div>

							<div class="blog-content be-large-post-align">
								<div class="post-text ">
									<p>${article.articleContent}</p>
								</div>
							</div>
							<div class="be-large-post-align">
								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<div class="be-bottom">
											<h4 class="be-bottom-title">HashTag</h4>
											<div class="tags_block clearfix">
												<ul>
													<c:forEach items="${article.hashtags}" var="hashtag">
														<li><a href="">${hashtag}</a></li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="be-comment-block">
							<h1 class="comments-title">댓글 (${article.commentCnt})</h1>
							<c:forEach items="${article.comments}" var="comment" varStatus="status">
								<div class="be-comment">
									<div class="be-img-comment">
										<a href="">
											<img src="/salmon/image?fileName=${comment.user_image}" alt="" class="be-ava-comment">
										</a>
									</div>
									<div class="be-comment-content">
										<span class="be-comment-name">
											<a href="">${comment.user_id}</a>
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
							<form class="form-block">
								<div class="row">
									<div class="col-xs-12">
										<div class="form-group">
											<textarea class="form-input" required="" placeholder="Your text"></textarea>
										</div>
									</div>
									<a class="btn color-1 size-2 hover-1 pull-right">submit</a>
								</div>
							</form>
						</div>
					</div>
				</div>
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
							<span class="be-user-info">
								<c:out value="${user.user_id}" />
							</span>
						</div>
						<div class="be-user-activity-block">
							<div class="row">
								<div class="col-lg-12">
									<c:choose>
										<c:when test="${follow eq 'followable'}">
											<a id='follow-ask-do-<c:out value="${user.user_id}" />' class="ask-follow">
												<i class="far fa-heart"></i>
												FOLLOW
											</a>
										</c:when>
										<c:when test="${follow eq 'unfollowable'}">
											<a id='follow-ask-undo-<c:out value="${user.user_id}" />' class="ask-follow">
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
						<p class="be-text-userblock">
							${article.userPsns.ctgryName1}${article.userPsns.ctgryName2 != "none" ? ', ' : ''}${article.userPsns.ctgryName2
							!= "none" ? article.userPsns.ctgryName2 : ''}${article.userPsns.ctgryName3 != "none" ? ', ' :
							''}${article.userPsns.ctgryName3 != "none" ? article.userPsns.ctgryName3 : ''}
						</p>
					</div>
					<c:choose>
						<c:when test="${checkLike}">
							<a href="" class="be-button-vidget like-cancel-btn blue-style"><i class="fas fa-thumbs-up"></i></i>추천 취소하기</a>
						</c:when>
						<c:otherwise>
							<a href="" class="be-button-vidget like-btn blue-style"><i class="far fa-thumbs-up"></i></i>이 제안 추천하기!</a>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
	</div>

	<!-- THE FOOTER -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

	<!-- SCRIPTS	 -->
	<script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
	<script src="/salmon/resources/template/script/bootstrap.min.js"></script>
	<script src="/salmon/resources/template/script/idangerous.swiper.min.js"></script>
	<script src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>
	<script src="/salmon/resources/template/script/isotope.pkgd.min.js"></script>
	<script src="/salmon/resources/template/script/global.js"></script>

</body>

</html>