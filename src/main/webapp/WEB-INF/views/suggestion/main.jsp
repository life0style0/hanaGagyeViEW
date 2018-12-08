<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<title>NGRNetwork</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="shortcut icon" href="/salmon/resources/template/img/favicon.png">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/salmon/resources/template/style/bootstrap.min.css">
	<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	 crossorigin="anonymous">
	<link rel="stylesheet" href="/salmon/resources/template/style/icon.css">
	<link rel="stylesheet" href="/salmon/resources/template/style/loader.css">
	<link rel="stylesheet" href="/salmon/resources/template/style/idangerous.swiper.css">
	<link rel="stylesheet" href="/salmon/resources/template/style/jquery-ui.css">
	<link rel="stylesheet" href="/salmon/resources/template/style/stylesheet.css">
	<link rel="stylesheet" href="/salmon/resources/jjw/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/salmon/resources/jjw/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="/salmon/resources/jjw/css/suggestion.css">
	<link rel="stylesheet" href="/salmon/resources/jjw/css/common.css">
	<link rel="stylesheet" href="/salmon/resources/sjh/css/sns-feeds.css">
</head>

<body class="page-login">

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
	<!-- THE HEADER -->


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
			<div class="row">
				<div class="col-xs-12 col-md-4 left-feild">
					<div class="be-user-block">
						<div class="be-user-detail">
							<input type="hidden" class="imagePath" value="/salmon/image?fileName=${psns.userImage}">
							<img class="img-responsive image-src" alt="">
							<p class="be-use-name">
								<c:out value="${psns.userNickname}" />
							</p>
							<span class="be-user-info">
								<c:out value="${psns.userId}" />
							</span>
						</div>
						<div class="be-user-activity-block">
							<div class="row">
								<div class="col-lg-12">
									<a id="follow-ask-mypage" class="ask-follow" href="/salmon/sns/feeds?userid=${psns.userId}">
										<i class="fa fa-leaf"></i>
										MYPAGE
									</a>
									<a id="write-article" href="/salmon/article/register" class="ask-follow">
										<i class="fas fa-pen"></i>
										글쓰기
									</a>
								</div>
							</div>
						</div>
						<h5 class="be-title">관심사</h5>
						<p class="be-text-userblock">
							${psns.ctgryName1}${psns.ctgryName2 != "none" ? ', ' : ''}${psns.ctgryName2
							!= "none" ? psns.ctgryName2 : ''}${psns.ctgryName3 != "none" ? ', ' :
							''}${psns.ctgryName3 != "none" ? psns.ctgryName3 : ''}
						</p>
						<div class="be-user-statistic sg-statistic">
							<div class="stat-row clearfix"><i class="stat-icon icon-views-b"></i> 제안한 전체 글 수<span class="stat-counter">${sNum}</span></div>
							<c:forEach items="${psns.suggestionStatusDTO}" var="ssd" varStatus="status">
								<c:choose>
									<c:when test="${ssd.articleProposalStatus == 'R'}">
										<div class="stat-row clearfix"><i class="stat-icon icon-followers-b"></i>제안 중인 글 수<span class="stat-counter">${ssd.articleProposalNum}</span></div>
									</c:when>
									<c:when test="${ssd.articleProposalStatus == 'J'}">
										<div class="stat-row clearfix"><i class="stat-icon icon-views-b"></i>답변 대기 글 수<span class="stat-counter">${ssd.articleProposalNum}</span></div>
									</c:when>
									<c:when test="${ssd.articleProposalStatus == 'C'}">
										<div class="stat-row clearfix"><i class="far fa-award"></i>답변된 전체 글 수<span class="stat-counter">${ssd.articleProposalNum}</span></div>
									</c:when>
								</c:choose>
							</c:forEach>
							<div class="stat-row clearfix"><i class="stat-icon icon-like-b"></i>공감 받은 수<span class="stat-counter">${likeNum}</span></div>
						</div>
					</div>
					<a href="/salmon/suggestion/news" class="btn full color-1 size-1 hover-1 new-article"><i class="fa fa-plus"></i>새로운
						제안하기</a>
				</div>

				<div class="col-xs-12 col-md-8">
					<div class="tab-wrapper style-1">
						<div class="tab-nav-wrapper">
							<div class="nav-tab  clearfix">
								<div class="nav-tab-item active">
									<span>최신글</span>
								</div>
								<div class="nav-tab-item">
									<span>인기글</span>
								</div>
								<div class="nav-tab-item">
									<span>추천글</span>
								</div>
								<div class="nav-tab-item">
									<span>답변 대기 중인 글</span>
								</div>
								<div class="nav-tab-item">
									<span>답변 완료된 글</span>
								</div>
							</div>
						</div>
						<div class="tabs-content clearfix">
							<div class="tab-info active">
								<c:forEach items="${newList}" var="suggestion" varStatus="status">
									<div class="collection" id="sgt-new-${status.count}">
										<div class="collection-entry suggestion-entry">
											<h3 class="menu-article sgt-title">${suggestion.articleTitle}</h3>
											<div class="collection-header">
												<span><i class="fa fa-user"></i>by <a href="page1.html" class="sgt-userNickname">${suggestion.userNickname}</a></span>
												<span><i class="fa fa-thumbs-up"></i> <span class="no-padding no-margin  sgt-like">${suggestion.likeCnt}</span></span>
												<span><i class="fa fa-comment"></i> <span class="no-padding no-margin sgt-comment">${suggestion.commentCnt}</span></span>
												<span><i class="fa fa-eye"></i> <span class="no-padding no-margin sgt-date">기간 :
														${suggestion.articleRegdate} ~ ${suggestion.articleEnddate}</span></span>
											</div>
											<input type="hidden" class="sgt-articleId" value="${suggestion.articleId}">
										</div>
									</div>
								</c:forEach>
								<div class="text-center">
									<ul class="pagination sgt-new-paging">
										<c:if test="${pageBuilder.isPrevPrev}">
											<li class="paginate-new previous" data-page="${pageBuilder.startPageNum-1}">Prev</li>
										</c:if>
										<c:forEach var="num" begin="${pageBuilder.startPageNum}" end="${pageBuilder.lastPageNum}">
											<li class="paginate-new ${pageBuilder.pageNum == num ? 'active' : ''}" data-page="${num}">${num}</li>
										</c:forEach>
										<c:if test="${pageBuilder.isNextNext}">
											<li class="paginate-new next" data-page="${pageBuilder.lastPageNum+1}">Next</li>
										</c:if>
									</ul>
									<div id="pagination-new-data">
										<input type="hidden" class="page" value="${pageBuilder.pageNum}">
										<input type="hidden" class="keyword" value="${cri.keyword}">
										<input type="hidden" class="type" value="${cri.type}">
									</div>
								</div>
							</div>
							<div class="tab-info">
								<c:forEach items="${likeList}" var="suggestion" varStatus="status">
									<div class="collection" id="sgt-like-${status.count}">
										<div class="collection-entry suggestion-entry">
											<h3 class="menu-article sgt-title">${suggestion.articleTitle}</h3>
											<div class="collection-header">
												<span><i class="fa fa-user"></i>by <a href="page1.html" class="sgt-userId">${suggestion.userNickname}</a></span>
												<span><i class="fa fa-thumbs-up"></i> <span class="no-padding no-margin sgt-like">${suggestion.likeCnt}</span></span>
												<span><i class="fa fa-eye"></i> <span class="no-padding no-margin sgt-comment">${suggestion.commentCnt}</span></span>
												<span><i class="fa fa-eye"></i> <span class="no-padding no-margin sgt-date">기간 :
														${suggestion.articleRegdate} ~ ${suggestion.articleEnddate}</span></span>
											</div>
											<input type="hidden" class="sgt-articleId" value="${suggestion.articleId}">
										</div>
									</div>
								</c:forEach>
								<div class="text-center">
									<ul class="pagination sgt-like-paging">
										<c:if test="${pageBuilder.isPrevPrev}">
											<li class="paginate-like previous" data-page="${pageBuilder.startPageNum-1}">Prev</li>
										</c:if>
										<c:forEach var="num" begin="${pageBuilder.startPageNum}" end="${pageBuilder.lastPageNum}">
											<li class="paginate-like ${pageBuilder.pageNum == num ? 'active' : ''}" data-page="${num}">${num}</li>
										</c:forEach>
										<c:if test="${pageBuilder.isNextNext}">
											<li class="paginate-like next" data-page="${pageBuilder.lastPageNum+1}">Next</li>
										</c:if>
									</ul>
									<div id="pagination-like-data">
										<input type="hidden" class="page" value="${pageBuilder.pageNum}">
										<input type="hidden" class="keyword" value="${cri.keyword}">
										<input type="hidden" class="type" value="${cri.type}">
									</div>
								</div>
							</div>
							<div class="tab-info">
								<c:forEach items="${recommendList}" var="suggestion" varStatus="status">
									<div class="collection" id="sgt-recommend-${status.count}">
										<div class="collection-entry suggestion-entry">
											<h3 class="menu-article sgt-title">${suggestion.articleTitle}</h3>
											<div class="collection-header">
												<span><i class="fa fa-user"></i>by <a href="page1.html" class="sgt-userId">${suggestion.userNickname}</a></span>
												<span><i class="fa fa-thumbs-up"></i> <span class="no-padding no-margin sgt-like">${suggestion.likeCnt}</span></span>
												<span><i class="fa fa-eye"></i> <span class="no-padding no-margin sgt-comment">${suggestion.commentCnt}</span></span>
												<span><i class="fa fa-eye"></i> <span class="no-padding no-margin sgt-date">기간 :
														${suggestion.articleRegdate} ~ ${suggestion.articleEnddate}</span></span>
											</div>
											<input type="hidden" class="sgt-articleId" value="${suggestion.articleId}">
										</div>
									</div>
								</c:forEach>
								<div class="text-center">
									<ul class="pagination sgt-recommend-paging">
										<c:if test="${recommendPageBuilder.isPrevPrev}">
											<li class="paginate-recommend previous" data-page="${recommendPageBuilder.startPageNum-1}">Prev</li>
										</c:if>
										<c:forEach var="num" begin="${recommendPageBuilder.startPageNum}" end="${recommendPageBuilder.lastPageNum}">
											<li class="paginate-recommend ${pageBuilder.pageNum == num ? 'active' : ''}" data-page="${num}">${num}</li>
										</c:forEach>
										<c:if test="${recommendPageBuilder.isNextNext}">
											<li class="paginate-recommend next" data-page="${recommendPageBuilder.lastPageNum+1}">Next</li>
										</c:if>
									</ul>
									<div id="pagination-recommend-data">
										<input type="hidden" class="page" value="${recommendPageBuilder.pageNum}">
										<input type="hidden" class="keyword" value="${cri.keyword}">
										<input type="hidden" class="type" value="${cri.type}">
									</div>
								</div>
							</div>
							<div class="tab-info">
								<c:forEach items="${judgeList}" var="suggestion" varStatus="status">
									<div class="collection" id="sgt-judge-${status.count}">
										<div class="collection-entry suggestion-entry">
											<h3 class="menu-article sgt-title">${suggestion.articleTitle}</h3>
											<div class="collection-header">
												<span><i class="fa fa-user"></i>by <a href="page1.html" class="sgt-userId">${suggestion.userNickname}</a></span>
												<span><i class="fa fa-thumbs-up"></i> <span class="no-padding no-margin sgt-like">${suggestion.likeCnt}</span></span>
												<span><i class="fa fa-eye"></i> <span class="no-padding no-margin sgt-comment">${suggestion.commentCnt}</span></span>
												<span><i class="fa fa-eye"></i> <span class="no-padding no-margin sgt-date">기간 :
														${suggestion.articleRegdate} ~ ${suggestion.articleEnddate}</span></span>
											</div>
											<input type="hidden" class="sgt-articleId" value="${suggestion.articleId}">
										</div>
									</div>
								</c:forEach>
								<div class="text-center">
									<ul class="pagination sgt-judge-paging">
										<c:if test="${judgePageBuilder.isPrevPrev}">
											<li class="paginate-judge previous" data-page="${judgePageBuilder.startPageNum-1}">Prev</li>
										</c:if>
										<c:forEach var="num" begin="${judgePageBuilder.startPageNum}" end="${judgePageBuilder.lastPageNum}">
											<li class="paginate-judge ${pageBuilder.pageNum == num ? 'active' : ''}" data-page="${num}">${num}</li>
										</c:forEach>
										<c:if test="${judgePageBuilder.isNextNext}">
											<li class="paginate-judge next" data-page="${judgePageBuilder.lastPageNum+1}">Next</li>
										</c:if>
									</ul>
									<div id="pagination-judge-data">
										<input type="hidden" class="page" value="${judgePageBuilder.pageNum}">
										<input type="hidden" class="keyword" value="${cri.keyword}">
										<input type="hidden" class="type" value="${cri.type}">
									</div>
								</div>
							</div>
							<div class="tab-info">
								<c:forEach items="${confirmList}" var="suggestion" varStatus="status">
									<div class="collection" id="sgt-confirm-${status.count}">
										<div class="collection-entry suggestion-entry">
											<h3 class="menu-article sgt-title">${suggestion.articleTitle}</h3>
											<div class="collection-header">
												<span><i class="fa fa-user"></i>by <a href="page1.html" class="sgt-userId">${suggestion.userNickname}</a></span>
												<span><i class="fa fa-thumbs-up"></i> <span class="no-padding no-margin sgt-like">${suggestion.likeCnt}</span></span>
												<span><i class="fa fa-eye"></i> <span class="no-padding no-margin sgt-comment">${suggestion.commentCnt}</span></span>
												<span><i class="fa fa-eye"></i> <span class="no-padding no-margin sgt-date">기간 :
														${suggestion.articleRegdate} ~ ${suggestion.articleEnddate}</span></span>
											</div>
											<input type="hidden" class="sgt-articleId" value="${suggestion.articleId}">
										</div>
									</div>
								</c:forEach>
								<div class="text-center">
									<ul class="pagination sgt-confirm-paging">
										<c:if test="${confirmPageBuilder.isPrevPrev}">
											<li class="paginate-confirm previous" data-page="${confirmPageBuilder.startPageNum-1}">Prev</li>
										</c:if>
										<c:forEach var="num" begin="${confirmPageBuilder.startPageNum}" end="${confirmPageBuilder.lastPageNum}">
											<li class="paginate-confirm ${pageBuilder.pageNum == num ? 'active' : ''}" data-page="${num}">${num}</li>
										</c:forEach>
										<c:if test="${confirmPageBuilder.isNextNext}">
											<li class="paginate-confirm next" data-page="${confirmPageBuilder.lastPageNum+1}">Next</li>
										</c:if>
									</ul>
									<div id="pagination-confirm-data">
										<input type="hidden" class="page" value="${confirmPageBuilder.pageNum}">
										<input type="hidden" class="keyword" value="${cri.keyword}">
										<input type="hidden" class="type" value="${cri.type}">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- THE FOOTER -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

	<!-- Modal -->
	<%@ include file="../includes/articlemodal.jsp"%>

	<div class="hidden">
		<form action="/salmon/suggestion/article/" method="post" id="articleForm">
			<input type="hidden" name="pageNum" value="">
			<input type="hidden" name="keyword" value="">
			<input type="hidden" name="type" value="">
			<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
	</div>

	<!-- SCRIPT	-->
	<script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
	<script src="/salmon/resources/template/script/jquery-ui.min.js"></script>
	<script src="/salmon/resources/template/script/bootstrap.min.js"></script>
	<script src="/salmon/resources/template/script/idangerous.swiper.min.js"></script>
	<script src="/salmon/resources/template/script/jquery.mixitup.js"></script>
	<script src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>
	<script src="/salmon/resources/template/script/filters.js"></script>
	<script src="/salmon/resources/template/script/global.js"></script>
	<script src="/salmon/resources/jjw/js/owl.carousel.min.js"></script>
	<script src="/salmon/resources/jjw/js/global.js"></script>
	<script src="/salmon/resources/jjw/js/suggestion.js"></script>
</body>

</html>