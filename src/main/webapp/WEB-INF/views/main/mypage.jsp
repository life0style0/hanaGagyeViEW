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
		
    
     <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    
	</head>
	<body style="font-family: 'Noto Sans KR', sans-serif;">

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
				<!--  내 정보 조회 부분 CSS 입히는 중  -->
        <div class="col-xs-12 col-md-9 _editor-content_">
        <div class="sec" data-sec="">
				<div id="viewInfo"> <!-- 혜림수정부분 -->
        <style>
        .card-heading{
            background: url(../resources/SignUp/images/bg-head-02.jpg) center center/cover no-repeat;
    padding-top: 210px;
}
        </style>
        
        
        <div class="card-heading"></div>
        
              <div class="info-block style-2">
                <div class="be-large-post-align">
                  <h2 class="info-block-label" style="font-size: 18pt; font-family: 'Noto Sans KR', sans-serif;">나의 정보 조회</h2>
                </div>
              </div>


              <div> 
					<%-- <p>user : <sec:authentication property="principal.user"/></p> --%>
          <!-- 프로필 사진 보여주기 -->
          
                  <div class="be-large-post-align" style="margin: auto; padding-bottom: 10px;">
                    <div class="be-change-ava" style="margin: auto;>
                <!-- <a class="be-ava-user style-2" " "> -->
                        <p style="text-align: center;">  프로필사진 : <sec:authentication  property="principal.user.user_image" />   </p>
                        
                        
                          <p style="text-align: center;">
                          <a class="be-ava-user style-2">
 <img src="https://media.glamour.com/photos/576aaba37f743c3e35b97512/master/pass/0816-GL-OBSE03-01.jpg"  class="img-circle" alt="Cinque Terre" width="250" height="250" style="float: center;">
                    </a>
                      </p>
                   <!--    </a> --> 
                    </div>
                  </div>
                <style>
