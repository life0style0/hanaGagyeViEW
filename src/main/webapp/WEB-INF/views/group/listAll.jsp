<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- ========================= * 소모임 게시물 리스트 확인 * ================================= -->
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
    	</head>
    	<body style="font-family: 'Noto Sans KR', sans-serif;">

      	<!-- THE LOADER -->
        <div class="be-loader">
          <div class="spinner">
            <img src="/salmon/resources/template/img/logo-loader.png" alt="">
            <p class="circle">
              <span class="ouro"><span class="left"><span class="anim"></span></span> <span class="right"><span class="anim"></span></span></span>
            </p>
          </div>
        </div>
  
  <!-- THE HEADER -->
  <%@ include file="/WEB-INF/views/includes/header.jsp"%>

  	<!-- MAIN CONTENT -->
  <div id="content-block">
    <div class="head-bg">
      <div class="head-bg-img"
        style="padding-top: 225px; background-image: url(https://images.unsplash.com/photo-1529156069898-49953e39b3ac?ixlib=rb-0.3.5&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;s=555e87ecbee5d64ab3ae0e0eb6cb1e29&amp;auto=format&amp;fit=crop&amp;w=1789&amp;q=80); background-position: 50% 50%; background-repeat: no-repeat; opacity: 0.9;"></div>
      <div class="head-bg-content">


      </div>
    </div>
    <div class="container be-detail-container" style="padding-top: 0px;">
      <h2 class="content-title">소모임</h2>

      <!-- 소모임 새로만들기 버튼 스타일  -->
      <style>
      .button {
      	display: inline-block;
      	border-radius: 4px;
      	background-color: #0d58c8;
      	border: none;
      	color: #FFFFFF;
      	text-align: center;
      	padding: 10px;
      	height: 45px;
      	width: 130px;
      	transition: all 0.5s;
      	cursor: pointer;
      	margin: 5px;
      	transition: all 0.5s;
      }
      
      .button span {
      	cursor: pointer;
      	display: inline-block;
      	position: relative;
      	transition: 0.5s;
      }
      
      .button span:after {
      	content: '\00bb';
      	position: absolute;
      	opacity: 0;
      	top: 0;
      	right: -20px;
      	transition: 0.5s;
      }
      
      .button:hover span {
      	padding-right: 25px;
      }
      
      .button:hover span:after {
      	opacity: 1;
      	right: 0;
      }
      </style>

      <!-- 소모임 새로만들기 버튼  -->
      <button type="button" id="regBtn" class="button"
        style="vertical-align: middle; float: right; font-size: 12pt;"
        onclick="location.href='http://localhost/salmon/group/register'">
        <span>새 소모임 </span>
      </button>
      <script type="text/javascript">
          		$(document).ready(function() {
          			var result = '<c:out value="${result}"/>';
          			checkModal(result);
          			history.replaceState({}, null, null);
          		function checkModal(result) {
          			if (result === '' || history.state) {
          						return;
          					}
          			 if (parseInt(result) > 0) {
          				$(".modal-body").html("게시글 "+ parseInt(result)+ " 번이 등록되었습니다.");
          						}
          							$("#myModal").modal("show");
          						}
          							var actionForm = $("#actionForm");
          
          						});
        	  	</script>
      <!-- MAIN CONTENT -->
      <div id="content-block">
        <div class="container be-detail-container"
          style="padding-top: 10px;">
          <div class="row">


            <div class="col-xs-12 col-md-12">
              <div class="tab-wrapper style-1">

                <div class="tab-nav-wrapper">
                  <div class="nav-tab  clearfix">
                    <div class="nav-tab-item ">
                      <span>카테고리별 찾기</span>
                    </div>
                    <div class="nav-tab-item" onclick="location.href='/salmon/group/listNew'">
                      <span>신규 소모임</span>
                    </div>
                    <div class="nav-tab-item" onclick="location.href='/salmon/group/listPopular'">
                      <span>인기 소모임</span>
                    </div>
                    <div class="nav-tab-item" onclick="location.href='/salmon/group/listCustomize'">
                      <span>맞춤 추천 소모임</span>
                    </div>
                    <div class="nav-tab-item active" >
                      <span>전체 소모임 리스트</span>
                    </div>
                  </div>
                </div>

                <div class="tabs-content clearfix">
                  <div class="tab-info ">
                    <div class="row">
                    

                    </div>
                  </div>


                  <!-- ============== 신규 소모임 LIST ==============-->
                  <div class="tab-info">
                    <div class="row">

                    </div>
                  </div>



                  <!-- ============== 인기 소모임 LIST ============== -->
                  <div class="tab-info">
                    <div class="row">
                    

                    </div>
                  </div>

                  <!-- ============== 맞춤 추천 소모임 LIST ============== -->
                   <div class="tab-info">
                    <div class="row">
                    

                    </div>
                  </div>

                  <!-- ====================탭 5 전체 소모임 리스트 (소모임 전체보기) ====================== -->



                  <div class="tab-info active">
                  <div class="row">
                  
                  
                      <!-- 인기순 리스트 확인하기  -->
                      <c:if test="${list.size() >0}">
                        <c:forEach items="${list}" var="group">
                          <div class="grid-item col-xs-12 col-sm-6 col-md-4" style="height: 430px;">
                            <div class="blog-post">
                              <div class="post-header clearfix">
                                <div class="post-date"
                                  style="text-align: center; padding: 14px 18px;">
                                  <i class="fa fa-clock-o"></i>
                                  <c:out value="${group.group_regdate}" />
                                </div>

                              </div>
                     

                              <div class="post-desc"
                                style="padding: 25px 20px 0px 20px; margin: 0px;">
                                <div class="post-category">
                                  카테고리 : #
                                  <c:out value="${group.ctgry_1_name}" />
                                  #
                                  <c:out value="${group.ctgry_2_name}" />
                                  #
                                  <c:out value="${group.ctgry_3_name}" />
                                </div>
                                <a class="post-label" href="/salmon/group/get?group_id=<c:out value="${group.group_id}" />"
                                  style="padding-bottom: 5px;"><c:out value="${group.group_title}" /></a>
                                <div class="post-text"
                                  style="padding-bottom: 10px; font-size: 15px;">
                                  <c:out value="${group.group_description}" />
                                </div>
                                <a class="btn color-1 size-2 hover-1"
                                  href="/salmon/group/get?group_id=<c:out value="${group.group_id}" />">입장하기</a>
                                <div class="author-post"
                                  style="float: right;">
                                  <img
                                    src="https://img.icons8.com/color/48/000000/administrator-male.png"
                                    alt="" class="ava-author"> <span>by
                                    <a
                                    href="/salmon/group/get?group_id=<c:out value="${group.group_id}" />">
                                    <c:out value="${group.user_id}" /></a>
                                  </span>
                                </div>
                                <div class="info-block">
                                  <span><i
                                    class="fa fa-thumbs-o-up"></i> 현재인원
                                    / 전체인원 : <a
                                    href="/salmon/group/get?group_id=<c:out value="${group.group_id}" />"
                                    class="be-post-tag"><c:out value="${group.group_people_now}" />
                                      / <c:out value="${group.group_people_max}" /></a></span>
                                </div>
                              </div>
                            </div>
                          </div>
                        </c:forEach>
                      </c:if>
                      <c:if test="${groupListbyCate.size() ==0}">
                       그룹이 없습니다
                       </c:if>
                  
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>








  <!-- 상황에 따른 메시지 확인을 위한 스크립트 -->
<script>
$(document).ready(function(){
	var result = '<c:out value="${result}"/>';
	checkModal(result);
	history.replaceState({}, null, null);
	
	function checkModal(result) {
		if (result === '' || history.state) {
			return;
		}
		if (parseInt(result) > 0) {
			$(".modal-body").html("게시글 " + parseInt(result)+ " 번이 등록되었습니다.");
		}

		$("#myModal").modal("show");
	}
	
});
</script>

  <!-- 카테고리별 소모임 리스트 모달 -->
  <%@ include file="/WEB-INF/views/includes/groupcatemodal.jsp"%>
  <!-- 카테고리별 소모임 리스트  모달끝 -->

  <!-- THE FOOTER -->
    <%@ include file="../includes/footer.jsp"%>

	<!-- SCRIPTS	 -->
	<script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
	<script src="/salmon/resources/template/script/bootstrap.min.js"></script>
	<script src="/salmon/resources/template/script/idangerous.swiper.min.js"></script>
	<script src="/salmon/resources/template/script/isotope.pkgd.min.js"></script>
	<script src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>		
	<script src="/salmon/resources/template/script/global.js"></script>	
	</body>
</html>