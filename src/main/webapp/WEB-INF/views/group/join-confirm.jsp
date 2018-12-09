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
<link rel="shortcut icon" href="/salmon/resources/template/img/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/salmon/resources/template/style/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/salmon/resources/template/style/icon.css">
<link rel="stylesheet" href="/salmon/resources/template/style/loader.css">
<link rel="stylesheet" href="/salmon/resources/template/style/idangerous.swiper.css">
    <!-- 혜림 수정 CSS -->
		<link rel="stylesheet" href="/salmon/resources/lhr/css/stylesheet-hyerim.css">
<!-- Font special for pages-->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">

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
<c:choose>
  <c:when test="${check == 'success'}">
  <div>
  성공 화면 ~~~!!!
  </div>
  </c:when>
  <c:when test="${check == 'fail'}">
  <div>
  실패화면 ~~~!!!
  </div>
  </c:when>
</c:choose>
</div>

  <!-- THE FOOTER -->
  <%@ include file="../includes/footer.jsp"%>

  <!-- SCRIPTS	 -->
  <script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
  <script src="/salmon/resources/template/script/bootstrap.min.js"></script>
  <script
    src="/salmon/resources/template/script/idangerous.swiper.min.js"></script>
  <script src="/salmon/resources/template/script/isotope.pkgd.min.js"></script>
  <script
    src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>
  <script src="/salmon/resources/template/script/global.js"></script>
</body>
</html>