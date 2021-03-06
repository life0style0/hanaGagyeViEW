<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
   <title>Home</title>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Au Register Forms by Colorlib</title>

    <!-- Icons font CSS-->
    <link href="../resources/SignUp/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="../resources/SignUp/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <!-- <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet"> -->

    <!-- Vendor CSS-->
    <link href="../resources/SignUp/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="../resources/SignUp/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="../resources/SignUp/css/main.css" rel="stylesheet" media="all">
    
    <!-- 카테고리 선택 css (ul li) 송주현 -->
    <link href="/salmon/resources/sjh/css/ul-list.css" rel="stylesheet" media="all">
    <!-- 이미지 -->
   <!--  <link href="/salmon/resources/sjh/css/uploadImg-sjh.css" rel="stylesheet" media="all"> -->
<style>
.card-1 .card-body {
font-family: 'Noto Sans KR', sans-serif;

}
</style>
</head>
<body style="background-image: url('../resources/Login/images/123.jpg');">

   
  <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">회원가입</h2>
                    <form role="form" id="registForm" method="post" action="/salmon/regist/register">
                        <!-- 아이디 -->
                        <div class="input-group">
                            <input class="input--style-1"  id="user_id" name="user_id" required="required"  type="text" placeholder="아이디">
                        </div>
                         <div id="valid_user_id">아이디 확인결과</div>       
                        
                        <!-- 닉네임 -->
                        <div class="input-group">
                            <input class="input--style-1"   id="user_nickname" name="user_nickname"  required="required"  type="text" placeholder="닉네임">
                        </div>
                         <div id="valid_user_nickname">닉넴 체크</div>
                        
                        <!-- 비밀번호 -->
                        <div class="row row-space">
                            <!-- 비밀번호 입력 -->
                            <div class="col-2">
                                <div class="input-group">
                                    <input class="input--style-1" type="password" placeholder="비밀번호" id="user_passwd" name="user_passwd" >
                                </div>
                                <div id="valid_user_passwd">비밀번호 체크</div>
                            </div>
                            <!-- 비밀번호 입력 확인 -->
                            <div class="col-2">
                                <div class="input-group">
                                    <input class="input--style-1" type="password" placeholder="비밀번호 확인" id="same_user_passwd" name="same_passwd" >
                                </div>
                                 <div id="same_valid_user_passwd">비밀번호 체크</div>
                                
                            </div>
                        </div>
                            
                         
                        <div class="row row-space">
                            <!-- 생년월일 -->
                            <div class="col-2">
                                <div class="input-group">
                                    <input class="input--style-1 js-datepicker" type="text" placeholder="생년월일" id="user_input-birthday" name="user_input-birthday">
                                    <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                	<input type="hidden" name="user_birthday" id="user_birthday">
                                </div>
                                 <div id="valid_user_birthday">생년월일 체크</div>
                            </div>

                  
                            <!-- 성별 남/여 -->
                            <div class="col-2">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                 
                                        <select id="genders" name="gender">
                                            <option disabled="disabled" selected="selected">성별</option>
                                            <option id="user_gender_M" value="M" >Male</option>
                                            <option id="user_gender_F" value="F" >Female</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    	<input type="hidden" id="user_gender" name="user_gender">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 이메일 입력 -->
                        <div class="input-group">
                          <input class="input--style-1"  id="user_email" name="user_email" required="required"  type="text" placeholder="이메일  ex) hyerim123@gmail.com">
                        </div>
                          <div id="valid_user_email">이메일 체크</div>


						<!-- 파일 업로드 -->
						<!-- 
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<input class="input--style-1"
										class="btn btn--radius btn--green" type="file" id="user_image"
										name="user_image">
								</div>
							</div>
						</div>
						 -->
						<div class="col-2">
							<div class="input-group">
								<div class="rs-select2 js-select-simple select--no-search">
									<select id="locations" required="required">
										<option disabled="disabled" selected="selected">지역</option>
										<c:choose>
									     	<c:when test="${not empty locations}">
									     	<c:forEach var="location" items="${locations}" varStatus="status">
										     	<option value="${location.location_id}">
										     		<c:out value="${location.location_name}"/>
										     	</option>
									     	</c:forEach>
									     	</c:when>
									     	<c:otherwise></c:otherwise>
									     </c:choose>
									</select> 
									<input type="hidden" id="location_id" name="location_id">
									<div class="select-dropdown"></div>
								</div>
							</div>
						</div>

						<div class="input-group">
                        <div>관심 카테고리 설정 (최대 3개)</div>
	                        <ul id="categories" class="categories">
                                <c:choose>
                                    <c:when test="${not empty categories}">
                                        <c:forEach var="category" items="${categories}" varStatus="status">
                                            <c:choose>
                                                <c:when test="${category.ctgry_id < 0 }">
                                                </c:when>
                                                <c:otherwise>
                                                    <li name="category" style="width:140px; height: 100px; line-height: 100px;" 
                                                    class="unselected square" id='category-li-<c:out value="${category.ctgry_id}" />'>
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
                        
                        
                  
                        <div class="p-t-20">
                            <button type="button" class="btn btn--radius btn--green"  id="registSubmitBtn" >가입하기</button>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    </form>
                </div>
            </div>
        </div>
    </div>





    <!-- Jquery JS-->
    <script src="../resources/SignUp/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="../resources/SignUp/vendor/select2/select2.min.js"></script>
    <script src="../resources/SignUp/vendor/datepicker/moment.min.js"></script>
    <script src="../resources/SignUp/vendor/datepicker/daterangepicker.js"></script>
    <!-- Main JS-->
    <script src="../resources/SignUp/js/global.js"></script>



 <!-- 송주현 스크립트 추가 -->
    <script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="/salmon/resources/sjh/js/regist.js"></script>
   <!--  <script type="text/javascript" src="/salmon/resources/sjh/js/uploadImg.js"></script> -->
   
   
 <!--  혜림 스크립트 만지는 중  -->  
   

<!--===============================================================================================-->
   <script src="../resources/RegisterTemplate/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
   <script src="../resources/RegisterTemplate/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
   <script src="../resources/RegisterTemplate/vendor/bootstrap/js/popper.js"></script>
   <script src="../resources/RegisterTemplate/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
   <script src="../resources/RegisterTemplate/vendor/select2/select2.min.js"></script>
   <script>
      $(".js-select2").each(function(){
         $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
         });
      })
      $(".js-select2").each(function(){
         $(this).on('select2:open', function (e){
            $(this).parent().next().addClass('eff-focus-selection');
         });
      });
      $(".js-select2").each(function(){
         $(this).on('select2:close', function (e){
            $(this).parent().next().removeClass('eff-focus-selection');
         });
      });

   </script>
<!--===============================================================================================-->
   <script src="../resources/RegisterTemplate/vendor/daterangepicker/moment.min.js"></script>
   <script src="../resources/RegisterTemplate/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
   <script src="../resources/RegisterTemplate/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
   <script src="../resources/RegisterTemplate/js/main.js"></script>
   <!-- Global site tag (gtag.js) - Google Analytics -->
   <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
   <script>
     window.dataLayer = window.dataLayer || [];
     function gtag(){dataLayer.push(arguments);}
     gtag('js', new Date());

     gtag('config', 'UA-23581568-13');
   </script>
   
   
</body>
</html>
