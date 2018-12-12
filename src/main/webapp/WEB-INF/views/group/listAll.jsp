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
<!--         <h1 style="color: #298478; font-size: 32px; line-height: 40px; margin-bottom: 17px;"> 소모임 </h1>
        <p style="color:#a1a4af;"> 사람들과 모여 ~~</p> -->
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
      <button type="button" id="regBtn" class="btn size-1 color-1"
        style="vertical-align: middle; float: right; font-size: 12pt;"
        onclick="location.href='/salmon/group/register'">
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
                    <table class="table table-striped jambo_table bulk_action">
                      <thead>
                        <tr class="headings">
                          <th>#번호</th>
                          <th>소모임 제목</th>
                          <th>방장 이름</th>
                          <th>소모임 개설일</th>
                          <th>소모임 설명</th>
                          <th>최대인원</th>
                          <th>카테고리1</th>
                          <th>카테고리2</th>
                          <th>카테고리3</th>
                        </tr>
                      </thead>
                     <!-- items : 반복 데이터가 있는 아이템 : Collection명 / var: 현재 아이템 변수명-->
                    <c:forEach items="${list}" var="groups">
                      <tr class="even pointer">
                      
                        <td><c:out value="${groups.group_id}" /></td>
                        <td><a href='/salmon/group/get?group_id=<c:out value="${groups.group_id}" />'><c:out value="${groups.group_title}"/></a></td>
                        <td><c:out value="${groups.user_id}" /></td>
                        <td><c:out value="${groups.group_regdate}" /></td>
                        <td><c:out value="${groups.group_description}" /></td>
                        <td> <c:out value="${groups.group_people_now}" /> / <c:out value="${groups.group_people_max}" /></td>
                        <td><c:out value="${groups.ctgry_1_name}" /></td>
                        <td><c:out value="${groups.ctgry_2_name}" /></td>
                        <td><c:out value="${groups.ctgry_3_name}" /></td>
                      </tr>
                   </c:forEach>
                    
                    </table>
                  </div>
                  <!-- ====카테고리 이름으로 보기 수정중......실패  ===== -->
                  <div class="col-md-9 padding-1-sjh">
                    <c:choose>
                      <c:when
                        test="${not empty userPsnsInfo.ctgryNames}">
                        <c:forEach var="ctgryName" items="${userPsnsInfo.ctgryNames}" varStatus="status">
                          <div class="padding-1-sjh ctgry-badge">
                            <c:out value="${ctgryName}" />
                          </div>
                        </c:forEach>
                      </c:when>
                      <c:otherwise></c:otherwise>
                    </c:choose>

                  </div>
                  <!-- Modal  추가 -->
                  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                        </div>
                        <div class="modal-body">처리가 완료되었습니다.</div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                      </div>
                      <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                  </div>
                  <!-- /.modal -->






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