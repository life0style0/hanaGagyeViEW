<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>Login Confirm</title>


<!-- meta_tags-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
  content="connective login form a Flat Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript">
   
    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- Meta_tag_Keywords -->
<link href="../resources/Login/css/style.css" rel="stylesheet"
  type="text/css" media="all">
<!--style_sheet-->
<link href="../resources/Login/css/font-awesome.min.css"
  rel="stylesheet" type="text/css" media="all">
<!--font_awesome_icons-->
<!--web_fonts-->
<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
  rel="stylesheet">
<!--//web_fonts-->
<style>
form {
   font-family: 'Noto Sans KR', sans-serif;
}

.blackbox-sjh{
	background-color: rgba(0, 0, 0, 0.75);
    padding: 10px 10px;
    width: 50%;
    margin: auto;
}

</style>

<!-- 페이지 작성 이름 : http://localhost/salmon/regist/register-confirm -->
</head>

<body>

	<div class="submit-agileits"></div>
	
	<div class="blackbox-sjh">
		<div class="form-info" id="showId">
	
	 		<div class="form-info">
	          <h2 style="text-align: center;">회원 가입 결과</h2>
	        </div>
			<br>
	
			<h2 style="text-align: center; font-size: 20pt;">
				아이디 :
				<c:out value="${user_id}" />
			</h2>
	
		</div>
		<div class="submit-agileits">
	
			<a href="/salmon/login" >
			<input class="login" type="button"
				value="로그인 하기" style="width: 100%;">
			</a>
		</div>
	</div>


	<%-- 
<h1> 회원 가입 결과 </h1>

<h2><c:out value="${registRes}"/></h2> <br>
<h2>아이디 <c:out value="${user_id}"/></h2> <br>

<a href="/salmon/login"> 로그인 하기 </a>
 --%>
</body>
</html>
