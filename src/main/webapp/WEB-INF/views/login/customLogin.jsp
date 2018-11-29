<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>LOGIN</h1><br>

<h3> error :  <c:out value="${error}"></c:out> </h3>
<h3> logout : <c:out value="${logout}"></c:out> </h3>

<form method="post" action="/salmon/login">
	<div>
		<input type="text" name="username" >
	</div>
	<div>
		<input type="password" name="password" >
	</div>
	<div>
		<input type="checkbox" name="remember-me">REMEMBER ME
	</div>
	<div>
		<input type="submit">
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>

</body>
</html>
