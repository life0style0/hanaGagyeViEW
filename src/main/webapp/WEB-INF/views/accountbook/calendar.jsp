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
	<link rel="stylesheet" href="/salmon/resources/jjw/css/bootstrap-datepicker3.min.css">
	<link rel="stylesheet" href="/salmon/resources/jjw/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/salmon/resources/jjw/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="/salmon/resources/jjw/css/stylesheet_jjw.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.3.2/css/bootstrap-slider.min.css">
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
				<div class="col-md-4">
					<div class="for-be-dropdowns">
						<div class="be-drop-down">
							<i class="icon-projects"></i>
							<span class="be-dropdown-content ggv-type">수입/지출</span>
							<ul class="drop-down-list">
								<li><a data-type="calendar-all">수입/지출</a></li>
								<li><a data-type="calendar-income">수입</a></li>
								<li><a data-type="calendar-spend">지출</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="sorting-cal-money">
						Filter by price interval: <b>€ 10</b>
						<input id="ex2" type="text" class="span2" value="" data-slider-min="10" data-slider-max="1000" data-slider-step="5"
						 data-slider-value="[250,450]" /> <b>€ 1000</b>
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
								카테고리
							</h3>
							<div class="tags_block clearfix">
								<ul class="ggv-category">
								</ul>
							</div>
						</div>
					</div>

					<div class="col-md-10" id="calendar-main">
						<div class="new-ggv"><button type="button" class="btn btn-primary my-btn">새 가계부글 올리기</button><button type="button"
							 class="btn btn-info my-btn">월 공유</button></div>
						<div class="calendar-head text-center"><span><i class="fa fa-chevron-left calendar-left"></i></span><span class="calendar month"></span><input
							 type="text" id="datePic" class="invisible datepic"><span class="calendar year"></span><span><i class="fa fa-chevron-right calendar-right"></i></span></div>
						<table id="calendar">
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
												<div class="calendar-sort">
													<div class="calendar-date"></div>
													<div class="calendar-spend sort-cal-spend"></div>
													<div class="calendar-income sort-cal-income"></div>
												</div>
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
		<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script> -->
		<script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
		<script src="/salmon/resources/template/script/jquery-ui.min.js"></script>
		<script src="/salmon/resources/template/script/bootstrap.min.js"></script>
		<script src="/salmon/resources/template/script/idangerous.swiper.min.js"></script>
		<!-- <script src="/salmon/resources/template/script/jquery.mixitup.js"></script> -->
		<script src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>
		<script src="/salmon/resources/template/script/filters.js"></script>
		<script src="/salmon/resources/jjw/js/mixitup.js"></script>
		<script src="/salmon/resources/template/script/global.js"></script>
		<script src="/salmon/resources/jjw/js/bootstrap-datepicker.min.js"></script>
		<script src="/salmon/resources/jjw/js/bootstrap-datepicker.kr.min.js"></script>
		<script src="/salmon/resources/jjw/js/owl.carousel.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.3.2/bootstrap-slider.min.js"></script>
		<script src="/salmon/resources/jjw/js/my.js"></script>
</body>

</html>