.effect-2{ border: 0; padding: 7px 0; border-bottom: 1px solid #ccc;}
.effect-2 ~ .focus-border {position: absolute; bottom: 0; left: 50%; width: 0; height: 2px; background-color: #0d58c8; transition: 0.4s;}
.effect-2:focus ~ .focus-border{width: 100%; transition: 0.4s; left: 0;}           
                </style>
                <!-- 아이디 보여주기  -->
                  <div class="be-large-post-align">
                    <div class="row">
                      <div class="input-col col-xs-12 col-sm-6">
                        <div class="form-group fg_icon focus-2">
                          <div class="form-label">아이디</div>
                          <%--         <p> 아이디 : <sec:authentication property="principal.username"/></p> --%>
                          <input class="effect-2" type="text" value="<sec:authentication property="principal.username"/>" style="color: black" readonly="readonly">
                           <span class="focus-border"></span>
                        </div>
                      </div>

                      <!-- 닉네임 보여주기 -->
                      <div class="input-col col-xs-12 col-sm-6">
                        <div class="form-group focus-2">
                          <div class="form-label">닉네임</div>
                          <%--      <p> 닉네임 : <c:out value="${user.user_nickname}"/> </p>         --%>
                          <input class="effect-2" type="text" value="<c:out value="${user.user_nickname}"/>" style="color: black" readonly="readonly">
                         <span class="focus-border"></span>
                        </div>
                      </div>

                      <!-- 이메일 보여주기 -->
                      <div class="input-col col-xs-12 col-sm-4">
                        <div class="form-group focus-2">
                          <div class="form-label">이메일</div>
                          <%--     <p> 이메일 : <c:out value="${user.user_email}"/> </p>    --%>
                          <input class="effect-2" type="text" value="<c:out value="${user.user_email}"/>" style="color:black" readonly="readonly">
                        
                        </div>
                      </div>

                     <!-- 성별 보여주기 -->
                      <div class="input-col col-xs-12 col-sm-4">
                        <div class="form-group focus-2">
                          <div class="form-label">성별</div>
                          <%--     <p> 성별 :  <c:out value="${user.user_gender}" />   --%>
                          <input class="effect-2" type="text" value=" <c:out value="${user.user_gender}" />" style="color:black" readonly="readonly">
                                                <span class="focus-border"></span>
                     
                        </div>
                      </div>

                     <!-- 생년월일 보여주기 -->
                      <div class="input-col col-xs-12 col-sm-4">
                        <div class="form-group focus-2">
                          <div class="form-label">생년월일</div>
                          <%--       <p>생일 : <c:out value="${user.user_birthday}" /> </p>  --%>
                          <input class="effect-2" type="text" value="<c:out value="${user.user_birthday}" />" style="color:black" readonly="readonly">
                         <span class="focus-border"></span>
                      
                        </div>
                      </div>

                     <!-- 가입일 보여주기 -->
                      <div class="input-col col-xs-12 col-sm-4">
                        <div class="form-group focus-2">
                          <div class="form-label">가입일</div>
                          <%-- <p> 가입일 : <sec:authentication property="principal.user.user_regdate" /> </p>  --%>
                          <input class="effect-2" type="text" value="<sec:authentication property="principal.user.user_regdate" />" style="color:black" readonly="readonly">
                          <span class="focus-border"></span>
                        </div>
                      </div>
                    
                     <!-- 권한목록 보여주기 -->
                      <div class="input-col col-xs-12 col-sm-4">
                        <div class="form-group focus-2">
                          <div class="form-label">권한목록</div>
                          <%--   <p> 권한 목록 : <sec:authentication property="principal.user.authList" /> </p>  --%>
                          <input class="effect-2" type="text" value="<sec:authentication property="principal.user.authList" />" style="color:black" readonly="readonly">
                        <span class="focus-border"></span>
                        </div>
                      </div>

                     <!-- 지역 보여주기 -->
                      <div class="input-col col-xs-12 col-sm-4">
                        <div class="form-group focus-2">
                          <div class="form-label">지역</div>
                          <%-- <p> 지역 : <c:out value="${userPsnsInfo.locationname}" /> </p>  --%>
                          <input class="effect-2" type="text" value="<c:out value="${userPsnsInfo.locationname}" />" style="color:black" readonly="readonly">
                          <span class="focus-border"></span>
                   
                        </div>
                      </div>

                      <!-- 관심 카테고리1  보여주기 -->
                      <div class="input-col col-xs-12 col-sm-4">
                        <div class="form-group focus-2">
                          <div class="form-label">관심 카테고리1</div>
                          <%-- <p> 관심 카테고리1 : <c:out value="${userPsnsInfo.ctgry1Name}" /> </p> --%>
                          <input class="effect-2" type="text" value="<c:out value="${userPsnsInfo.ctgry1Name}" />" style="color:black" readonly="readonly">
                          <span class="focus-border"></span>
        
                        </div>
                      </div>
                      
                      <!-- 관심 카테고리2  보여주기 -->
                      <div class="input-col col-xs-12 col-sm-4">
                        <div class="form-group focus-2">
                          <div class="form-label">관심 카테고리2</div>
                          <%-- <p> 관심 카테고리2 : <c:out value="${userPsnsInfo.ctgry2Name}" /> </p> --%>
                          <input class="effect-2" type="text" value="<c:out value="${userPsnsInfo.ctgry2Name}" />" style="color:black" readonly="readonly">
                        <span class="focus-border"></span>
     
                        </div>
                      </div>
                      
                      <!-- 관심 카테고리3  보여주기 -->
                      <div class="input-col col-xs-12 col-sm-4">
                        <div class="form-group focus-2">
                          <div class="form-label">관심 카테고리3</div>
                          <%--  <p> 관심 카테고리3 : <c:out value="${userPsnsInfo.ctgry3Name}" /> </p> --%>
                          <input class="effect-2" type="text" value="<c:out value="${userPsnsInfo.ctgry3Name}" />" style="color:black" readonly="readonly">
                         <span class="focus-border"></span>
     
                        </div>
                      </div>                 

                    </div>
                  </div>
                </div>
        </div>
        
        
        <!-- 프로필 수정 css입히는 중  -->
				<div id="editProfile">
					<h2> 프로필 수정 </h2>
					닉네임, 프로필 사진 수정
					
					<form role="form" id="editProfileForm" method="post" action="/salmon/main/mypage/editprofile">
						
						<div>현재 닉네임 : <c:out value="${user.user_nickname}"/></div>
						<div>수정할 닉네임 : 
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
						<!-- 비밀번호 -->
				 <form role="form" id="editInfoForm" method="post" action="/salmon/main/mypage/editmyinfo">
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
									placeholder="생년월일" id="user_input-birthday"
									name="user_input-birthday"
									value="<c:out value="${user.user_birthday}"/> "> 
									<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
								<input type="hidden" name="user_birthday" id="user_birthday">
							</div>
							<div id="valid_user_birthday">생년월일 체크</div>
						</div>
						<div class="col-2">
							<div class="input-group">
								<div class="rs-select2 js-select-simple select--no-search">
									<select id="genders" name="gender">
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
									<div class="select-dropdown"></div>
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
								value="<c:out value="${user.user_email}"/> ">
						</div>
						<div id="valid_user_email">이메일 체크</div>
					</div>

						<div class="col-2">
							<div class="input-group">
								<div><c:out value="${userPsnsInfo.locationname}"/></div>
								<div class="rs-select2 js-select-simple select--no-search">
									<select id="locations" required="required">
										<option disabled="disabled" selected="selected">지역</option>
										<option value="1">서울</option>
										<option value="2">부산</option>
									</select> 
									<input type="hidden" id="location_id" name="location_id" 
									value="<c:out value="${userPsnsInfo.locationname}"/>">
									<div class="select-dropdown"></div>
								</div>
							</div>
						</div>

						<input type="button" id="editInfoSubmitBtn" value="수정하기">
					</form>
					</div>

				<div id="editCats">
					<h2> 관심카테고리 수정 </h2>
				</div>
				
				<div id="resign">
					<h2> 탈퇴 </h2>
					<input type="button" value="탈퇴하기">
				</div>
				
					<!-- <div id="container-mix"  class="row _post-container_">
						<div class="category-1 mix custom-column-5"></div>
						<div class="category-2 mix custom-column-5"></div>
						<div class="category-3 mix custom-column-5"></div>
					</div> -->
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