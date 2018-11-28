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

<h2> all page </h2>

<sec:authorize access="isAnonymous()">
<h2> 로그인 </h2>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
<h2> 로그아웃 </h2>
</sec:authorize>

</body>
</html>
