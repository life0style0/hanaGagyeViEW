<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
   <title>Home</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">


<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../resources/LoginTemplate/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../resources/LoginTemplate/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../resources/LoginTemplate/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../resources/LoginTemplate/vendor/animate/animate.css">
<!--===============================================================================================-->  
  <link rel="stylesheet" type="text/css" href="../resources/LoginTemplate/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../resources/LoginTemplate/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../resources/LoginTemplate/vendor/select2/select2.min.css">
<!--===============================================================================================-->  
  <link rel="stylesheet" type="text/css" href="../resources/LoginTemplate/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
  <link rel="stylesheet" type="text/css" href="../resources/LoginTemplate/css/util.css">
  <link rel="stylesheet" type="text/css" href="../resources/LoginTemplate/css/main.css">
<!--===============================================================================================-->
  
  
</head>
<body style="background-color: #666666;">

  <div class="limiter">
    <div class="container-login100">
      <div class="wrap-login100">
        <form class="login100-form validate-form" method="post" action="/salmon/login">
     

          <span class="login100-form-title p-b-43">
            Login
          </span>
          
          <!-- 아이디 -->
          <div class="wrap-input100 validate-input" data-validate = "Valid email is required">
            <input type="text" name="username" value="admin" class="input100" type="text" name="email">
            <span class="focus-input100"></span>
            <span class="label-input100">User name</span>
          </div>
          
          <!-- 비밀번호 -->
          <div class="wrap-input100 validate-input" data-validate="Password is required">
            <input type="password" name="password" value="admin" class="input100" type="password" name="pass">
            <span class="focus-input100"></span>
            <span class="label-input100">Password</span>
          </div>
          
          <!-- 로그인 기억하기 -->
          <div class="flex-sb-m w-full p-t-3 p-b-32">
            <div class="contact100-form-checkbox">
              <input type="checkbox" class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
              <label class="label-checkbox100" for="ckb1">
                자동로그인 </label>
            </div>
            <!-- 비밀번호 찾기 -->
            <div>
              <a href="#" class="txt1"> Forgot Password?</a>
            </div>
          
          </div>
      
        <!-- 로그인 상황 알람 -->
            
            <div>
             <label>   <c:out value="${error}"/> </label>
            </div>
      
         <!-- 로그인 버튼  -->
          <div class="container-login100-form-btn">
            <input type="submit" class="login100-form-btn" value="Login">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
          </div>
          
          <div class="text-center p-t-46 p-b-20">
            <span class="txt2"><a> or sign up using</a></span>
          </div>

          <div class="login100-form-social flex-c-m">
            <a href="#" class="login100-form-social-item flex-c-m bg1 m-r-5">
              <i class="fa fa-facebook-f" aria-hidden="true"></i>
            </a>

            <a href="#" class="login100-form-social-item flex-c-m bg2 m-r-5">
              <i class="fa fa-twitter" aria-hidden="true"></i>
            </a>
          </div>
          <!-- 에러 유효성 검사 기능 수정 필요 -->
     <%--  <h3> error :  <c:out value="${error}"></c:out> </h3>
      <h3> logout : <c:out value="${logout}"></c:out> </h3> --%>
          
        </form><!-- 폼 끝 -->

        <div class="login100-more" style="background-image: url('../resources/LoginTemplate/images/2.jpg');">
        </div>
      </div>
    </div>
  </div>



<!--===============================================================================================-->
  <script src="../resources/LoginTemplate/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
  <script src="../resources/LoginTemplate/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
  <script src="../resources/LoginTemplate/vendor/bootstrap/js/popper.js"></script>
  <script src="../resources/LoginTemplate/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
  <script src="../resources/LoginTemplate/endor/select2/select2.min.js"></script>
<!--===============================================================================================-->
  <script src="../resources/LoginTemplate/vendor/daterangepicker/moment.min.js"></script>
  <script src="../resources/LoginTemplate/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
  <script src="../resources/LoginTemplate/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
  <script src="../resources/LoginTemplate/js/main.js"></script>

</body>
</html>