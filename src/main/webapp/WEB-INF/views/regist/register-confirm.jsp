<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

<h1> 회원 가입 결과 </h1>

<h2><c:out value="${registRes}"/></h2> <br>
<h2>아이디 <c:out value="${user_id}"/></h2> <br>

<a href="/salmon/login"> 로그인 하기 </a>
</body>
</html>
