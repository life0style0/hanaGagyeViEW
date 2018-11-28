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
	<link rel="stylesheet" href="salmon/style/bootstrap.min.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="salmon/style/icon.css">
	<link rel="stylesheet" href="salmon/style/loader.css">
	<link rel="stylesheet" href="salmon/style/idangerous.swiper.css">
	<link rel="stylesheet" href="salmon/style/jquery-ui.css">
	<link rel="stylesheet" href="salmon/style/stylesheet.css">
	<link rel="stylesheet" href="salmon/style/stylesheet_jjw.css">
</head>

<body>

	<!-- THE LOADER -->

	<div class="be-loader">
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
	<%@ include file="../includes/header.jsp"%>

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
					<table id="calendar" class="table table-bordered calendar">
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
										<td>
											<ul>
												<li class="calendar-date" id="calendar-${dateNum+(weekNum*7)}"></li>
											</ul>
										</td>
									</c:forEach>
								</tr>
							</c:forEach>
							<tr>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<ul>
										<li class="calendar-date" id="calendar-1"></li>
										<li class="calendar-spend">
											<div class="ggv">
												<div class="ggv-title">제목</div>
												<div class="ggv-content">내용</div>
											</div>
											<div class="ggv">
												<div class="ggv-title">제목</div>
												<div class="ggv-content">내용</div>
											</div>
											<div class="ggv">
												<div class="ggv-title">제목</div>
												<div class="ggv-content">내용</div>
											</div>
										</li>
										<li class="calendar-income">
											<div class="ggv">
												<div class="ggv-title">제목</div>
												<div class="ggv-content">내용</div>
											</div>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
							</tr>
							<tr>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
								<td>
									<div>1</div>
								</td>
							</tr>
						</tbody>
					</table>

				</div>

			</div>
		</div>
	</div>

	<!-- THE FOOTER -->
	<%@ include file="../includes/footer.jsp"%>

	<div class="be-fixed-filter"></div>

	<div class="large-popup login">
		<div class="large-popup-fixed"></div>
		<div class="container large-popup-container">
			<div class="row">
				<div class="col-md-8 col-md-push-2 col-lg-6 col-lg-push-3  large-popup-content">
					<div class="row">
						<div class="col-md-12">
							<i class="fa fa-times close-button"></i>
							<h5 class="large-popup-title">Log in</h5>
						</div>
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
					</div>
				</div>
			</div>
		</div>
	</div>
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
										<input class="checkbox-input" type="checkbox" required="" value=""> <span class="check-box-sign"></span>
									</label>
									<span class="large-popup-text">
										I have read and agree to the <a class="be-popup-terms" href="blog-detail-2.html">Terms of Use</a> and <a
										 class="be-popup-terms" href="blog-detail-2.html">Privacy Policy</a>.
									</span>
								</div>
								<div class="be-checkbox">
									<label class="check-box">
										<input class="checkbox-input" type="checkbox" value=""> <span class="check-box-sign"></span>
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
		<div class="open"><img src="img/icon-134.png" alt=""></div>
	</div>
	<!-- SCRIPTS	 -->
	<script src="salmon/script/jquery-2.1.4.min.js"></script>
	<script src="salmon/script/jquery-ui.min.js"></script>
	<script src="salmon/script/bootstrap.min.js"></script>
	<script src="salmon/script/idangerous.swiper.min.js"></script>
	<script src="salmon/script/jquery.mixitup.js"></script>
	<script src="salmon/script/jquery.viewportchecker.min.js"></script>
	<script src="salmon/script/filters.js"></script>
	<!-- <script src="script/mixitup.js"></script> -->
	<script src="salmon/script/global.js"></script>
	<script src="salmon/my/js/my.js"></script>
</body>

</html>