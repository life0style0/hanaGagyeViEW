<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<title>LogIn</title>
<!-- meta_tags-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="connective login form a Flat Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta_tag_Keywords -->
<link href="resources/Login/css/style.css" rel="stylesheet" type="text/css" media="all"><!--style_sheet-->
<link href="resources/Login/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all"><!--font_awesome_icons-->
<!--web_fonts-->
<!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<!-- <link href="//fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900&amp;subset=latin-ext" rel="stylesheet"> -->
<!--//web_fonts-->
<style>
form {
font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>
<div class="form">
      <!-- 회원가입 폼으로 이동하기 -->
      <div class="submit-agileits">
        <a href="http://localhost:8080/salmon/regist/register"><input class="login" type="submit" value="SignUp" style="float: right; width: 120px;"></a>
      </div>
<h1>가계 ViEW</h1>
   <div class="form-content">
      <form method="post" action="/salmon/login">
         <div class="form-info">
            <h2>Login</h2>
        <span style="color: white;"><c:out value="${error}"/></span>
         </div>
            <!-- 로그인 상황 알람 
            <div class="right">
             <label><c:out value="${error}"/></label>
            </div> -->
            
            <!-- 아이디 -->
         <div class="email-w3l">
            <span class="i1"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
            <input class="email" type="text" name="username" placeholder="아이디" >
         </div>
            <!-- 비밀번호 -->
         <div class="pass-w3l">
         <span class="i2"><i class="fa fa-unlock" aria-hidden="true"></i></span>
            <input class="pass"  type="password" name="password" placeholder="비밀번호" >
         </div>
            <!-- 자동로그인-->
         <div class="form-check">
            <div class="left">
               <input type="checkbox" name="remember-me">자동 로그인
            </div>
                <!-- 비밀번호 까먹은사람! -->
            <div class="right">
               <a href="#">비밀번호 찾기</a>
            </div>
            <div class="clear"></div>
         </div>
            <!-- 로그인 폼 -->
         <div class="submit-agileits">
            <input class="login" type="submit" value="login">
        
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
         </div>
      
      </form>
    
   <!-- 에러 유효성 검사 기능 수정 필요 -->
     <%--  <h3> error :  <c:out value="${error}"></c:out> </h3>
      <h3> logout : <c:out value="${logout}"></c:out> </h3> --%>

   </div>
</div>

</body>
</html>