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
	<link rel="stylesheet" href="/salmon/resources/template/style/jquery-ui.css">
	<link rel="stylesheet" href="/salmon/resources/template/style/stylesheet.css">
	<link rel="stylesheet" href="/salmon/resources/jjw/css/stylesheet_jjw.css">
	<link rel="stylesheet" href="/salmon/resources/sjh/css/main-sjh.css">
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
				<h1>당신의 소중한 자산관리 하나에게 맡기세요</h1>
				<p>이제부터 눈으로 가계부를 쓰세요</p>
			</div>
		</div>
		<div class="container be-detail-container">
			<div class="row">
				<div class="col-xs-12 col-md-4 left-feild">
					<div class="be-user-block style-3">
						<div class="be-user-detail">
							<a class="be-ava-user style-2" href="page1.html">
								<img src="/salmon/resources/template/img/ava_10.jpg" alt="">
							</a>
							<a class="be-ava-left btn color-1 size-2 hover-1" href="author-edit.html"><i class="fa fa-pencil"></i>Edit</a>
							<div class="be-ava-right btn btn-share color-4 size-2 hover-7">
								<i class="fa fa-share-alt"></i>share
								<div class="share-buttons">
									<a class="color-1" href="page1.html"><i class="fa fa-facebook"></i> 278</a>
									<a class="color-2" href="page1.html"><i class="fa fa-twitter"></i> 180</a>
									<a class="color-3" href="page1.html"><i class="fa fa-pinterest-p"></i> 78</a>
									<a class="color-4" href="page1.html"><i class="fa fa-linkedin"></i> 53</a>
								</div>
							</div>
							<p class="be-use-name">Leigh Taylor</p>
							<div class="be-user-info">
								Barnsley, United Kingdom
							</div>
							<div class="be-text-tags style-2">
								<a href="page1.html">UI/UX</a>,
								<a href="page1.html">Web Design</a>,
								<a href="page1.html">Art Direction</a>
							</div>
							<div class="be-user-social">
								<a class="social-btn color-1" href="page1.html"><i class="fa fa-facebook"></i></a>
								<a class="social-btn color-2" href="page1.html"><i class="fa fa-twitter"></i></a>
								<a class="social-btn color-3" href="page1.html"><i class="fa fa-google-plus"></i></a>
								<a class="social-btn color-4" href="page1.html"><i class="fa fa-pinterest-p"></i></a>
								<a class="social-btn color-5" href="page1.html"><i class="fa fa-instagram"></i></a>
								<a class="social-btn color-6" href="page1.html"><i class="fa fa-linkedin"></i></a>
							</div>
							<a class="be-user-site" href="http://www.phoenix.cool"><i class="fa fa-link"></i> www.phoenix.cool</a>
						</div>
						<div class="be-user-statistic">
							<div class="stat-row clearfix"><i class="stat-icon icon-views-b"></i> Projects views<span class="stat-counter">218098</span></div>
							<div class="stat-row clearfix"><i class="stat-icon icon-like-b"></i>Appreciations<span class="stat-counter">14335</span></div>
							<div class="stat-row clearfix"><i class="stat-icon icon-followers-b"></i>Followers<span class="stat-counter">2208</span></div>
							<div class="stat-row clearfix"><i class="stat-icon icon-following-b"></i>Following<span class="stat-counter">0</span></div>
						</div>
					</div>
					<div class="be-desc-block">
						<div class="be-desc-author">
							<div class="be-desc-label">About Me</div>
							<div class="clearfix"></div>
							<div class="be-desc-text">
								Nam sit amet massa commodo, tristique metus at, consequat turpis. In vulputate justo at auctor mollis. Aliquam
								non sagittis tortor. Duis tristique suscipit risus, quis facilisis nisl congue vitae. Nunc varius pellentesque
								scelerisque. Etiam quis massa vitae lectus placerat ullamcorper pellentesque vel nisl.
							</div>
						</div>
						<div class="be-desc-author">
							<div class="be-desc-label">My Values</div>
							<div class="clearfix"></div>
							<div class="be-desc-text">
								Sed dignissim scelerisque pretium. Vestibulum vel lacus laoreet nunc fermentum maximus. Proin id sodales sem,
								at consectetur urna. Proin vestibulum, erat a hendrerit sodales, nulla libero ornare dolor.
							</div>
						</div>
					</div>
					<a class="btn full color-1 size-1 hover-1"><i class="fa fa-plus"></i>add sections</a>
				</div>

				<div class="col-xs-12 col-md-8">
					<div class="tab-wrapper style-1">
						<div class="tab-nav-wrapper">
							<div class="nav-tab  clearfix">
								<div class="nav-tab-item active">
									<span>Projects</span>
								</div>
								<div class="nav-tab-item ">
									<span>Work In Progress</span>
								</div>
								<div class="nav-tab-item ">
									<span>Appreciated</span>
								</div>
								<div class="nav-tab-item ">
									<span>Collections</span>
								</div>
							</div>
						</div>
						<div class="tabs-content clearfix">
							<div class="tab-info active">
								<div class="collection">
									<div class="collection-entry">
										<h3 class="menu-article">Creative Ideas</h3>
										<div class="collection-header">
											<span><i class="fa fa-user"></i>by <a href="page1.html">Leigh Taylor</a> </span>
											<span><i class="fa fa-thumbs-o-up"></i> 360</span>
											<span><i class="fa fa-eye"></i> 789</span>
											<div class="edit-collection">
												<i class="fa fa-pencil"></i>
												<div class="c_edit">
													<div class="btn-rename">
														rename
														<div class="message-popup">
															<div class="message-popup-inner container">
																<div class="row">
																	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																		<i class="fa fa-times close-button"></i>
																		<h5 class="large-popup-title">Rename</h5>
																		<div class="form-group">
																			<input class="form-input" required="" placeholder="Your text">
																		</div>
																		<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<a href="page1.html">delete</a>
	
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="collection">
									<div class="collection-entry">
										<h3 class="menu-article">Creative Ideas</h3>
										<div class="collection-header">
											<span><i class="fa fa-user"></i>by <a href="page1.html">Leigh Taylor</a> </span>
											<span><i class="fa fa-thumbs-o-up"></i> 360</span>
											<span><i class="fa fa-eye"></i> 789</span>
											<div class="edit-collection">
												<i class="fa fa-pencil"></i>
												<div class="c_edit">
													<div class="btn-rename">
														rename
														<div class="message-popup">
															<div class="message-popup-inner container">
																<div class="row">
																	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																		<i class="fa fa-times close-button"></i>
																		<h5 class="large-popup-title">Rename</h5>
																		<div class="form-group">
																			<input class="form-input" required="" placeholder="Your text">
																		</div>
																		<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<a href="page1.html">delete</a>
	
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="collection">
									<h3 class="menu-article">Creative Agency</h3>
									<div class="collection-header">
										<span><i class="fa fa-user"></i>by <a href="page1.html">Leigh Taylor</a> </span>
										<span><i class="fa fa-thumbs-o-up"></i> 360</span>
										<span><i class="fa fa-eye"></i> 789</span>
										<div class="edit-collection">
											<i class="fa fa-pencil"></i>
											<div class="c_edit">
												<div class="btn-rename">
													rename
													<div class="message-popup">
														<div class="message-popup-inner container">
															<div class="row">
																<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																	<i class="fa fa-times close-button"></i>
																	<h5 class="large-popup-title">Rename</h5>
																	<div class="form-group">
																		<input class="form-input" required="" placeholder="Your text">
																	</div>
																	<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																</div>
															</div>
														</div>
													</div>
												</div>
												<a href="page1.html">delete</a>

											</div>
										</div>
									</div>
									<div class="collection-entry">
										<a href="page1.html" class="portfolio-link type-2 clearfix">
											<img src="/salmon/resources/template/img/collection_6.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_7.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_8.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_9.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_10.jpg" alt="">
											<div class="color_bg">
												<span>view gallery</span>
												<span class="child"></span>
											</div>
										</a>
									</div>
								</div>
								<div class="collection">
									<h3 class="menu-article">Creative Agency</h3>
									<div class="collection-header">
										<span><i class="fa fa-user"></i>by <a href="page1.html">Inspiration Art</a> </span>
										<span><i class="fa fa-thumbs-o-up"></i> 360</span>
										<span><i class="fa fa-eye"></i> 789</span>
										<div class="edit-collection">
											<i class="fa fa-pencil"></i>
											<div class="c_edit">
												<div class="btn-rename">
													rename
													<div class="message-popup">
														<div class="message-popup-inner container">
															<div class="row">
																<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																	<i class="fa fa-times close-button"></i>
																	<h5 class="large-popup-title">Rename</h5>
																	<div class="form-group">
																		<input class="form-input" required="" placeholder="Your text">
																	</div>
																	<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																</div>
															</div>
														</div>
													</div>
												</div>
												<a href="page1.html">delete</a>

											</div>
										</div>
									</div>
									<div class="collection-entry">
										<a href="page1.html" class="portfolio-link type-2 clearfix">
											<img src="/salmon/resources/template/img/collection_11.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_12.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_13.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_14.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_15.jpg" alt="">
											<div class="color_bg">
												<span>view gallery</span>
												<span class="child"></span>
											</div>
										</a>
									</div>
								</div>
							</div>
							<div class="tab-info">
								<div class="collection">
									<div class="collection-entry">
										<h3 class="menu-article">Creative Ideas</h3>
										<div class="collection-header">
											<span><i class="fa fa-user"></i>by <a href="page1.html">Leigh Taylor</a> </span>
											<span><i class="fa fa-thumbs-o-up"></i> 360</span>
											<span><i class="fa fa-eye"></i> 789</span>
											<div class="edit-collection">
												<i class="fa fa-pencil"></i>
												<div class="c_edit">
													<div class="btn-rename">
														rename
														<div class="message-popup">
															<div class="message-popup-inner container">
																<div class="row">
																	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																		<i class="fa fa-times close-button"></i>
																		<h5 class="large-popup-title">Rename</h5>
																		<div class="form-group">
																			<input class="form-input" required="" placeholder="Your text">
																		</div>
																		<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<a href="page1.html">delete</a>
	
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="collection">
									<div class="collection-entry">
										<h3 class="menu-article">Creative Ideas</h3>
										<div class="collection-header">
											<span><i class="fa fa-user"></i>by <a href="page1.html">Leigh Taylor</a> </span>
											<span><i class="fa fa-thumbs-o-up"></i> 360</span>
											<span><i class="fa fa-eye"></i> 789</span>
											<div class="edit-collection">
												<i class="fa fa-pencil"></i>
												<div class="c_edit">
													<div class="btn-rename">
														rename
														<div class="message-popup">
															<div class="message-popup-inner container">
																<div class="row">
																	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																		<i class="fa fa-times close-button"></i>
																		<h5 class="large-popup-title">Rename</h5>
																		<div class="form-group">
																			<input class="form-input" required="" placeholder="Your text">
																		</div>
																		<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<a href="page1.html">delete</a>
	
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="collection">
									<h3 class="menu-article">Creative Agency</h3>
									<div class="collection-header">
										<span><i class="fa fa-user"></i>by <a href="page1.html">Leigh Taylor</a> </span>
										<span><i class="fa fa-thumbs-o-up"></i> 360</span>
										<span><i class="fa fa-eye"></i> 789</span>
										<div class="edit-collection">
											<i class="fa fa-pencil"></i>
											<div class="c_edit">
												<div class="btn-rename">
													rename
													<div class="message-popup">
														<div class="message-popup-inner container">
															<div class="row">
																<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																	<i class="fa fa-times close-button"></i>
																	<h5 class="large-popup-title">Rename</h5>
																	<div class="form-group">
																		<input class="form-input" required="" placeholder="Your text">
																	</div>
																	<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																</div>
															</div>
														</div>
													</div>
												</div>
												<a href="page1.html">delete</a>

											</div>
										</div>
									</div>
									<div class="collection-entry">
										<a href="page1.html" class="portfolio-link type-2 clearfix">
											<img src="/salmon/resources/template/img/collection_6.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_7.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_8.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_9.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_10.jpg" alt="">
											<div class="color_bg">
												<span>view gallery</span>
												<span class="child"></span>
											</div>
										</a>
									</div>
								</div>
								<div class="collection">
									<h3 class="menu-article">Creative Agency</h3>
									<div class="collection-header">
										<span><i class="fa fa-user"></i>by <a href="page1.html">Inspiration Art</a> </span>
										<span><i class="fa fa-thumbs-o-up"></i> 360</span>
										<span><i class="fa fa-eye"></i> 789</span>
										<div class="edit-collection">
											<i class="fa fa-pencil"></i>
											<div class="c_edit">
												<div class="btn-rename">
													rename
													<div class="message-popup">
														<div class="message-popup-inner container">
															<div class="row">
																<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																	<i class="fa fa-times close-button"></i>
																	<h5 class="large-popup-title">Rename</h5>
																	<div class="form-group">
																		<input class="form-input" required="" placeholder="Your text">
																	</div>
																	<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																</div>
															</div>
														</div>
													</div>
												</div>
												<a href="page1.html">delete</a>

											</div>
										</div>
									</div>
									<div class="collection-entry">
										<a href="page1.html" class="portfolio-link type-2 clearfix">
											<img src="/salmon/resources/template/img/collection_11.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_12.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_13.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_14.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_15.jpg" alt="">
											<div class="color_bg">
												<span>view gallery</span>
												<span class="child"></span>
											</div>
										</a>
									</div>
								</div>
							</div>
							<div class="tab-info">
								<div class="collection">
									<div class="collection-entry">
										<h3 class="menu-article">Creative Ideas</h3>
										<div class="collection-header">
											<span><i class="fa fa-user"></i>by <a href="page1.html">Leigh Taylor</a> </span>
											<span><i class="fa fa-thumbs-o-up"></i> 360</span>
											<span><i class="fa fa-eye"></i> 789</span>
											<div class="edit-collection">
												<i class="fa fa-pencil"></i>
												<div class="c_edit">
													<div class="btn-rename">
														rename
														<div class="message-popup">
															<div class="message-popup-inner container">
																<div class="row">
																	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																		<i class="fa fa-times close-button"></i>
																		<h5 class="large-popup-title">Rename</h5>
																		<div class="form-group">
																			<input class="form-input" required="" placeholder="Your text">
																		</div>
																		<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<a href="page1.html">delete</a>
	
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="collection">
									<div class="collection-entry">
										<h3 class="menu-article">Creative Ideas</h3>
										<div class="collection-header">
											<span><i class="fa fa-user"></i>by <a href="page1.html">Leigh Taylor</a> </span>
											<span><i class="fa fa-thumbs-o-up"></i> 360</span>
											<span><i class="fa fa-eye"></i> 789</span>
											<div class="edit-collection">
												<i class="fa fa-pencil"></i>
												<div class="c_edit">
													<div class="btn-rename">
														rename
														<div class="message-popup">
															<div class="message-popup-inner container">
																<div class="row">
																	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																		<i class="fa fa-times close-button"></i>
																		<h5 class="large-popup-title">Rename</h5>
																		<div class="form-group">
																			<input class="form-input" required="" placeholder="Your text">
																		</div>
																		<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<a href="page1.html">delete</a>
	
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="collection">
									<h3 class="menu-article">Creative Agency</h3>
									<div class="collection-header">
										<span><i class="fa fa-user"></i>by <a href="page1.html">Leigh Taylor</a> </span>
										<span><i class="fa fa-thumbs-o-up"></i> 360</span>
										<span><i class="fa fa-eye"></i> 789</span>
										<div class="edit-collection">
											<i class="fa fa-pencil"></i>
											<div class="c_edit">
												<div class="btn-rename">
													rename
													<div class="message-popup">
														<div class="message-popup-inner container">
															<div class="row">
																<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																	<i class="fa fa-times close-button"></i>
																	<h5 class="large-popup-title">Rename</h5>
																	<div class="form-group">
																		<input class="form-input" required="" placeholder="Your text">
																	</div>
																	<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																</div>
															</div>
														</div>
													</div>
												</div>
												<a href="page1.html">delete</a>

											</div>
										</div>
									</div>
									<div class="collection-entry">
										<a href="page1.html" class="portfolio-link type-2 clearfix">
											<img src="/salmon/resources/template/img/collection_6.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_7.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_8.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_9.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_10.jpg" alt="">
											<div class="color_bg">
												<span>view gallery</span>
												<span class="child"></span>
											</div>
										</a>
									</div>
								</div>
								<div class="collection">
									<h3 class="menu-article">Creative Agency</h3>
									<div class="collection-header">
										<span><i class="fa fa-user"></i>by <a href="page1.html">Inspiration Art</a> </span>
										<span><i class="fa fa-thumbs-o-up"></i> 360</span>
										<span><i class="fa fa-eye"></i> 789</span>
										<div class="edit-collection">
											<i class="fa fa-pencil"></i>
											<div class="c_edit">
												<div class="btn-rename">
													rename
													<div class="message-popup">
														<div class="message-popup-inner container">
															<div class="row">
																<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																	<i class="fa fa-times close-button"></i>
																	<h5 class="large-popup-title">Rename</h5>
																	<div class="form-group">
																		<input class="form-input" required="" placeholder="Your text">
																	</div>
																	<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																</div>
															</div>
														</div>
													</div>
												</div>
												<a href="page1.html">delete</a>

											</div>
										</div>
									</div>
									<div class="collection-entry">
										<a href="page1.html" class="portfolio-link type-2 clearfix">
											<img src="/salmon/resources/template/img/collection_11.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_12.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_13.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_14.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_15.jpg" alt="">
											<div class="color_bg">
												<span>view gallery</span>
												<span class="child"></span>
											</div>
										</a>
									</div>
								</div>
							</div>
							<div class="tab-info">
								<div class="collection">
									<div class="collection-entry">
										<h3 class="menu-article">Creative Ideas</h3>
										<div class="collection-header">
											<span><i class="fa fa-user"></i>by <a href="page1.html">Leigh Taylor</a> </span>
											<span><i class="fa fa-thumbs-o-up"></i> 360</span>
											<span><i class="fa fa-eye"></i> 789</span>
											<div class="edit-collection">
												<i class="fa fa-pencil"></i>
												<div class="c_edit">
													<div class="btn-rename">
														rename
														<div class="message-popup">
															<div class="message-popup-inner container">
																<div class="row">
																	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																		<i class="fa fa-times close-button"></i>
																		<h5 class="large-popup-title">Rename</h5>
																		<div class="form-group">
																			<input class="form-input" required="" placeholder="Your text">
																		</div>
																		<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<a href="page1.html">delete</a>
	
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="collection">
									<div class="collection-entry">
										<h3 class="menu-article">Creative Ideas</h3>
										<div class="collection-header">
											<span><i class="fa fa-user"></i>by <a href="page1.html">Leigh Taylor</a> </span>
											<span><i class="fa fa-thumbs-o-up"></i> 360</span>
											<span><i class="fa fa-eye"></i> 789</span>
											<div class="edit-collection">
												<i class="fa fa-pencil"></i>
												<div class="c_edit">
													<div class="btn-rename">
														rename
														<div class="message-popup">
															<div class="message-popup-inner container">
																<div class="row">
																	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																		<i class="fa fa-times close-button"></i>
																		<h5 class="large-popup-title">Rename</h5>
																		<div class="form-group">
																			<input class="form-input" required="" placeholder="Your text">
																		</div>
																		<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<a href="page1.html">delete</a>
	
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="collection">
									<h3 class="menu-article">Creative Agency</h3>
									<div class="collection-header">
										<span><i class="fa fa-user"></i>by <a href="page1.html">Leigh Taylor</a> </span>
										<span><i class="fa fa-thumbs-o-up"></i> 360</span>
										<span><i class="fa fa-eye"></i> 789</span>
										<div class="edit-collection">
											<i class="fa fa-pencil"></i>
											<div class="c_edit">
												<div class="btn-rename">
													rename
													<div class="message-popup">
														<div class="message-popup-inner container">
															<div class="row">
																<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																	<i class="fa fa-times close-button"></i>
																	<h5 class="large-popup-title">Rename</h5>
																	<div class="form-group">
																		<input class="form-input" required="" placeholder="Your text">
																	</div>
																	<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																</div>
															</div>
														</div>
													</div>
												</div>
												<a href="page1.html">delete</a>

											</div>
										</div>
									</div>
									<div class="collection-entry">
										<a href="page1.html" class="portfolio-link type-2 clearfix">
											<img src="/salmon/resources/template/img/collection_6.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_7.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_8.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_9.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_10.jpg" alt="">
											<div class="color_bg">
												<span>view gallery</span>
												<span class="child"></span>
											</div>
										</a>
									</div>
								</div>
								<div class="collection">
									<h3 class="menu-article">Creative Agency</h3>
									<div class="collection-header">
										<span><i class="fa fa-user"></i>by <a href="page1.html">Inspiration Art</a> </span>
										<span><i class="fa fa-thumbs-o-up"></i> 360</span>
										<span><i class="fa fa-eye"></i> 789</span>
										<div class="edit-collection">
											<i class="fa fa-pencil"></i>
											<div class="c_edit">
												<div class="btn-rename">
													rename
													<div class="message-popup">
														<div class="message-popup-inner container">
															<div class="row">
																<div class="col-xs-12 col-sm-8 col-sm-offset-2">
																	<i class="fa fa-times close-button"></i>
																	<h5 class="large-popup-title">Rename</h5>
																	<div class="form-group">
																		<input class="form-input" required="" placeholder="Your text">
																	</div>
																	<button class="btn btn-right color-1 size-1 hover-1">OK</button>
																</div>
															</div>
														</div>
													</div>
												</div>
												<a href="page1.html">delete</a>

											</div>
										</div>
									</div>
									<div class="collection-entry">
										<a href="page1.html" class="portfolio-link type-2 clearfix">
											<img src="/salmon/resources/template/img/collection_11.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_12.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_13.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_14.jpg" alt="">
											<img src="/salmon/resources/template/img/collection_15.jpg" alt="">
											<div class="color_bg">
												<span>view gallery</span>
												<span class="child"></span>
											</div>
										</a>
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

	<!-- SCRIPT	-->
	<script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
	<script src="/salmon/resources/template/script/jquery-ui.min.js"></script>
	<script src="/salmon/resources/template/script/bootstrap.min.js"></script>
	<script src="/salmon/resources/template/script/idangerous.swiper.min.js"></script>
	<script src="/salmon/resources/template/script/jquery.mixitup.js"></script>
	<script src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>
	<script src="/salmon/resources/template/script/filters.js"></script>
	<script src="/salmon/resources/template/script/global.js"></script>
</body>

</html>