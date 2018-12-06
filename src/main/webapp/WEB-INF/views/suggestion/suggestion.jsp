<%@ page language="java" contentType="text/html; charset=utf-8" %>
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
		<div class="container be-detail-container">
			<h2 class="content-title">Our Blog</h2>
			<div class="row">
				<div class="col-sm-9">
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
								<h3 class="be-post-title">
									${article.articleTitle}
								</h3>

								<div class="be-text-tags clearfix">
									<div class="post-date">
										<i class="fa fa-clock-o"></i> ${article.articleRegdate}
									</div>
									<div class="author-post">
										<img src="img/a1.png" alt="" class="ava-author">
										<span>by <a href="blog-detail-2.html">${article.userId}</a></span>
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
									<div class="col-xs-12 col-sm-6">
										<div class="be-bottom right">
											<h4 class="be-bottom-title">Share</h4>
											<ul class="soc_buttons light">
												<li><a href=""><i class="fa fa-facebook"></i></a></li>
												<li><a href=""><i class="fa fa-twitter"></i></a></li>
												<li><a href=""><i class="fa fa-google-plus"></i></a></li>
												<li><a href=""><i class="fa fa-pinterest-p"></i></a></li>
												<li><a href=""><i class="fa fa-instagram"></i></a></li>
												<li><a href=""><i class="fa fa-linkedin"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="be-comment-block">
							<h1 class="comments-title">Comments (3)</h1>
							<div class="be-comment">
								<div class="be-img-comment">
									<a href="blog-detail-2.html">
										<img src="img/c1.png" alt="" class="be-ava-comment">
									</a>
								</div>
								<div class="be-comment-content">

									<span class="be-comment-name">
										<a href="blog-detail-2.html">Ravi Sah</a>
									</span>
									<span class="be-comment-time">
										<i class="fa fa-clock-o"></i>
										May 27, 2015 at 3:14am
									</span>

									<p class="be-comment-text">
										Pellentesque gravida tristique ultrices.
										Sed blandit varius mauris, vel volutpat urna hendrerit id.
										Curabitur rutrum dolor gravida turpis tristique efficitur.
									</p>
								</div>
							</div>
							<div class="be-comment">
								<div class="be-img-comment">
									<a href="blog-detail-2.html">
										<img src="img/c4.png" alt="" class="be-ava-comment">
									</a>
								</div>
								<div class="be-comment-content">
									<span class="be-comment-name">
										<a href="blog-detail-2.html">Phoenix, the Creative Studio</a>
									</span>
									<span class="be-comment-time">
										<i class="fa fa-clock-o"></i>
										May 27, 2015 at 3:14am
									</span>
									<p class="be-comment-text">
										Nunc ornare sed dolor sed mattis. In scelerisque dui a arcu mattis, at maximus eros commodo. Cras magna nunc,
										cursus lobortis luctus at, sollicitudin vel neque. Duis eleifend lorem non ant. Proin ut ornare lectus, vel
										eleifend est. Fusce hendrerit dui in turpis tristique blandit.
									</p>
								</div>
							</div>
							<div class="be-comment">
								<div class="be-img-comment">
									<a href="blog-detail-2.html">
										<img src="img/c5.png" alt="" class="be-ava-comment">
									</a>
								</div>
								<div class="be-comment-content">
									<span class="be-comment-name">
										<a href="blog-detail-2.html">Cüneyt ŞEN</a>
									</span>
									<span class="be-comment-time">
										<i class="fa fa-clock-o"></i>
										May 27, 2015 at 3:14am
									</span>
									<p class="be-comment-text">
										Cras magna nunc, cursus lobortis luctus at, sollicitudin vel neque. Duis eleifend lorem non ant
									</p>
								</div>
							</div>
							<form class="form-block">
								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<div class="form-group fl_icon">
											<div class="icon"><i class="fa fa-user"></i></div>
											<input class="form-input" type="text" placeholder="Your name">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6 fl_icon">
										<div class="form-group fl_icon">
											<div class="icon"><i class="fa fa-envelope-o"></i></div>
											<input class="form-input" type="text" placeholder="Your email">
										</div>
									</div>
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
				<div class="col-sm-3">
					<div class="be-user-block">
						<div class="be-user-detail">
							<a class="be-ava-user" href="blog-detail-2.html">
								<img src="img/ava.png" alt="">
							</a>
							<p class="be-use-name">Daniel Ng</p>
							<span class="be-user-info">
								Singapore, Singapore
							</span>
						</div>
						<div class="be-user-activity-block">
							<div class="row">
								<div class="col-lg-6">
									<a href="blog-detail-2.html" class="be-user-activity-button be-follow-type"><i class="fa fa-plus"></i>FOLLOW</a>
								</div>
								<div class="col-lg-6">
									<a href="blog-detail-2.html" class="col-lg-6 be-user-activity-button send-btn be-message-type"><i class="fa fa-envelope-o"></i>MESSAGE</a>
								</div>
							</div>
						</div>
						<h5 class="be-title">
							About Project
						</h5>
						<p class="be-text-userblock">
							Fusce dolor libero, efficitur et lobortis at, faucibus nec nunc. Proin fermentum turpis eget nisi facilisis
							lobortis. Praesent malesuada facilisis maximus. Donec sed lobortis tortor. Ut nec lacinia sapien, sit amet
							dapibus magna.
						</p>
					</div>
					<a href="blog-detail-2.html" class="be-button-vidget like-btn blue-style"><i class="fa fa-thumbs-o-up"></i>LIKE
						PROJECT</a>


					<h3 class="letf-menu-article text-center">Recent Works</h3>

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