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
	<link rel="stylesheet" href="/salmon/resources/jjw/css/bootstrap-datepicker3.min.css">
	<link rel="stylesheet" href="/salmon/resources/jjw/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/salmon/resources/jjw/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="/salmon/resources/jjw/css/stylesheet_jjw.css">
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
	<%@ include file="../includes/header.jsp"%>
	<!-- THE HEADER -->

	<!-- MAIN CONTENT -->
	<div id="content-block">
		<div class="head-bg">
			<div class="head-bg-img"></div>
			<div class="head-bg-content">
				<h1>Your Best Social Network Template</h1>
				<p>Donec in rhoncus tortor. Sed tristique auctor ligula vel viverra</p>
				<a class="btn color-1 size-1 hover-1"><i class="fa fa-facebook"></i>sign up via facebook</a>
				<a class="be-register btn color-3 size-1 hover-6"><i class="fa fa-lock"></i>sign up now</a>
			</div>
		</div>
		<div class="container-fluid cd-main-content custom-container">
			<div class="row">
				<div class="col-md-2 left-field">
					<form action="./" class="input-search">
						<input type="text" required="" placeholder="Enter keyword">
						<i class="fa fa-search"></i>
						<input type="submit" value="">
					</form>
				</div>
				<div class="col-md-10">
					<div class="for-be-dropdowns">
						<div class="be-drop-down">
							<i class="icon-projects"></i>
							<span class="be-dropdown-content"> Projects </span>
							<ul class="drop-down-list">
								<li class="filter" data-filter=".category-1"><a data-type="category-1">Projects</a></li>
								<li class="filter" data-filter=".category-2"><a data-type="category-2">Work in Progress</a></li>
								<li class="filter" data-filter=".category-3"><a data-type="category-3">People</a></li>
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
						<div class="be-drop-down">
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
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid custom-container">
			<div class="row">

				<div class="col-md-2 left-field">
					<div class="be-vidget">
						<h3 class="letf-menu-article">
							Popular Creative Filds
						</h3>
						<div class="creative_filds_block">
							<div class="ul">
								<a data-filter=".category-1" class="filter">Graphic Design </a>
								<a data-filter=".category-2" class="filter">Photography </a>
								<a data-filter=".category-3" class="filter">Interaction Design </a>
								<a data-filter=".category-4" class="filter">Art Direction </a>
								<a data-filter=".category-5" class="filter">Illustration </a>
							</div>
						</div>
					</div>
					<div class="be-vidget">
						<h3 class="letf-menu-article">
							Popular Tags
						</h3>
						<div class="tags_block clearfix">
							<ul>
								<li><a data-filter=".category-6" class="filter">photoshop</a></li>
								<li><a data-filter=".category-1" class="filter">graphic</a></li>
								<li><a data-filter=".category-2" class="filter">art</a></li>
								<li><a data-filter=".category-3" class="filter">website</a></li>
								<li><a data-filter=".category-4" class="filter">logo</a></li>
								<li><a data-filter=".category-5" class="filter">identity</a></li>
								<li><a data-filter=".category-6" class="filter">logo design</a></li>
								<li><a data-filter=".category-1" class="filter">interactive</a></li>
								<li><a data-filter=".category-2" class="filter">blue</a></li>
								<li><a data-filter=".category-3" class="filter">branding</a></li>
							</ul>
						</div>
					</div>
					<div class="be-vidget">
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
								<li><a><i class="fa fa-camera-retro"></i>Visit Gallery</a>
									<div class="be-popup">
										<h3 class="letf-menu-article">
											Galerry
										</h3>
										<form action="./" class="input-search">
											<input class="filters-input" type="text" required placeholder="Start typing to see list">
										</form>
										<i class="fa fa-times"></i>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-md-10">
					<div class="calendar-head text-center"><span class="calendar month">11</span><input type="text" id="datePic" class="invisible datepic"><span
						 class="calendar year">2018</span></div>
					<table id="calendar" class="calendar">
						<thead>
							<tr>
								<th class="text-center calendar-day"><strong>일</strong></th>
								<th class="text-center calendar-day"><strong>월</strong></th>
								<th class="text-center calendar-day"><strong>화</strong></th>
								<th class="text-center calendar-day"><strong>수</strong></th>
								<th class="text-center calendar-day"><strong>목</strong></th>
								<th class="text-center calendar-day"><strong>금</strong></th>
								<th class="text-center calendar-day"><strong>토</strong></th>
							</tr>
						</thead>
						<tbody id="calendar-body">
							<c:forEach begin="0" end="5" var="weekNum">
								<tr>
									<c:forEach begin="1" end="7" var="dateNum">
										<td id="calendar-${dateNum+(weekNum*7)}">
											<ul>
												<li class="calendar-date"></li>
												<li class="calendar-spend"></li>
												<li class="calendar-income"></li>
											</ul>
										</td>
									</c:forEach>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- THE FOOTER -->
	<%@ include file="../includes/footer.jsp"%>
	<!-- THE FOOTER -->

	<div class="be-fixed-filter"></div>

	<!-- Modal -->
	<div class="modal fade" id="ggv-modal" tabindex="-1" role="dialog" aria-labelledby="ggv-modal-label" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="ggv-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="ggv-modal-label">2018년 11월 27일 오후 1시 12분</h4>
				</div>
				<div class="ggv-body">
					<div class="ggv-carousel owl-carousel owl-theme">
					</div>
					<div class="ggv-modal-content">
						<div class="ggv-col-6">
							<div class="col-md-6 text-center ggv-content-left">공개 범위</div>
							<div class="col-md-6 text-center ggv-content-right" id="ggvScope">나만</div>
						</div>
						<div class="ggv-col-6">
							<div class="col-md-6 text-center ggv-content-left">금액</div>
							<div class="col-md-6 text-center ggv-content-right" id="ggvMoney">100,000원</div>
						</div>
						<div class="ggv-col-6">
							<div class="col-md-6 text-center ggv-content-left">카테고리</div>
							<div class="col-md-6 text-center ggv-content-right" id="ggvCtgry">음식</div>
						</div>
						<div class="ggv-col-6">
							<div class="col-md-6 text-center ggv-content-left">결제 방법</div>
							<div class="col-md-6 text-center ggv-content-right" id="ggvPayType">카드</div>
						</div>
						<div class="ggv-col-12" id="ggvContent">
							여기가 리뷰 내용여기가 리뷰 내용여기가 리뷰 내용여기가 리뷰 내용여기가 리뷰 내용여기가 리뷰 내용여기가 리뷰 내용여기가 리뷰 내용여기가 리뷰 내용여기가 리뷰 내용여기가 리뷰 내용여기가 리뷰 내용
						</div>
					</div>
				</div>
				<div class="ggv-footer">
				</div>
			</div>
		</div>
	</div>

	<div class="theme-config">
		<div class="main-color">
			<div class="title">Main Color:</div>
			<div class="colours-wrapper">
				<div class="entry color1 m-color active" data-colour="style/stylesheet.css"></div>
				<div class="entry color3 m-color" data-colour="style/style-green.css"></div>
				<div class="entry color6 m-color" data-colour="style/style-orange.css"></div>
				<div class="entry color8 m-color" data-colour="style/style-red.css"></div>
				<div class="title">Second Color:</div>
				<div class="entry s-color  active color10" data-colour="style/stylesheet.css"></div>
				<div class="entry s-color color11" data-colour="style/style-oranges.css"></div>
				<div class="entry s-color color12" data-colour="style/style-greens.css"></div>
				<div class="entry s-color color13" data-colour="style/style-reds.css"></div>
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
	<!-- <script src="script/mixitup.js"></script> -->
	<script src="/salmon/resources/template/script/global.js"></script>
	<script src="/salmon/resources/jjw/js/bootstrap-datepicker.min.js"></script>
	<script src="/salmon/resources/jjw/js/bootstrap-datepicker.kr.min.js"></script>
	<script src="/salmon/resources/jjw/js/owl.carousel.min.js"></script>
	<script src="/salmon/resources/jjw/js/my.js"></script>
</body>

</html>