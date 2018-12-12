<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!-- ========================= * 소모임 신규 등록 * ================================= -->

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
		<link rel="stylesheet" href="/salmon/resources/template/style/stylesheet.css">
          
    	<!-- Font special for pages-->
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet"> 
        
        <!-- 페이지 내용 css -->
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        
  

    	</head>
    	<body style="font-family: 'Noto Sans KR', sans-serif;">

	<!-- THE LOADER -->
    <div class="be-loader">
      <div class="spinner">
        <img src="/salmon/resources/template/img/logo-loader.png" alt="">
        <p class="circle">
          <span class="ouro"> <span class="left"><span class="anim"></span></span> <span class="right"><span class="anim"></span></span></span>
        </p>
      </div>
    </div>
  
    <!-- THE HEADER -->
    <%@ include file="/WEB-INF/views/includes/header.jsp"%>

  	<!-- MAIN CONTENT -->
	<div id="content-block">
        <div class="head-bg">
          <div class="head-bg-img" style="padding-top: 225px;background-image: url(https://images.unsplash.com/photo-1529156069898-49953e39b3ac?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=555e87ecbee5d64ab3ae0e0eb6cb1e29&auto=format&fit=crop&w=1789&q=80);background-position: 50% 50%;background-repeat: no-repeat;opacity: 0.8;"></div>
          <div class="head-bg-content"></div>
        </div>
		<div class="container be-detail-container" style="padding-top: 0px;">
			<h2 class="content-title">소모임 신규 등록</h2>
      
      
        <!-- 판넬 바디  -->
        <!-- 소모임 이름 / 방장 / 현재 날짜 / 소모임 내용 / 소모임 정원 / 카테고리 1 / 카테고리 2 / 카테고리 3  -->
        <div class="panel-body">

        <form role="form" action="/salmon/group/register" method="post">
            <!-- 카테고리 설정 조건 : 
              1. 첫번째 것 하나만 선택해도 되도록 설저
             -->
            <!-- 1. 카테고리 ctgry_1 -->
            <div class="form-group" >      
              <label>카테고리 설정 1 </label>
              <select name="ctgry_1" id="ctgry_1">
                <option disabled="disabled" selected="selected">카테고리 선택</option>
                <option value="1">월급</option>
                <option value="2">부수입</option>
                <option value="3">용돈</option>
                <option value="4">상여</option>
                <option value="5">금융소득</option>
                <option value="6">아웃도어/여행</option>
                <option value="7">운동/스포츠</option>
                <option value="8">인문학/책/글</option>
                <option value="9">외국/언어</option>
                <option value="10">문화/공연/축제</option>
                <option value="11">음악/악기</option>
                <option value="12">공예/만들기</option>
                <option value="13">댄스/무용</option>
                <option value="14">차/오토바이</option>
                <option value="15">사진/영상</option>
                <option value="16">게임/오락</option>
                <option value="17">요리/제조</option>
                <option value="18">반려동물</option>
              </select>
            </div>
            
            <!-- 2. 카테고리 ctgry_2 -->
            <div class="form-group" >      
              <label>카테고리 설정 2 </label>
              <select name="ctgry_2" id="ctgry_2">
                <option disabled="disabled" selected="selected">카테고리 선택</option>
                <option value="1">월급</option>
                <option value="2">부수입</option>
                <option value="3">용돈</option>
                <option value="4">상여</option>
                <option value="5">금융소득</option>
                <option value="6">아웃도어/여행</option>
                <option value="7">운동/스포츠</option>
                <option value="8">인문학/책/글</option>
                <option value="9">외국/언어</option>
                <option value="10">문화/공연/축제</option>
                <option value="11">음악/악기</option>
                <option value="12">공예/만들기</option>
                <option value="13">댄스/무용</option>
                <option value="14">차/오토바이</option>
                <option value="15">사진/영상</option>
                <option value="16">게임/오락</option>
                <option value="17">요리/제조</option>
                <option value="18">반려동물</option>
              </select>
            </div>


            
            <!-- 3. 카테고리 ctgry_3-->
            <div class="form-group" >      
              <label>카테고리 설정 3 </label>
              <select name="ctgry_3" id="ctgry_3">
                <option disabled="disabled" selected="selected">카테고리 선택</option>
                <option value="1">월급</option>
                <option value="2">부수입</option>
                <option value="3">용돈</option>
                <option value="4">상여</option>
                <option value="5">금융소득</option>
                <option value="6">아웃도어/여행</option>
                <option value="7">운동/스포츠</option>
                <option value="8">인문학/책/글</option>
                <option value="9">외국/언어</option>
                <option value="10">문화/공연/축제</option>
                <option value="11">음악/악기</option>
                <option value="12">공예/만들기</option>
                <option value="13">댄스/무용</option>
                <option value="14">차/오토바이</option>
                <option value="15">사진/영상</option>
                <option value="16">게임/오락</option>
                <option value="17">요리/제조</option>
                <option value="18">반려동물</option>
              </select>
            </div>
            
            
          <div class="form-group">
          <!-- 소모임 이름 -->
            <label>소모임 이름</label> <input class="form-control" name="group_title" id="group_title" value="소모임 이름 테스트">
          </div>
          
          <div class="form-group">
          <!-- 방장 이름 -->
            <label>방장 </label> <input class="form-control" name="user_id" id="user_id" value="<sec:authentication property="principal.username" />" readonly="readonly">
          </div>

          <div class="form-group">
          <!-- 소모임 정원 -->
            <label>소모임 정원</label> <input class="form-control" name="group_people_max" id="group_people_max" value="200">
          </div>          
          
          <div class="form-group">
          <!-- 소모임 내용 -->
            <label>소모임 간단 소개글</label>
            <textarea class="form-control" rows="3" name="group_description" id="group_description" >텍스트 내용 접근 가능?</textarea>
          </div>


          <div class="form-group">     
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <button type="submit" class="btn btn-default" style="margin-bottom: 0px; margin-right: 0px;">소모임 만들기</button>
            <button type="reset" class="btn btn-default">전체 내용 삭제</button>
          </div>
        </form>

      </div>
</div>
</div>

  <!-- THE FOOTER -->
    <%@ include file="../includes/footer.jsp"%>
    <!--  로그아웃 팝업 -->
	<%@ include file="/WEB-INF/views/includes/logout.jsp"%>
	<!--  로그아웃 팝업 끝-->

	<!-- SCRIPTS	 -->
	<script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
	<script src="/salmon/resources/template/script/bootstrap.min.js"></script>
	<script src="/salmon/resources/template/script/idangerous.swiper.min.js"></script>
	<script src="/salmon/resources/template/script/isotope.pkgd.min.js"></script>
	<script src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>		
	<script src="/salmon/resources/template/script/global.js"></script>	
	</body>
</html>