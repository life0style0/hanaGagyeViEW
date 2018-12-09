<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>! ! access denied ! ! </h1><br>
<h1>
<c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"></c:out><br>
<c:out value="${msg}"></c:out><br>
</h1>
</body>
</html>
