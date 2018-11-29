<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<h2> memeber page </h2>
<a href="/salmon/login/customLogout">LOGOUT</a>

<p>멤버 닉네임 : <sec:authentication property="principal.user.user_nickname"/></p>
<p>멤버 아이디 : <sec:authentication property="principal.username"/></p>
<p>멤버 권한 목록 : <sec:authentication property="principal.user.authList"/></p>  

</body>
</html>
