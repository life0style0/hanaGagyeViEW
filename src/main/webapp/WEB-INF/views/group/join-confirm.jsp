<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- ========================= * 소모임 상세 리스트  * ================================= -->

<!DOCTYPE html>
<html>
<head>
<title>HANA 가계ViEW</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon"
  href="/salmon/resources/template/img/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
  href="/salmon/resources/template/style/bootstrap.min.css">
<link rel="stylesheet"
  href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/salmon/resources/template/style/icon.css">
<link rel="stylesheet"
  href="/salmon/resources/template/style/loader.css">
<link rel="stylesheet"
  href="/salmon/resources/template/style/idangerous.swiper.css">
<!-- 혜림 수정 CSS -->
<link rel="stylesheet"
  href="/salmon/resources/lhr/css/stylesheet-hyerim.css">
<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
  rel="stylesheet">

<!-- 페이지 내용 css -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<!-- 주현 버튼 -->
<link rel="stylesheet" href="/salmon/resources/sjh/css/main-sjh.css">
<link rel="stylesheet" href="/salmon/resources/sjh/css/sns-feeds.css">

</head>
<body style="font-family: 'Noto Sans KR', sans-serif;">

  <!-- THE LOADER -->
  <div class="be-loader">
    <div class="spinner">
      <img src="/salmon/resources/template/img/logo-loader.png" alt="">
      <p class="circle">
        <span class="ouro"> <span class="left"><span
            class="anim"></span></span> <span class="right"><span
            class="anim"></span></span></span>
      </p>
    </div>
  </div>

  <!-- THE HEADER -->
  <%@ include file="/WEB-INF/views/includes/header.jsp"%>

  <!-- MAIN CONTENT -->

  <div id="content-block">
  
   <div class="head-bg">
      <div class="head-bg-img"
        style="padding-top: 225px; background-image: url(https://images.unsplash.com/photo-1529156069898-49953e39b3ac?ixlib=rb-0.3.5&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;s=555e87ecbee5d64ab3ae0e0eb6cb1e29&amp;auto=format&amp;fit=crop&amp;w=1789&amp;q=80); background-position: 50% 50%; background-repeat: no-repeat; opacity: 0.8;"></div>
      <div class="head-bg-content"></div>
    </div>
    
    <h2 class="content-title">소모임 가입 성공을 축하드립니다. :D</h2>
    <h5 style="padding: 5px;"><sec:authentication property="principal.username" />님 환영합니다. </h5>
    <c:choose>
      <c:when test="${check == 'success'}">
         
      <h2 class="content-title">소모임 가입 성공을 축하드립니다. :D</h2>
      </c:when>
      <c:when test="${check == 'fail'}">
        <div>실패화면 ~~~!!!</div>
      </c:when>
    </c:choose> 
    
<!--       <h2 class="content-title">소모임 가입 성공을 축하드립니다. :D</h2>
 -->      

      <style>
      html,body{
  height:100%;
}
body{
  text-align:center;
  font-family: 'Noto Sans KR', sans-serif;
}

button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
      
      
      </style>
      <button onclick="historyBack()" >소모임으로 이동</button>

      
      <script type="text/javascript"> 
      function historyBack() {
        history.back(); 
        } 
      </script> 

    
  </div>


  <!-- THE FOOTER -->
  <%@ include file="../includes/footer.jsp"%>
  <!--  로그아웃 팝업 -->
	<%@ include file="/WEB-INF/views/includes/logout.jsp"%>
	<!--  로그아웃 팝업 끝-->

  <!-- SCRIPTS	 -->
  <script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
  <script src="/salmon/resources/template/script/bootstrap.min.js"></script>
  <script
    src="/salmon/resources/template/script/idangerous.swiper.min.js"></script>
  <script src="/salmon/resources/template/script/isotope.pkgd.min.js"></script>
  <script src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>
  <script src="/salmon/resources/template/script/global.js"></script>
</body>
</html>