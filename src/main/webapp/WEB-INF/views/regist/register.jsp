<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

<h1> 회원 가입 </h1>

<form role="form" method="post" action="/salmon/regist/register">
	<div>
	아이디
		<input type="text" name="user_id" required="required" >
	</div>
	<div>
	비밀번호
		<input type="password" name="user_passwd" required="required" >
	</div>
	<div>
	닉네임
		<input type="text" name="user_nickname" required="required" >
	</div>
	<div>
	이메일
		<input type="email" name="user_email" required="required" >
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
		<input type="text" name="user_birthday" required="required" >
	</div>
	<div>
	프로필사진
		<input type="file" name="user_image" required="required" >
	</div>
	
	<div>
		<input type="submit" value="가입하기">
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>

</body>
</html>
