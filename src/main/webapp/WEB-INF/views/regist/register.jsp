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
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="../resources/SignUp/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="../resources/SignUp/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="../resources/SignUp/css/main.css" rel="stylesheet" media="all">

</head>
<body style="background-image: url('../resources/Login/images/123.jpg');">

   
  <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">회원가입</h2>
                    <form method="POST">
                        <div class="input-group">
                            <input class="input--style-1" type="text" placeholder="NAME" name="name">
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <input class="input--style-1 js-datepicker" type="text" placeholder="BIRTHDATE" name="birthday">
                                    <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="gender">
                                            <option disabled="disabled" selected="selected">GENDER</option>
                                            <option>Male</option>
                                            <option>Female</option>
                                            <option>Other</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="input-group">
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="class">
                                    <option disabled="disabled" selected="selected">CLASS</option>
                                    <option>Class 1</option>
                                    <option>Class 2</option>
                                    <option>Class 3</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <input class="input--style-1" type="text" placeholder="REGISTRATION CODE" name="res_code">
                                </div>
                            </div>
                        </div>
                        <div class="p-t-20">
                            <button class="btn btn--radius btn--green" type="submit">Submit</button>
                        </div>
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



<!-- 혜림 수정중  -->
<h1>혜림 ing </h1>
	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form">
				<span class="contact100-form-title">
				 <img alt="" src="../resources/LoginTemplate/images/icons/shop1.png">	Sign Up 회원가입
				</span>

                <!-- 아이디  -->
				<div class="wrap-input100 validate-input" data-validate="Name is required">
					<label class="label-input100" for="name">User Name</label>
					<input id="name" class="input100" type="text" name="name" placeholder="Enter your name...">
					<span class="focus-input100"></span>
				</div>
            
                <!-- 비밀번호 -->
                <div class="wrap-input100 validate-input" data-validate="Name is required">
                  <label class="label-input100" for="name">User Name</label>
                  <input id="name" class="input100" type="text" name="name" placeholder="Enter your name...">
                  <span class="focus-input100"></span>
                </div>
                
                <!-- 비밀번호 확인-->
                <div class="wrap-input100 validate-input" data-validate="Name is required">
                  <label class="label-input100" for="name">User Name</label>
                  <input id="name" class="input100" type="text" name="name" placeholder="Enter your name...">
                  <span class="focus-input100"></span>
                </div>

                
                <!-- 닉네임 확인-->
                <div class="wrap-input100 validate-input" data-validate="Name is required">
                  <label class="label-input100" for="name">User Name</label>
                  <input id="name" class="input100" type="text" name="name" placeholder="Enter your name...">
                  <span class="focus-input100"></span>
                </div>
  
                <!-- 이메일 -->
				<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
					<label class="label-input100" for="email">Email Address</label>
					<input id="email" class="input100" type="text" name="email" placeholder="Enter your email...">
					<span class="focus-input100"></span>
				</div>
                
                <!-- 성별  -->
				<div class="wrap-input100">
					<div class="label-input100">What do you need?</div>
					<div>
						<select class="js-select2" name="service">
							<option>Male</option>
							<option>Female</option>
						</select>
						<div class="dropDownSelect2"></div>
					</div>
					<span class="focus-input100"></span>
				</div>

                <!-- 생년월일 -->
                <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                  <label class="label-input100" for="email">Email Address</label>
                  <input id="email" class="input100" type="text" name="email" placeholder="Enter your email...">
                  <span class="focus-input100"></span>
                </div>
                
                <!-- 생년월일 -->
                <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                  <label class="label-input100" for="email">Email Address</label>
                  <input id="email" class="input100" type="text" name="email" placeholder="Enter your email...">
                  <span class="focus-input100"></span>
                </div>
                
                     
				<div class="wrap-input100 validate-input" data-validate = "Message is required">
					<label class="label-input100" for="message">Message</label>
					<textarea id="message" class="input100" name="message" placeholder="Type your message here..."></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						Send
					</button>
				</div>

				<div class="contact100-form-social flex-c-m">
					<a href="#" class="contact100-form-social-item flex-c-m bg1 m-r-5">
						<i class="fa fa-facebook-f" aria-hidden="true"></i>
					</a>

					<a href="#" class="contact100-form-social-item flex-c-m bg2 m-r-5">
						<i class="fa fa-twitter" aria-hidden="true"></i>
					</a>

					<a href="#" class="contact100-form-social-item flex-c-m bg3">
						<i class="fa fa-youtube-play" aria-hidden="true"></i>
					</a>
				</div>
			</form>

			<div class="contact100-more flex-col-c-m" style="background-image: url('../resources/LoginTemplate/images/1.jpg');">
			</div>
		</div>
	</div>
















<!-- 주현 내용 스타트  -->
<h1> 회원 가입 </h1>

<form role="form" id="registForm" method="post" action="/salmon/regist/register">
   <div>
   아이디
      <input type="text" id="user_id" name="user_id" required="required" >
        <div id="valid_user_id">아이디 확인결과</div>
   </div>
   <div>
   비밀번호
      <input type="password" id="user_passwd" name="user_passwd" required="required" >
        <div id="valid_user_passwd">비밀번호 체크</div>
   </div>
    <div>
    비밀번호 확인
      <input type="password" id="same_user_passwd" name="same_passwd" required="required" >
      <div id="same_valid_user_passwd">비밀번호 체크</div>
    </div>
     <div>
   닉네임
      <input type="text" id="user_nickname" name="user_nickname" required="required" >
        <div id="valid_user_nickname">닉넴 체크</div>
   </div>
   <div>
   이메일
      <input type="email" id="user_email" name="user_email" required="required" >
        <div id="valid_user_email">이메일 체크</div>
   </div>
   <div>
   성별
      <input type="radio" name="user_gender" id="user_gender_M" value="M">
      <label for="user_gender_M">Male</label>
      <input type="radio" name="user_gender" id="user_gender_F" value="F">
      <label for="user_gender_F">Female</label>
      <!-- <input type="text" name="user_gender" > -->
   </div>
   <div>
   생년월일
      <input type="text" id="user_birthday" name="user_birthday" required="required" >
        <div id="valid_user_birthday">생년월일 체크</div>
   </div>
   <div>
   프로필사진
      <input type="file" id="user_image" name="user_image" >
   </div>
   
   <div>
      <input type="submit" id="registSubmitBtn" value="가입하기">
   </div>
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
<!-- 주현 폼 finished!  -->

 <!-- 송주현 스크립트 추가 -->
    <script type="text/javascript" src="/salmon/resources/js/sjh/regist.js"></script>
   
   
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