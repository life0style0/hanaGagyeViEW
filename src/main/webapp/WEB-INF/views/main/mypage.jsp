<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>HANA 가계ViEW</title>
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
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
		
		
		<!-- 혜림 css 추가 -->
		
    <!-- Icons font CSS-->
    <link href="/salmon/resources/SignUp/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/salmon/resources/SignUp/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <!-- <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet"> -->

    <!-- Vendor CSS-->
    <link href="/salmon/resources/SignUp/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="/salmon/resources/SignUp/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="/salmon/resources/SignUp/css/main.css" rel="stylesheet" media="all">
		<!-- 혜림 css 추가 -->
		
		
	</head>
	<body >

	<!-- THE LOADER -->
	<div class="be-loader">
    	<div class="spinner">
			<img src="/salmon/resources/template/img/logo-loader.png"  alt="">
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
			</div>
			</div>	
		</div>
		<div class="container-fluid cd-main-content custom-container">
			<div class="row">
				<div class="col-md-2 left-feild">
							
				</div>			
				<div class="col-md-10 ">
					<div class="for-be-dropdowns">
						
						
					</div>				
				</div>
			</div>
		</div>		
		<div class="container-fluid custom-container">
			<div class="row">
				
				<div class="col-md-2 left-feild">
					<div class="be-vidget">
						<h3 class="letf-menu-article">
							메뉴
						</h3>
						<div class="creative_filds_block">
							<div class="ul">
							<!-- 	<a data-filter=".category-1" class="filter">조회 </a>
								<a data-filter=".category-2" class="filter">수정 </a>
								<a data-filter=".category-3" class="filter">탈퇴 </a>
								 -->
								<a id="viewInfo-m" class="filter">조회 </a>
								<a id="editProfile-m" class="filter">프로필 수정 </a>
								<a id="editInfo-m" class="filter">개인정보 수정 </a>
								<a id="editCats-m" class="filter">관심카테고리 수정 </a>
								<a id="resign-m" class="filter">탈퇴 </a>
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
							
							</ul>
						</div>
					</div>
					
				</div>

				<div class="col-md-10">
				
				<div id="viewInfo">
					<h2> 내 정보 조회 </h2>
					
					<div> 
					<%-- <p>user : <sec:authentication property="principal.user"/></p> --%>
					<p> 닉네임 : <c:out value="${user.user_nickname}"/> </p>
					<p> 아이디 : <sec:authentication property="principal.username"/></p>
					<p> 이메일 : <c:out value="${user.user_email}"/> </p>
					<p> 성별 : <c:out value="${user.user_gender}"/></p>
					<p> 생일 : <c:out value="${user.user_birthday}"/> </p>
					<p> 프로필사진 : <sec:authentication property="principal.user.user_image"/></p>
					<p> 가입일 : <sec:authentication property="principal.user.user_regdate"/></p>
					
					<p> 권한 목록 : <sec:authentication property="principal.user.authList"/></p>  
					
					<p> 지역 : <c:out value="${userPsnsInfo.locationname}"/> </p>  
					<p> 관심 카테고리1 : <c:out value="${userPsnsInfo.ctgry1Name}"/> </p>  
					<p> 관심 카테고리2 : <c:out value="${userPsnsInfo.ctgry2Name}"/> </p>  
					<p> 관심 카테고리3 : <c:out value="${userPsnsInfo.ctgry3Name}"/> </p>  
					</div>
				</div>
				<div id="editProfile">
					<h2> 프로필 수정 </h2>
					닉네임, 프로필 사진 수정
					
					<form role="form" id="editProfileForm" method="post" action="/salmon/main/mypage/editprofile">
						
						<div>현재 닉네임 : <c:out value="${user.user_nickname}"/></div>
						<div class="input-group">
						수정할 닉네임 : 
						<input id="user_nickname" name="user_nickname"  required="required"  type="text" placeholder="닉네임">
						</div>
						<div id="valid_user_nickname">닉넴 체크</div>
						프로필사진 
						<input type="file" name="user_image">
						
						<input type="button" id="editProfileSubmitBtn" value="수정하기">
						 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>

				</div>
				<div id="editInfo">
					<h2> 내 정보 수정 </h2>
					
					비밀번호, 이메일, 생일, 지역 수정 
						
				 <form role="form" id="editInfoForm" method="post" action="/salmon/main/mypage/editmyinfo">
					<input type="hidden" name="user_id" id="user_id" value="<sec:authentication property="principal.username"/>">
					 <!-- 비밀번호 -->
					<div class="row row-space">
						<!-- 비밀번호 입력 -->
						<div class="col-2">
							<div class="input-group">
								<input class="input--style-1" type="password" placeholder="비밀번호"
									id="user_passwd" name="user_passwd">
							</div>
							<div id="valid_user_passwd">비밀번호 체크</div>
						</div>
						<!-- 비밀번호 입력 확인 -->
						<div class="col-2">
							<div class="input-group">
								<input class="input--style-1" type="password"
									placeholder="비밀번호 확인" id="same_user_passwd" name="same_passwd">
							</div>
							<div id="same_valid_user_passwd">비밀번호 체크</div>
						</div>
					</div>

					<div class="row row-space">
						<!-- 생년월일 -->
						<div class="col-2">
							<div class="input-group">
								<input class="input--style-1 js-datepicker" type="text"
									placeholder="생년월일" id="user_birthday"
									name="user_birthday" required="required"
									value="<c:out value="${user.user_birthday}"/>"> 
							</div>
							<div id="valid_user_birthday">생년월일 체크</div>
						</div>
						
						<div class="col-2">
							<div class="input-group">
								<div class="">
									<select id="genders" name="gender" required="required">
									<c:choose>
										<c:when test="${user.user_gender eq 'F'}">
											<option disabled="disabled">성별</option>
											<option id="user_gender_M" value="M">Male</option>
											<option id="user_gender_F" value="F"  selected="selected">Female</option>
										</c:when>
										<c:when test="${user.user_gender eq 'M' }">
											<option disabled="disabled">성별</option>
											<option id="user_gender_M" value="M"  selected="selected">Male</option>
											<option id="user_gender_F" value="F">Female</option>
										</c:when>
										<c:otherwise>
											<option disabled="disabled" selected="selected">성별</option>
											<option id="user_gender_M" value="M">Male</option>
											<option id="user_gender_F" value="F">Female</option>
										</c:otherwise>
									</c:choose>
									</select>
									<input type="hidden" id="user_gender" name="user_gender">
								</div>
							</div>
						</div>
					</div>

						<!-- 이메일 입력 -->
					<div class="col-2">
						<div class="input-group">
							<input class="input--style-1" id="user_email" name="user_email"
								type="text" placeholder="이메일  ex) hyerim123@gmail.com"
								value="<c:out value="${user.user_email}"/>">
						</div>
						<div id="valid_user_email">이메일 체크</div>
					</div>

						<div class="col-2">
							<div class="input-group">
								<div><c:out value="${userPsnsInfo.locationname}"/></div>
								<div class="">
									<select id="locations" required="required">
										<option disabled="disabled" selected="selected">지역</option>
										<option value="1">서울</option>
										<option value="2">부산</option>
									</select> 
									<input type="hidden" id="location_id" name="location_id" 
									>
								</div>
							</div>
						</div>

						<input type="button" id="editInfoSubmitBtn" value="수정하기">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
					</div>

				<div id="editCats">
					<h2>관심카테고리 수정</h2>


				<form role="form" id="editCategoriesForm" method="post" action="/salmon/main/mypage/editCategories">
					<div class="input-group">
						<ul id="categories">
							<c:choose>
								<c:when test="${not empty categories}">
									<c:forEach var="category" items="${categories}"
										varStatus="status">
										<li name="category" class="unselected" id="category-li-1">
											<div id="category-1" class="unselected"
												value="<c:out value="${category.ctgry_id}"/>">
												<c:out value="${category.ctgry_name}" />
											</div>
										</li>
									</c:forEach>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</ul>
						<input type="hidden" id="CTGRY_1" name="ctgry_1"> 
						<input type="hidden" id="CTGRY_2" name="ctgry_2"> 
						<input type="hidden" id="CTGRY_3" name="ctgry_3">
					</div>
					
					<input type="button" id="editCategoriesSubmitBtn" value="수정하기">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>

				</div><!-- 카테고리 수정 창 -->

				<div id="resign">
					<h2> 탈퇴 </h2>
					
					<!-- 탈퇴를 원하시면 비밀번호를 한번 더 입력해주세요
					<input type="password" name="resign-user_password" id="resign-user_password"> -->
					<button type="button" class="btn btn-danger" name="resignOpenBtn"
                                data-toggle="modal"  data-target="#resign-Modal">
                                        모달 열기 버튼    
                        </button>
					
				</div>
				
					<!-- <div id="container-mix"  class="row _post-container_">
						<div class="category-1 mix custom-column-5"></div>
						<div class="category-2 mix custom-column-5"></div>
						<div class="category-3 mix custom-column-5"></div>
					</div> -->
				</div>

			</div>
		</div>
	
	<!-- THE FOOTER -->
	<%@ include file="/WEB-INF/views/includes/footer.jsp"%>


	<div class="be-fixed-filter"></div>
	
	<%--탈퇴 모달 --%>
	<%@ include file="/WEB-INF/views/main/resign-Modal.jsp"%>
	
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
	            <div class="entry color1 m-color active" data-colour="/salmon/resources/template/style/stylesheet.css"></div>   
	            <div class="entry color3 m-color"  data-colour="/salmon/resources/template/style/style-green.css"></div>
	            <div class="entry color6 m-color"  data-colour="/salmon/resources/template/style/style-orange.css"></div>
	            <div class="entry color8 m-color"  data-colour="/salmon/resources/template/style/style-red.css"></div>  
	            <div class="title">Second Color:</div>  
	            <div class="entry s-color  active color10"  data-colour="/salmon/resources/template/style/stylesheet.css"></div>
	            <div class="entry s-color color11"  data-colour="/salmon/resources/template/style/style-oranges.css"></div> 
	            <div class="entry s-color color12"  data-colour="/salmon/resources/template/style/style-greens.css"></div>
	            <div class="entry s-color color13"  data-colour="/salmon/resources/template/style/style-reds.css"></div>
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
	<script src="/salmon/resources/template/script/global.js"></script>
	
	<!-- 주현 스크립트 추가  -->
    <script type="text/javascript" src="/salmon/resources/sjh/js/mypage.js"></script>
	
	
		
	</body>
</html>