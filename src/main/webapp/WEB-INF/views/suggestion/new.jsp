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
	<link href="/salmon/resources/sjh/css/ul-list.css" rel="stylesheet" media="all">
</head>

<body>

	<!-- THE LOADER -->

	<div class="be-loader" style="display: none;">
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
		<div class="container be-detail-container">
			<div class="row">
				<div class="col-xs-12 col-md-3 left-feild">
					<div class="be-vidget back-block">
						<a class="btn full color-1 size-1 hover-1" href="author.html"><i class="fa fa-chevron-left"></i>back to profile</a>
					</div>
					<div class="be-vidget hidden-xs hidden-sm affix-top" id="scrollspy" style="position: relative;">
						<h3 class="letf-menu-article">
							Choose Category
						</h3>
						<div class="creative_filds_block">
							<ul class="ul nav">
								<li class="edit-ln"><a href="#basic-information">Basic Information</a></li>
								<li class="edit-ln"><a href="#edit-password">Edit Password</a></li>
								<li class="edit-ln"><a href="#on-the-web">On The Web</a></li>
								<li class="edit-ln ac"><a href="#about-me">About Me</a></li>
								<li class="edit-ln"><a href="#web-references">Web References</a></li>
								<li><a href="#1">New section</a></li>
							</ul>
						</div>
						<a class="btn full color-1 size-1 hover-1 add_section"><i class="fa fa-plus"></i>add sections</a>
					</div>
				</div>
				<div class="col-xs-12 col-md-9 _editor-content_">
					<div class="sec" data-sec="about-me">
						<div class="be-large-post">
							<div class="info-block style-2">
								<div class="be-large-post-align">
									<h3 class="info-block-label">About Me</h3>
								</div>
							</div>
							<div class="be-large-post-align">
								<div class="row">
									<div class="input-col col-xs-12">
										<div class="form-group focus-2">
											<div class="form-label">Section Title</div>
											<input class="form-input" type="text" placeholder="About Me">
										</div>
									</div>
									<div class="input-col col-xs-12">
										<div class="form-group focus-2">
											<div class="form-label">Description</div>
											<textarea class="form-input" required="" placeholder="Something about you"></textarea>
										</div>
									</div>
									<div class="input-col col-xs-12">
										<div class="form-group">
											<ul id="categories" class="categories">
												<c:choose>
													<c:when test="${not empty categories}">
														<c:forEach var="category" items="${categories}" varStatus="status">
															<c:choose>
																<c:when test="${category.ctgry_id < 0 }">
																</c:when>
																<c:otherwise>
																	<li name="category" class="unselected square" id='category-li-<c:out value="${category.ctgry_id}" />'>
																		<div id="category-1" class="unselected" value='<c:out value="${category.ctgry_id}" />'>
																			<c:out value="${category.ctgry_name}" />
																		</div>
																	</li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:when>
													<c:otherwise></c:otherwise>
												</c:choose>
											</ul>
											<input type="hidden" id="CTGRY_1" name="ctgry_1" value="-1">
											<input type="hidden" id="CTGRY_2" name="ctgry_2" value="-1">
											<input type="hidden" id="CTGRY_3" name="ctgry_3" value="-1">
										</div>
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

	<!-- SCRIPTS	 -->
	<script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
	<script src="/salmon/resources/template/script/bootstrap.min.js"></script>
	<script src="/salmon/resources/template/script/idangerous.swiper.min.js"></script>
	<script src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>
	<script src="/salmon/resources/template/script/isotope.pkgd.min.js"></script>
	<script src="/salmon/resources/template/script/global.js"></script>
	<script src="/salmon/resources/jjw/js/suggestion.js"></script>
	<script src="/salmon/resources/jjw/js/global.js"></script>
	<script src="/salmon/resources/sjh/js/feeds.js"></script>
</body>

</html>