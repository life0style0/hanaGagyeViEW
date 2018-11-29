<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
   <title>Home</title>
</head>
<body>

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
      <input type="button" id="registSubmitBtn" value="가입하기">
   </div>
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>

   <script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
 <!-- 송주현 스크립트 추가 -->
    <script type="text/javascript" src="/salmon/resources/sjh/js/regist.js"></script>
    
</body>
</html>