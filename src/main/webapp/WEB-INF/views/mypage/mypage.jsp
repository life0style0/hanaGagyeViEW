<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>HANA 가계ViEW</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="shortcut icon" href="resources/template/img/favicon.png">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="resources/template/style/bootstrap.min.css">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="resources/template/style/icon.css">
		<link rel="stylesheet" href="resources/template/style/loader.css">
		<link rel="stylesheet" href="resources/template/style/idangerous.swiper.css">
		<link rel="stylesheet" href="resources/template/style/jquery-ui.css">
		<link rel="stylesheet" href="resources/template/style/stylesheet.css">
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
	<body >

	<!-- THE LOADER -->

	<div class="be-loader">
    	<div class="spinner">
			<img src="resources/template/img/logo-loader.png"  alt="">
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
			<div class="head-bg-img"></div>
			<div class="head-bg-content">
				<h1>당신의 소중한 자산관리 하나에게 맡기세요</h1>
				<p>이제부터 눈으로 가계부를 쓰세요</p>
				
				<!-- 통계 출력 부분 -->
				<div class="be-large-post-align">
		                    <div class="tab-wrapper style-2 color-2">
		                        <div class="tab-nav-wrapper">
		                            <div  class="nav-tab  clearfix">
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
							<span class="be-dropdown-content"> 닉네임검색	</span>
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
								<a  data-filter=".category-1" class="filter">동적생성 1		</a>
								<a data-filter=".category-2" class="filter">동적생성2			</a>
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
								<li><a data-filter=".category-6" class="filter">주현이</a></li>
								<li><a data-filter=".category-1" class="filter">남친과</a></li>
								<li><a data-filter=".category-2" class="filter">언제</a></li>
								<li><a data-filter=".category-3" class="filter">식사할수</a></li>
								<li><a data-filter=".category-4" class="filter">있을까</a></li>
								<li><a data-filter=".category-5" class="filter">기다리다</a></li>
								<li><a data-filter=".category-6" class="filter">지쳐</a></li>
								<!-- <li><a data-filter=".category-1" class="filter">interactive</a></li>
								<li><a data-filter=".category-2" class="filter">blue</a></li>
								<li><a data-filter=".category-3" class="filter">branding</a></li> -->
							</ul>
						</div>
					</div>
					<!-- <div class="be-vidget">
						<h3 class="letf-menu-article">
							Filter By
						</h3>
						<div class="filter-block">
							<ul>
								<li><a><i class="fa fa-graduation-cap"></i>Schools</a>
									<div class="be-popup">
										<h3 class="letf-menu-article">
											Enter School
										</h3>
											<form action="./" class="input-search">
												<input class="filters-input" type="text" required placeholder="Start typing to see list">
											</form>
										<i class="fa fa-times"></i>
									</div>
								</li>
								<li><a><i class="fa fa-wrench"></i>Tools Used</a>
									<div class="be-popup">
										<h3 class="letf-menu-article">
											Tools
										</h3>
											<form action="./" class="input-search">
												<input class="filters-input" type="text" required placeholder="Start typing to see list">
											</form>
										<i class="fa fa-times"></i>
									</div>
								</li>
								<li><a><i class="fa fa-paint-brush"></i>Color</a>
									<div class="be-popup be-color-picker">
									<h3 class="letf-menu-article">
											Choose color
										</h3>
										<div class="for-colors">
											<ul class="colors  cfix">
												  <li data-filter=".category-1" class="color filter color-0-0"></li>
												  <li data-filter=".category-2" class="color filter color-0-1"></li>
												  <li data-filter=".category-3" class="color filter color-0-2"></li>
												  <li data-filter=".category-4" class="color filter color-0-3"></li>
												  <li data-filter=".category-5" class="color filter color-0-4"></li>
												  <li data-filter=".category-1" class="color filter color-0-5"></li>
												  <li data-filter=".category-2" class="color filter color-0-6"></li>
												  <li data-filter=".category-3" class="color filter color-0-7"></li>
												  <li data-filter=".category-4" class="color filter color-0-8"></li>
												  <li data-filter=".category-5" class="color filter color-0-9"></li>
												  <li data-filter=".category-1" class="color filter color-0-10"></li>
												  <li data-filter=".category-5" class="color filter color-0-11"></li>
												  <li data-filter=".category-1" class="color filter color-1-0"></li>
												  <li data-filter=".category-2" class="color filter color-1-1"></li>
												  <li data-filter=".category-1" class="color filter color-1-2"></li>
												  <li data-filter=".category-1" class="color filter color-1-3"></li>
												  <li data-filter=".category-1" class="color filter color-1-4"></li>
												  <li data-filter=".category-4" class="color filter color-1-5"></li>
												  <li data-filter=".category-1" class="color filter color-1-6"></li>
												  <li data-filter=".category-1" class="color filter color-1-7"></li>
												  <li data-filter=".category-6" class="color filter color-1-8"></li>
												  <li data-filter=".category-1" class="color filter color-1-9"></li>
												  <li data-filter=".category-1" class="color filter color-1-10"></li>
												  <li data-filter=".category-1" class="color filter color-1-11"></li>
												  <li data-filter=".category-1" class="color filter color-2-0"></li>
												  <li data-filter=".category-1" class="color filter color-2-1"></li>
												  <li data-filter=".category-1" class="color filter color-2-2"></li>
												  <li data-filter=".category-1" class="color filter color-2-3"></li>
												  <li data-filter=".category-1" class="color filter color-2-4"></li>
												  <li data-filter=".category-1" class="color filter color-2-5"></li>
												  <li data-filter=".category-1" class="color filter color-2-6"></li>
												  <li data-filter=".category-1" class="color filter color-2-7"></li>
												  <li data-filter=".category-1" class="color filter color-2-8"></li>
												  <li data-filter=".category-1" class="color filter color-2-9"></li>
												  <li data-filter=".category-1" class="color filter color-2-10"></li>
												  <li data-filter=".category-1" class="color filter color-2-11"></li>
												  <li data-filter=".category-1" class="color filter color-3-0"></li>
												  <li data-filter=".category-1" class="color filter color-3-1"></li>
												  <li data-filter=".category-1" class="color filter color-3-2"></li>
												  <li data-filter=".category-1" class="color filter color-3-3"></li>
												  <li data-filter=".category-1" class="color filter color-3-4"></li>
												  <li data-filter=".category-1" class="color filter color-3-5"></li>
												  <li data-filter=".category-1" class="color filter color-3-6"></li>
												  <li data-filter=".category-1" class="color filter color-3-7"></li>
												  <li data-filter=".category-1" class="color filter color-3-8"></li>
												  <li data-filter=".category-1" class="color filter color-3-9"></li>
												  <li data-filter=".category-1" class="color filter color-3-10"></li>
												  <li data-filter=".category-1" class="color filter color-3-11"></li>
												  <li data-filter=".category-1" class="color filter color-4-0"></li>
												  <li data-filter=".category-1" class="color filter color-4-1"></li>
												  <li data-filter=".category-1" class="color filter color-4-2"></li>
												  <li data-filter=".category-1" class="color filter color-4-3"></li>
												  <li data-filter=".category-1" class="color filter color-4-4"></li>
												  <li data-filter=".category-1" class="color filter color-4-5"></li>
												  <li data-filter=".category-1" class="color filter color-4-6"></li>
												  <li data-filter=".category-1" class="color filter color-4-7"></li>
												  <li data-filter=".category-1" class="color filter color-4-8"></li>
												  <li data-filter=".category-1" class="color filter color-4-9"></li>
												  <li data-filter=".category-1" class="color filter color-4-10"></li>
												  <li data-filter=".category-1" class="color filter color-4-11"></li>
												  <li data-filter=".category-1" class="color filter color-5-0"></li>
												  <li data-filter=".category-1" class="color filter color-5-1"></li>
												  <li data-filter=".category-1" class="color filter color-5-2"></li>
												  <li data-filter=".category-1" class="color filter color-5-3"></li>
												  <li data-filter=".category-1" class="color filter color-5-4"></li>
												  <li data-filter=".category-1" class="color filter color-5-5"></li>
												  <li data-filter=".category-1" class="color filter color-5-6"></li>
												  <li data-filter=".category-1" class="color filter color-5-7"></li>
												  <li data-filter=".category-1" class="color filter color-5-8"></li>
												  <li data-filter=".category-1" class="color filter color-5-9"></li>
												  <li data-filter=".category-1" class="color filter color-5-10"></li>
												  <li data-filter=".category-1" class="color filter color-5-11"></li>
												  <li data-filter=".category-1" class="color filter color-6-0"></li>
												  <li data-filter=".category-1" class="color filter color-6-1"></li>
												  <li data-filter=".category-6" class="color filter color-6-2"></li>
												  <li data-filter=".category-1" class="color filter color-6-3"></li>
												  <li data-filter=".category-1" class="color filter color-6-4"></li>
												  <li data-filter=".category-1" class="color filter color-6-5"></li>
												  <li data-filter=".category-1" class="color filter color-6-6"></li>
												  <li data-filter=".category-1" class="color filter color-6-7"></li>
												  <li data-filter=".category-1" class="color filter color-6-8"></li>
												  <li data-filter=".category-1" class="color filter color-6-9"></li>
												  <li data-filter=".category-1" class="color filter color-6-10"></li>
												  <li data-filter=".category-1" class="color filter color-6-11"></li>
												  <li data-filter=".category-1" class="color filter color-7-0"></li>
												  <li data-filter=".category-1" class="color filter color-7-1"></li>
												  <li data-filter=".category-1" class="color filter color-7-2"></li>
												  <li data-filter=".category-1" class="color filter color-7-3"></li>
												  <li data-filter=".category-1" class="color filter color-7-4"></li>
												  <li data-filter=".category-1" class="color filter color-7-5"></li>
												  <li data-filter=".category-1" class="color filter color-7-6"></li>
												  <li data-filter=".category-1" class="color filter color-7-7"></li>
												  <li data-filter=".category-1" class="color filter color-7-8"></li>
												  <li data-filter=".category-1" class="color filter color-7-9"></li>
												  <li data-filter=".category-1" class="color filter color-7-10"></li>
												  <li data-filter=".category-1" class="color filter color-7-11"></li>
												  <li data-filter=".category-1" class="color filter color-8-0"></li>
												  <li data-filter=".category-1" class="color filter color-8-1"></li>
												  <li data-filter=".category-1" class="color filter color-8-2"></li>
												  <li data-filter=".category-1" class="color filter color-8-3"></li>
												  <li data-filter=".category-1" class="color filter color-8-4"></li>
												  <li data-filter=".category-1" class="color filter color-8-5"></li>
												  <li data-filter=".category-1" class="color filter color-8-6"></li>
												  <li data-filter=".category-6" class="color filter color-8-7"></li>
												  <li data-filter=".category-1" class="color filter color-8-8"></li>
												  <li data-filter=".category-1" class="color filter color-8-9"></li>
												  <li data-filter=".category-1" class="color filter color-8-10"></li>
												  <li data-filter=".category-1" class="color filter color-8-11"></li>
												  <li data-filter=".category-1" class="color filter color-9-0"></li>
												  <li data-filter=".category-1" class="color filter color-9-1"></li>
												  <li data-filter=".category-1" class="color filter color-9-2"></li>
												  <li data-filter=".category-1" class="color filter color-9-3"></li>
												  <li data-filter=".category-6" class="color filter color-9-4"></li>
												  <li data-filter=".category-1" class="color filter color-9-5"></li>
												  <li data-filter=".category-1" class="color filter color-9-6"></li>
												  <li data-filter=".category-1" class="color filter color-9-7"></li>
												  <li data-filter=".category-1" class="color filter color-9-8"></li>
												  <li data-filter=".category-1" class="color filter color-9-9"></li>
												  <li data-filter=".category-1" class="color filter color-9-10"></li>
												  <li data-filter=".category-1" class="color filter color-9-11"></li>
											</ul>
										</div>
										<i class="fa fa-times"></i>
											
									</div>
								</li>
								<li><a><i class="fa fa-camera-retro"></i>Visit Gallery</a>
									<div class="be-popup">
										<h3 class="letf-menu-article">
											Galerry
										</h3>
											<form action="./" class="input-search">
												<input  class="filters-input" type="text" required placeholder="Start typing to see list">
											</form>
										<i class="fa fa-times"></i>
									</div>
								</li>
							</ul>
						</div>
					</div> -->
				</div>

				<div class="col-md-10">
					<div id="container-mix"  class="row _post-container_">
						<div class="category-1 mix custom-column-5">
							<div class="be-post">
								<a href="page1.html" class="be-img-block">
								<img src="resources/template/img/p1.jpg" alt="omg">
								</a>
								<a href="page1.html" class="be-post-title">The kitsch destruction of our world</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a1.png" alt="" class="ava-author">
									<span>by <a href="page1.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-2 mix custom-column-5">
							<div class="be-post">
								<a href="page2.html" class="be-img-block">
								<img src="resources/template/img/p2.jpg" alt="omg">
								</a>
								<a href="page2.html" class="be-post-title">Treebeard</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a1.png" alt="" class="ava-author">
									<span>by <a href="page2.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-3 mix custom-column-5">
							<div class="be-post">
								<a href="page3.html" class="be-img-block">
								<img src="resources/template/img/p3.jpg" alt="omg">
								</a>
								<a href="page3.html" class="be-post-title">Colors of Ramadan</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a2.png" alt="" class="ava-author">
									<span>by <a href="page3.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-4 mix custom-column-5">
							<div class="be-post">
								<a href="page1.html" class="be-img-block">
								<img src="resources/template/img/p4.jpg" alt="omg">
								</a>
								<a href="page1.html" class="be-post-title">Leaving Home - L'Officiel Ukraine</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a3.png" alt="" class="ava-author">
									<span>by <a href="page1.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-5 mix custom-column-5">
							<div class="be-post">
								<a href="page2.html" class="be-img-block">
								<img src="resources/template/img/p5.jpg" alt="omg">
								</a>
								<a href="page2.html" class="be-post-title">Drive Your World</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a4.png" alt="" class="ava-author">
									<span>by <a href="page2.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-6 mix custom-column-5">
							<div class="be-post">
								<a href="page1.html" class="be-img-block">
								<img src="resources/template/img/p13.jpg" alt="omg">
								</a>
								<a href="page1.html" class="be-post-title">Fran Ewald for The Diaries Project</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a5.png" alt="" class="ava-author">
									<span>by <a href="page1.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-5 mix custom-column-5">
							<div class="be-post">
								<a href="page1.html" class="be-img-block">
								<img src="resources/template/img/p7.jpg" alt="omg">
								</a>
								<a href="page1.html" class="be-post-title">raindrops monochrome</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a6.png" alt="" class="ava-author">
									<span>by <a href="page1.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-3 mix custom-column-5">
							<div class="be-post">
								<a href="page3.html" class="be-img-block">
								<img src="resources/template/img/p8.jpg" alt="omg">
								</a>
								<a href="page3.html" class="be-post-title">Racing Queensland</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a7.png" alt="" class="ava-author">
									<span>by <a href="page3.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-2 mix custom-column-5">
							<div class="be-post">
								<a href="page1.html" class="be-img-block">
								<img src="resources/template/img/p9.jpg" alt="omg">
								</a>
								<a href="page1.html" class="be-post-title">NAHA Finalist Hairstylist of the Year Allen Ruiz</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a7.png" alt="" class="ava-author">
									<span>by <a href="page1.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-4 mix custom-column-5">
							<div class="be-post">
								<a href="page1.html" class="be-img-block">
								<img src="resources/template/img/p10.jpg" alt="omg">
								</a>
								<a href="page1.html" class="be-post-title">tomorrow</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a8.png" alt="" class="ava-author">
									<span>by <a href="page1.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-6 mix custom-column-5">
							<div class="be-post">
								<a href="page1.html" class="be-img-block">
								<img src="resources/template/img/p11.jpg" alt="omg">
								</a>
								<a href="page1.html" class="be-post-title">Tropicalia</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a5.png" alt="" class="ava-author">
									<span>by <a href="page1.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-2 mix custom-column-5">
							<div class="be-post">
								<a href="page1.html" class="be-img-block">
								<img src="resources/template/img/p12.jpg" alt="omg">
								</a>
								<a href="page1.html" class="be-post-title">Face</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a6.png" alt="" class="ava-author">
									<span>by <a href="page1.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-1 mix custom-column-5">
							<div class="be-post">
								<a href="page1.html" class="be-img-block">
								<img src="resources/template/img/p13.jpg" alt="omg">
								</a>
								<a href="page1.html" class="be-post-title">Stay Ahead Series</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a5.png" alt="" class="ava-author">
									<span>by <a href="page1.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-3 mix custom-column-5">
							<div class="be-post">
								<a href="page1.html" class="be-img-block">
								<img src="resources/template/img/p14.jpg" alt="omg">
								</a>
								<a href="page1.html" class="be-post-title">Faber-Castell / Psychological Problems</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a1.png" alt="" class="ava-author">
									<span>by <a href="page1.html">Hoang Nguyen</a></span>
								</div>
								<div class="info-block">
									<span><i class="fa fa-thumbs-o-up"></i> 360</span>
									<span><i class="fa fa-eye"></i> 789</span>
									<span><i class="fa fa-comment-o"></i> 20</span>
								</div>
							</div>
						</div>
						<div class="category-1 mix custom-column-5">
							<div class="be-post">
								<a href="page1.html" class="be-img-block">
								<img src="resources/template/img/p15.jpg" alt="omg">
								</a>
								<a href="page1.html" class="be-post-title">Garry Simpson - Bridges - Intelligent Life Magazine</a>
								<span>
									<a href="blog-detail-2.html" class="be-post-tag">Interaction Design</a>, 
									<a href="blog-detail-2.html" class="be-post-tag">UI/UX</a>,  
									<a href="blog-detail-2.html" class="be-post-tag">Web Design</a>
								</span>
								<div class="author-post">
									<img src="resources/template/img/a9.png" alt="" class="ava-author">
									<span>by <a href="page1.html">Hoang Nguyen</a></span>
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
	<!-- THE FOOTER -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

	<div class="be-fixed-filter"></div>
	
	<!--  로그인 팝업 -->
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
						
						<form method="post" action="/salmon/customLogout"  class="popup-input-search">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<button  class="be-popup-sign-button">로그아웃</button>
						</form>
						<!-- 
						<form action="./" class="popup-input-search">
						<div class="col-md-6">
							<input class="input-signtype" type="email" required="" placeholder="Your email">
						</div>
						<div class="col-md-6">
							<input class="input-signtype" type="password" required="" placeholder="Password">
						</div>
						<div class="col-xs-6">
							<div class="be-checkbox">
							<label class="check-box">
								    <input class="checkbox-input" type="checkbox" value=""> <span class="check-box-sign"></span>
								</label>
								<span class="large-popup-text">
									Stay signed in
								</span>
							</div>
							
							<a href="blog-detail-2.html" class="link-large-popup">Forgot password?</a>
						</div>
						<div class="col-xs-6 for-signin">
							<input type="submit" class="be-popup-sign-button" value="SIGN IN">
						</div>
						</form>
						 -->
						
					</div>
				</div>
			</div>
		</div>
	</div>
		<!--  로그인 팝업 끝-->
	
	<div class="large-popup register">
		<div class="large-popup-fixed"></div>
		<div class="container large-popup-container">
			<div class="row">
				<div class="col-md-10 col-md-push-1 col-lg-8 col-lg-push-2 large-popup-content">
					<div class="row">
						<div class="col-md-12">
							<i class="fa fa-times close-button"></i>
							<h5 class="large-popup-title">Register</h5>
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
							<input class="input-signtype" type="text" required="" placeholder="Email">
						</div>
						<div class="col-md-6">
							<input class="input-signtype" type="text" required="" placeholder="Password">
						</div>
						<div class="col-md-6">
							<input class="input-signtype" type="text" required="" placeholder="Repeat Password">
						</div>
						<div class="col-md-12 be-date-block">
							<span class="large-popup-text">
								Date of birth
							</span>
							<div class="be-custom-select-block mounth">
								<select class="be-custom-select">
									<option value="" disabled selected>
										Mounth
									</option>
									<option value="">January</option>	
									<option value="">February</option>	
									<option value="">March</option>	
									<option value="">April</option>	
									<option value="">May</option>	
									<option value="">June</option>	
									<option value="">July</option>	
									<option value="">August</option>	
									<option value="">September</option>	
									<option value="">October</option>	
									<option value="">November</option>	
									<option value="">December</option>
								</select>
							</div>
							<div class="be-custom-select-block">
								<select class="be-custom-select">
									<option value="" disabled selected>
										Day
									</option>
									<option value="">1</option>
									<option value="">2</option>
									<option value="">3</option>
									<option value="">4</option>
									<option value="">5</option>
									<option value="">6</option>
									<option value="">7</option>
									<option value="">8</option>
									<option value="">9</option>
									<option value="">10</option>
									<option value="">11</option>
									<option value="">12</option>
									<option value="">13</option>
									<option value="">14</option>
									<option value="">15</option>
									<option value="">16</option>
									<option value="">17</option>
									<option value="">18</option>
									<option value="">19</option>
									<option value="">20</option>
									<option value="">21</option>
									<option value="">22</option>
									<option value="">23</option>
									<option value="">24</option>
									<option value="">25</option>
									<option value="">26</option>
									<option value="">27</option>
									<option value="">28</option>
									<option value="">29</option>
									<option value="">30</option>
								</select>
							</div>
							<div class="be-custom-select-block">
								<select class="be-custom-select">
									<option value="" disabled selected>
										Year
									</option>
									<option value="">1996</option>
									<option value="">1997</option>
									<option value="">1998</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="be-checkbox">
								<label class="check-box">
								    <input class="checkbox-input" type="checkbox" required="" value="" > <span class="check-box-sign"></span>
								</label>
								<span class="large-popup-text">
									I have read and agree to the <a class="be-popup-terms" href="blog-detail-2.html">Terms of Use</a> and <a class="be-popup-terms" href="blog-detail-2.html">Privacy Policy</a>.
								</span>
							</div>
							<div class="be-checkbox">
								<label class="check-box">
								    <input class="checkbox-input" type="checkbox" value="" > <span class="check-box-sign"></span>
								</label>
								<span class="large-popup-text">
									Send me notifications
								</span>
							</div>
						</div>
						<div class="col-md-6 for-signin">
							<input type="submit" class="be-popup-sign-button" value="SIGN IN">
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="theme-config">
	    <div class="main-color">
	        <div class="title">Main Color:</div>
	        <div class="colours-wrapper">
	            <div class="entry color1 m-color active" data-colour="resources/template/style/stylesheet.css"></div>   
	            <div class="entry color3 m-color"  data-colour="resources/template/style/style-green.css"></div>
	            <div class="entry color6 m-color"  data-colour="resources/template/style/style-orange.css"></div>
	            <div class="entry color8 m-color"  data-colour="resources/template/style/style-red.css"></div>  
	            <div class="title">Second Color:</div>  
	            <div class="entry s-color  active color10"  data-colour="resources/template/style/stylesheet.css"></div>
	            <div class="entry s-color color11"  data-colour="resources/template/style/style-oranges.css"></div> 
	            <div class="entry s-color color12"  data-colour="resources/template/style/style-greens.css"></div>
	            <div class="entry s-color color13"  data-colour="resources/template/style/style-reds.css"></div>
	        </div>
	    </div>
	   <div class="open"><img src="resources/template/img/icon-134.png" alt=""></div>
	</div>
	<!-- SCRIPTS	 -->
	<script src="resources/template/script/jquery-2.1.4.min.js"></script>
	<script src="resources/template/script/jquery-ui.min.js"></script>
	<script src="resources/template/script/bootstrap.min.js"></script>		
	<script src="resources/template/script/idangerous.swiper.min.js"></script>
	<script src="resources/template/script/jquery.mixitup.js"></script>
	<script src="resources/template/script/jquery.viewportchecker.min.js"></script>
	<script src="resources/template/script/filters.js"></script>
	<script src="resources/template/script/global.js"></script>
	<script>
	Highcharts.createElement('link', {
	    href: 'https://fonts.googleapis.com/css?family=Unica+One',
	    rel: 'stylesheet',
	    type: 'text/css'
	}, null, document.getElementsByTagName('head')[0]);
	
	Highcharts.theme = {
	    colors: ['#2b908f', '#90ee7e', '#f45b5b', '#7798BF', '#aaeeee', '#ff0066',
	        '#eeaaee', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
	    chart: {
	        backgroundColor: {
	            linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
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
			    text: '기준 월 소비 현황, 11월'
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
			    data: [{
			      name: '주류',
			      y: 61.41,
			      sliced: true,
			      selected: true
			    }, {
			      name: '유류비',
			      y: 11.84
			    }, {
			      name: '여행',
			      y: 10.85
			    }, {
			      name: '문화',
			      y: 4.67
			    }, {
			      name: '영화',
			      y: 4.18
			    }, {
			      name: '간식',
			      y: 1.64
			    }, {
			      name: '식사',
			      y: 1.6
			    }, {
			      name: '여가활동',
			      y: 1.2
			    }, {
			      name: '기타',
			      y: 2.61
			    }]
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