<%@ page language="java" contentType="text/html; charset=utf-8" %>
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

	<!-- 카테고리 선택 css (ul li) 송주현 -->
	<link href="/salmon/resources/sjh/css/ul-list.css" rel="stylesheet" media="all">

	<!--  div용  -->
	<link href="/salmon/resources/sjh/css/card-sjh.css" rel="stylesheet" media="all">

	<link href="/salmon/resources/sjh/css/uploadImg-sjh.css" rel="stylesheet" media="all">
	<link rel="stylesheet" href="/salmon/resources/sjh/css/main-sjh.css">

	<link rel="stylesheet" href="/salmon/resources/jjw/css/croppie.css">

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
	</div>
	<div class="container-fluid cd-main-content custom-container">
		<div class="row">
			<div class="col-md-2 left-feild"></div>
			<div class="col-md-10 ">
				<div class="for-be-dropdowns"></div>
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
							<a id="viewInfo-m" class="filter">조회 </a>
							<a id="editProfile-m" class="filter">프로필 수정 </a>
							<a id="editInfo-m" class="filter">개인정보 수정 </a>
							<a id="editCats-m" class="filter">관심카테고리 수정 </a>
							<a id="resign-m" class="filter">탈퇴 </a>
						</div>
					</div>
				</div>
				
			</div>

			<div class="col-md-10">

				<div id="viewInfo">
					<h2> 내 정보 조회 </h2>

					<div>
						<%-- <p>user : <sec:authentication property="principal.user"/></p> --%>
						<div class="col-md-12">
						<div class="col-md-3 padding-1-sjh text-right "><strong>프로필사진</strong></div>
						<div class="col-md-9 padding-1-sjh">
							<input type="hidden" id="profilePath" value="/salmon/image?fileName=${user.user_image}">
							<img class="img-responsive img-thumbnail" id="profileImage" alt="">
						</div>
						</div>
						<div class="col-md-3 padding-1-sjh text-right "><strong>닉네임</strong></div>
						<div class="col-md-9 padding-1-sjh">
							<c:out value="${user.user_nickname}" />
						</div>
						<div class="col-md-3 padding-1-sjh text-right "><strong>아이디</strong></div>
						<div class="col-md-9 padding-1-sjh">
							<sec:authentication property="principal.username" />
						</div>
						<div class="col-md-3 padding-1-sjh text-right "><strong>이메일</strong></div>
						<div class="col-md-9 padding-1-sjh">
							<c:out value="${user.user_email}" />
						</div>
						<div class="col-md-3 padding-1-sjh text-right "><strong>성별 </strong></div>
						<div class="col-md-9 padding-1-sjh">
							<c:out value="${user.user_gender}" />
						</div>
						<div class="col-md-3 padding-1-sjh text-right "><strong>생일 </strong></div>
						<div class="col-md-9 padding-1-sjh">
							<c:out value="${user.user_birthday}" />
						</div>
						<div class="col-md-3 padding-1-sjh text-right "><strong>가입일</strong></div>
						<div class="col-md-9 padding-1-sjh">
							<sec:authentication property="principal.user.user_regdate" />
						</div>

						<%-- <div> 권한 목록 : <sec:authentication property="principal.user.authList"/> </div> --%>

						<div class="col-md-3 padding-1-sjh text-right"><strong>지역</strong></div>
						<div class="col-md-9 padding-1-sjh">
							<c:out value="${userPsnsInfo.locationname}" />
						</div>

						<div class="col-md-3 padding-1-sjh text-right"><strong>관심 카테고리</strong></div>
						<c:choose>
							<c:when test="${not empty userPsnsInfo.ctgryNames}">
								<c:forEach var="ctgryName" items="${userPsnsInfo.ctgryNames}" varStatus="status">
									<div class="padding-1-sjh ctgry-badge">
										<c:out value="${ctgryName}" />
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</div>
				</div> <!-- viewInfo -->


				<div id="editProfile">
					<div class="col-md-12">
						<h2> 프로필 수정 </h2>
					</div>

					<form role="form" id="editNicknameForm" method="post" class="col-md-8" action="/salmon/main/mypage/editprofile">
						<div class="col-md-12" style="margin-bottom:20px;">닉네임, 프로필 사진 수정
						<input type="button" id="editNicknameSubmitBtn"
							 class="btn btn-info ggv-btn" value="수정하기">
						</div>
						<div>현재 닉네임 :
							<c:out value="${user.user_nickname}" />
						</div>
						<div class="form-group">
							<label for="user_nickname">수정할 닉네임 </label>
							<input id="user_nickname" name="user_nickname" required="required" type="text" class="form-control" placeholder="닉네임">
						</div>
						<div id="valid_user_nickname">닉넴 체크</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
					
					<form role="form" id="editPhotoForm" method="post" class="col-md-8" action="/salmon/main/mypage/editprofile">
						<input type="button" id="editPhotoSubmitBtn"
							 class="btn btn-info ggv-btn" value="수정하기">
						<div class="form-group">
							<label for="user_image"> 프로필사진 </label>
							<div id="filesUpload" class="dropzone" style="height: 200px;line-height: 200px;font-size: 30px;"><a href="javascript:inputFileEvent()"><ins>Drag
										& Drop Files Here</ins></a></button></div>
							<input type="file" name="inputF" id="inputFile" multiple style="display:none;">
							<div class="modal fade user-image" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-body image-body">
											<div class="modal-image"></div>
										</div>
										<div class="modal-footer">
											<button type="button" id="uploadImage" class="btn btn-danger ggv-btn">업로드</button>
											<button type="button" class="btn btn-warning ggv-btn" data-dismiss="modal" value="close">취소</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>
					<form id="imageUploadForm" class="hidden"></form>
				</div>


				<div id="editInfo">
					<div class="col-md-12">
						<h2> 내 정보 수정 </h2>
					</div>
					<div class="col-md-12">비밀번호, 이메일, 생일, 지역 수정 </div>

					<form role="form" id="editInfoForm" method="post" class="col-md-8" action="/salmon/main/mypage/editmyinfo">
						<input type="hidden" name="user_id" id="user_id" value='<sec:authentication property="principal.username"/>'>

						<!-- 비밀번호 입력 -->
						<div class="form-group">
							<input class="form-control" type="password" placeholder="비밀번호" id="user_passwd" name="user_passwd">
							<div id="valid_user_passwd">비밀번호 체크</div>
						</div>


						<!-- 비밀번호 입력 확인 -->
						<div class="form-group">
							<input class="form-control" type="password" placeholder="비밀번호 확인" id="same_user_passwd" name="same_passwd">
							<div id="same_valid_user_passwd">비밀번호 체크</div>
						</div>


						<!-- 생년월일 -->
						<div class="form-group">
							<input class="form-control" type="text" placeholder="생년월일" id="user_birthday" name="user_birthday" required="required"
							 value='<c:out value=" ${user.user_birthday}" />'>
							<div id="valid_user_birthday">생년월일 체크</div>
						</div>

						<div class="form-group">
							<select id="genders" name="gender" class="form-control" required="required">
								<c:choose>
									<c:when test="${user.user_gender eq 'F'}">
										<option disabled="disabled">성별</option>
										<option id="user_gender_M" value="M">Male</option>
										<option id="user_gender_F" value="F" selected="selected">Female</option>
									</c:when>
									<c:when test="${user.user_gender eq 'M' }">
										<option disabled="disabled">성별</option>
										<option id="user_gender_M" value="M" selected="selected">Male</option>
										<option id="user_gender_F" value="F">Female</option>
									</c:when>
									<c:otherwise>
										<option disabled="disabled" selected="selected">성별</option>
										<option id="user_gender_M" value="M">Male</option>
										<option id="user_gender_F" value="F">Female</option>
									</c:otherwise>
								</c:choose>
							</select> <input type="hidden" id="user_gender" name="user_gender">
						</div>

						<!-- 이메일 입력 -->
						<div class="form-group">
							<input class="form-control" id="user_email" name="user_email" type="text" placeholder="이메일  ex) hyerim123@gmail.com"
							 value="<c:out value=" ${user.user_email}" />">
							<div id="valid_user_email">이메일 체크</div>
						</div>


						<div class="form-group">
							<select id="locations" class="form-control" required="required">
								<option disabled="disabled" selected="selected">지역</option>
								<c:choose>
									<c:when test="${not empty locations}">
										<c:forEach var="location" items="${locations}" varStatus="status">
											<option value="${location.location_id}">
												<c:out value="${location.location_name}" />
											</option>
										</c:forEach>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>
							</select> <input type="hidden" id="location_id" name="location_id">
						</div>

						<input type="button" id="editInfoSubmitBtn" class="btn btn-info ggv-btn" value="수정하기"> <input type="hidden" name="${_csrf.parameterName}"
						 value="${_csrf.token}">
					</form>
				</div>



				<div id="editCats">
					<form role="form" id="editCategoriesForm" method="post" action="/salmon/main/mypage/editCategories">
						<h2 style="margin-bottom:20px;">관심카테고리 수정<input type="button" id="editCategoriesSubmitBtn" class="btn btn-info ggv-btn"
							 value="수정하기"></h2>
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
							<input type="hidden" id="CTGRY_1" name="ctgry_1">
							<input type="hidden" id="CTGRY_2" name="ctgry_2">
							<input type="hidden" id="CTGRY_3" name="ctgry_3">
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					</form>

				</div><!-- 카테고리 수정 창 -->



				<div id="resign">
					<h2> 탈퇴 </h2>

					<!-- 탈퇴를 원하시면 비밀번호를 한번 더 입력해주세요
					<input type="password" name="resign-user_password" id="resign-user_password"> -->
					<button type="button" class="btn btn-danger ggv-btn" name="resignOpenBtn" data-toggle="modal" data-target="#resign-Modal">
						탈퇴하기
					</button>

				</div>
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

	  <!--  로그아웃 팝업 -->
  <%@ include file="/WEB-INF/views/includes/logout.jsp"%>
  <!--  로그아웃 팝업 끝-->

	<div class="theme-config">
		<div class="main-color">
			<div class="title">Main Color:</div>
			<div class="colours-wrapper">
				<div class="entry color1 m-color active" data-colour="/salmon/resources/template/style/stylesheet.css"></div>
				<div class="entry color3 m-color" data-colour="/salmon/resources/template/style/style-green.css"></div>
				<div class="entry color6 m-color" data-colour="/salmon/resources/template/style/style-orange.css"></div>
				<div class="entry color8 m-color" data-colour="/salmon/resources/template/style/style-red.css"></div>
				<div class="title">Second Color:</div>
				<div class="entry s-color  active color10" data-colour="/salmon/resources/template/style/stylesheet.css"></div>
				<div class="entry s-color color11" data-colour="/salmon/resources/template/style/style-oranges.css"></div>
				<div class="entry s-color color12" data-colour="/salmon/resources/template/style/style-greens.css"></div>
				<div class="entry s-color color13" data-colour="/salmon/resources/template/style/style-reds.css"></div>
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
	<script type="text/javascript" src="/salmon/resources/sjh/js/uploadImg.js"></script>
	<script type="text/javascript" src="/salmon/resources/jjw/js/croppie.min.js"></script>
	<script type="text/javascript" src="/salmon/resources/sjh/js/image.js"></script>


</body>

</html>