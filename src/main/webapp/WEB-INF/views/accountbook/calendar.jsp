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
	<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
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
		<div class="container-fluid cd-main-content custom-container top-margin-100">
			<div class="row">
				<div class="col-md-2 left-field">
					<form action="./" class="input-search">
						<input type="text" required="" placeholder="Enter keyword">
						<i class="fa fa-search"></i>
						<input type="submit" value="">
					</form>
				</div>
				<div class="col-md-10 accountbook-calendar">
					<div class="for-be-dropdowns">
						<div class="be-drop-down">
							<i class="icon-projects"></i>
							<span class="be-dropdown-content ggv-scope-dropdown">나만/공개</span>
							<ul class="drop-down-list ggv-scope-list">
								<li><a>나만/공개</a></li>
								<li><a>공개</a></li>
								<li><a>나만</a></li>
							</ul>
						</div>
						<div class="be-drop-down">
							<i class="icon-projects"></i>
							<span class="be-dropdown-content ggv-type-dropdown">수입/지출</span>
							<ul class="drop-down-list ggv-type-list">
								<li><a>수입/지출</a></li>
								<li><a>수입</a></li>
								<li><a>지출</a></li>
							</ul>
						</div>
						<div class="sorting-cal-money">
						</div>
					</div>
				</div>
				<div class="col-md-10 accountbook-chart hidden">
					<div class="for-be-dropdowns">
						<div class="be-drop-down chart-year">
							<i class="icon-projects"></i>
							<span class="be-dropdown-content chart-year-dropdown"></span>
							<ul class="drop-down-list chart-year-list">
							</ul>
						</div>
						<div class="be-drop-down chart-month hidden">
							<i class="icon-projects"></i>
							<span class="be-dropdown-content chart-month-dropdown"></span>
							<ul class="drop-down-list chart-month-list">
								<li class="chart-month-data-12" data-month="12"><a>12월</a></li>
								<li class="chart-month-data-11" data-month="11"><a>11월</a></li>
								<li class="chart-month-data-10" data-month="10"><a>10월</a></li>
								<li class="chart-month-data-09" data-month="09"><a>09월</a></li>
								<li class="chart-month-data-08" data-month="08"><a>08월</a></li>
								<li class="chart-month-data-07" data-month="07"><a>07월</a></li>
								<li class="chart-month-data-06" data-month="06"><a>06월</a></li>
								<li class="chart-month-data-05" data-month="05"><a>05월</a></li>
								<li class="chart-month-data-04" data-month="04"><a>04월</a></li>
								<li class="chart-month-data-03" data-month="03"><a>03월</a></li>
								<li class="chart-month-data-02" data-month="02"><a>02월</a></li>
								<li class="chart-month-data-01" data-month="01"><a>01월</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid custom-container">
				<div class="row">
					<div class="col-md-2 left-field">
						<div class="be-vidget">
							<h3 class="letf-menu-article">
								Select Views
							</h3>
							<div class="creative_filds_block">
								<div class="ul">
									<a class="view-calendar active">Calendar</a>
									<a class="view-chart">Chart</a>
								</div>
							</div>
						</div>
						<div class="be-vidget accountbook-calendar">
							<h3 class="letf-menu-article">
								카테고리
							</h3>
							<div class="tags_block clearfix">
								<ul class="ggv-category">
								</ul>
							</div>
						</div>
						<div class="be-vidget accountbook-chart hidden">
							<h3 class="letf-menu-article">
								Select Chart
							</h3>
							<div class="creative_filds_block">
								<div class="ul">
									<a class="chart-month-spend active">월별 지출 비교 차트</a>
									<a class="chart-day-bar">일간 소비/수입 총합 차트</a>
									<a class="chart-month-goal">월 지출 목표 대비 지출 현황</a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-10 accountbook-calendar" id="accountbook-calendar">
						<div>
							<div class="edit-psn"><button type="button" class="btn btn-warning my-btn btn-edit-psn">가계부 설정</button></div>
							<div class="new-ggv"><a href="/salmon/article/register" class="btn btn-primary my-btn">새 가계부글 올리기</a><button
								 type="button" class="btn btn-info my-btn">월 공유</button></div>
						</div>
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

					<div class="col-md-10 accountbook-chart hidden" id="accountbook-chart">

					</div>

				</div>
			</div>
		</div>

		<!-- THE FOOTER -->
		<%@ include file="../includes/footer.jsp"%>
		<!-- THE FOOTER -->

		<div class="be-fixed-filter"></div>

		<!-- Modal -->
		<div class="modal fade ggv-modal" id="ggv-modal2" tabindex="-1" role="dialog" aria-labelledby="ggv-modal-label"
		 aria-hidden="true">
			<div class="modal-dialog ggv-no-image">
				<div class="modal-content">
					<div class="ggv-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">2018년 11월 27일 오후 1시 12분</h4>
					</div>
					<div class="ggv-body">
						<div class="col-md-6 ggv-modal-image">
							<div class="ggv-carousel owl-carousel owl-theme">
							</div>
						</div>
						<div class="col-md-6">
							<div class="ggv-modal-content">
								<div class="col-md-12 ggv-col-6">
									<div class="col-xs-6 col-md-6 text-center ggv-content-left">공개 범위</div>
									<div class="col-xs-6 col-md-6 text-center ggv-content-right"></div>
								</div>
								<div class="col-md-12 ggv-col-6">
									<div class="col-xs-6 col-md-6 text-center ggv-content-left">금액</div>
									<div class="col-xs-6 col-md-6 text-center ggv-content-right"></div>
								</div>
								<div class="col-md-12 ggv-col-6">
									<div class="col-xs-6 col-md-6 text-center ggv-content-left">카테고리</div>
									<div class="col-xs-6 col-md-6 text-center ggv-content-right"></div>
								</div>
								<div class="col-md-12 ggv-col-6">
									<div class="col-xs-6 col-md-6 text-center ggv-content-left">결제 방법</div>
									<div class="col-xs-6 col-md-6 text-center ggv-content-right"></div>
								</div>
								<div class="ggv-col-12">
								</div>
								<div class="ggv-col-12">
								</div>
							</div>
						</div>
					</div>
					<div class="ggv-footer">
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<%@ include file="../includes/articlemodal.jsp"%>


		<div class="modal fade" id="psn-modal" tabindex="-1" role="dialog" aria-labelledby="psn-modal-label" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="psn-modal-label">달력 설정</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="psn-form" action="/salmon/accountbook/psns" method="POST">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-6 control-label">달력 시작일 설정</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="psnMonthStartT" placeholder="ex) 25" title="달력은 15일 전과 후로 표시되는 모습이 조금 다릅니다!">
									<input type="hidden" name="psnMonthStart" value="${psns.psnMonthStart}">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-6 control-label">월 목표 지출액 설정</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="psnMonthlyPaymentT" placeholder="ex) 1000000" title="0보다 큰 양수만 입력해주세요">
									<input type="hidden" name="psnMonthlyPayment" value="${psns.psnMonthlyPayment}">
								</div>
							</div>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary psn-btn" id="psn-edit">수정하기</button>
						<button type="button" class="btn btn-warning psn-btn" data-dismiss="modal">닫기</button>
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
		<script src="/salmon/resources/template/script/global.js"></script>
		<script src="/salmon/resources/jjw/js/bootstrap-datepicker.min.js"></script>
		<script src="/salmon/resources/jjw/js/bootstrap-datepicker.kr.min.js"></script>
		<script src="/salmon/resources/jjw/js/owl.carousel.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.3.2/bootstrap-slider.min.js"></script>
		<script src="https://code.highcharts.com/highcharts.src.js"></script>
		<script src="/salmon/resources/jjw/js/validator.js"></script>
		<script src="/salmon/resources/jjw/js/accountbook-calendar.js"></script>
		<script src="/salmon/resources/jjw/js/accountbook-chart.js"></script>
		<script src="/salmon/resources/jjw/js/accountbook-global.js"></script>

</body>

</html>