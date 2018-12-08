<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
        style="padding-top: 225px; background-image: url(https://images.unsplash.com/photo-1529156069898-49953e39b3ac?ixlib=rb-0.3.5&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;s=555e87ecbee5d64ab3ae0e0eb6cb1e29&amp;auto=format&amp;fit=crop&amp;w=1789&amp;q=80); background-position: 50% 50%; background-repeat: no-repeat; opacity: 0.8;"></div>
      <div class="head-bg-content"></div>
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
                    <div class="nav-tab-item active">
                      <span>카테고리별 찾기</span>
                    </div>
                    <div class="nav-tab-item ">
                      <span>신규 소모임</span>
                    </div>
                    <div class="nav-tab-item ">
                      <span>인기 소모임</span>
                    </div>
                    <div class="nav-tab-item ">
                      <span>맞춤 추천 소모임</span>
                    </div>
                    <div class="nav-tab-item ">
                      <span>전체 소모임 리스트</span>
                    </div>
                  </div>
                </div>

                <div class="tabs-content clearfix">
                  <div class="tab-info active">
                    <div class="row">
                      <!-- ============= 카테고리별 찾기 ============= -->
                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block" style="height: 150px;">
                            <img
                            src="https://images.unsplash.com/photo-1534322869500-14fc9f5f5767?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">월급</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1533094700036-70ecccc6f047?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">부수입</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a2.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1532629345422-7515f3d16bb6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">용돈</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a3.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1519377345644-937ef9754740?ixlib=rb-1.2.1&auto=format&fit=crop&w=1429&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">상여</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a6.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>


                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1518515097038-ca19a3777cd7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">금융소득</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a7.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1501555088652-021faa106b9b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1353&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">아웃도어/여행</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a7.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>


                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1488423680352-79e37c24c59f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">운동/스포츠</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a6.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1512820790803-83ca734da794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1374&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">인문학/책/글</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a5.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block"
                            style="height: 200px;"> <img
                            src="https://images.unsplash.com/photo-1535982330050-f1c2fb79ff78?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1934&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">외국/언어</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1506157786151-b8491531f063?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">문화/공연/축제</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>


                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1483032469466-b937c425697b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">음악/악기</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img src="https://images.unsplash.com/photo-1528578577235-b963df6db908?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">공예/만들기</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1508700929628-666bc8bd84ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">댄스/무용</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1542228262-891dc133eb77?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">차/오토바이</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1520390138845-fd2d229dd553?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1189&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">사진/영상</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1493711662062-fa541adb3fc8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">게임/오락</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1514986888952-8cd320577b68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1355&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">요리/제조</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4"
                        style="height: 420px; width: 25%; padding-bottom: 20px;">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img
                            src="https://images.unsplash.com/photo-1518717758536-85ae29035b6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
                            alt="omg" height="200px;">
                          </a> <a href="page1.html" class="be-post-title">반려동물</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>



                    </div>
                  </div>


                  <!--  신규 소모임 -->
                  <div class="tab-info">
                    <div class="row">
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p8.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Racing
                            Queensland</a> <span> <a
                            href="page1.html" class="be-post-tag">Interaction
                              Design</a>, <a href="page1.html"
                            class="be-post-tag">UI/UX</a>, <a
                            href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a7.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p12.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Face</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a6.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p2.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Treebeard</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p3.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Colors
                            of Ramadan</a> <span> <a
                            href="page1.html" class="be-post-tag">Interaction
                              Design</a>, <a href="page1.html"
                            class="be-post-tag">UI/UX</a>, <a
                            href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a2.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p4.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Leaving
                            Home - L'Officiel Ukraine</a> <span> <a
                            href="page1.html" class="be-post-tag">Interaction
                              Design</a>, <a href="page1.html"
                            class="be-post-tag">UI/UX</a>, <a
                            href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a3.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>

                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p7.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">raindrops
                            monochrome</a> <span> <a
                            href="page1.html" class="be-post-tag">Interaction
                              Design</a>, <a href="page1.html"
                            class="be-post-tag">UI/UX</a>, <a
                            href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a6.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p9.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">NAHA
                            Finalist Hairstylist of the Year Allen Ruiz</a>
                          <span> <a href="page1.html"
                            class="be-post-tag">Interaction Design</a>,
                            <a href="page1.html" class="be-post-tag">UI/UX</a>,
                            <a href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a7.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p13.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Stay
                            Ahead Series</a> <span> <a
                            href="page1.html" class="be-post-tag">Interaction
                              Design</a>, <a href="page1.html"
                            class="be-post-tag">UI/UX</a>, <a
                            href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a5.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p14.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Faber-Castell
                            / Psychological Problems</a> <span> <a
                            href="page1.html" class="be-post-tag">Interaction
                              Design</a>, <a href="page1.html"
                            class="be-post-tag">UI/UX</a>, <a
                            href="page1.html" class="be-post-tag">Web
                              Design</a>
                          </span>
                          <div class="author-post">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span>
                          </div>
                          <div class="info-block">
                            <span><i class="fa fa-thumbs-o-up"></i>
                              360</span> <span><i class="fa fa-eye"></i>
                              789</span> <span><i
                              class="fa fa-comment-o"></i> 20</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>



                  <!-- ============== 추천 게시물 ============== -->
                  <div class="tab-info">
                    <div class="row">
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post style-4">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p16.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Wisdom
                            For My Children, Life Lessons Through</a>

                          <div class="author-post clearfix">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span> <span class="like-counter"><i
                              class="fa fa-thumbs-o-up"></i> 405</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post style-4">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p17.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Créations
                            Namale</a>
                          <div class="author-post clearfix">
                            <img src="img/a2.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span> <span class="like-counter"><i
                              class="fa fa-thumbs-o-up"></i> 405</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post style-4">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p18.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Crossfit
                            : 15.4 Open Workout</a>
                          <div class="author-post clearfix">
                            <img src="img/a3.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span> <span class="like-counter"><i
                              class="fa fa-thumbs-o-up"></i> 405</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post style-4">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p15.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Garry
                            Simpson - Bridges - Intelligent Life
                            Magazine</a>
                          <div class="author-post clearfix">
                            <img src="img/a6.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span> <span class="like-counter"><i
                              class="fa fa-thumbs-o-up"></i> 405</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post style-4">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p14.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Faber-Castell
                            / Psychological Problems</a>
                          <div class="author-post clearfix">
                            <img src="img/a7.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span> <span class="like-counter"><i
                              class="fa fa-thumbs-o-up"></i> 405</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post style-4">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p13.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Stay
                            Ahead Series</a>
                          <div class="author-post clearfix">
                            <img src="img/a7.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span> <span class="like-counter"><i
                              class="fa fa-thumbs-o-up"></i> 405</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post style-4">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p12.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Face</a>
                          <div class="author-post clearfix">
                            <img src="img/a6.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span> <span class="like-counter"><i
                              class="fa fa-thumbs-o-up"></i> 405</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post style-4">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p19.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Promoção
                            Facas Extra</a>
                          <div class="author-post clearfix">
                            <img src="img/a5.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span> <span class="like-counter"><i
                              class="fa fa-thumbs-o-up"></i> 405</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post style-4">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p11.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Tropicalia</a>
                          <div class="author-post clearfix">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span> <span class="like-counter"><i
                              class="fa fa-thumbs-o-up"></i> 405</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post style-4">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p10.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">tomorrow</a>
                          <div class="author-post clearfix">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span> <span class="like-counter"><i
                              class="fa fa-thumbs-o-up"></i> 405</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post style-4">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p9.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">NAHA
                            Finalist Hairstylist of the Year Allen Ruiz</a>
                          <div class="author-post clearfix">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span> <span class="like-counter"><i
                              class="fa fa-thumbs-o-up"></i> 405</span>
                          </div>
                        </div>
                      </div>
                      <div class="col-ml-12 col-xs-6 col-sm-4">
                        <div class="be-post style-4">
                          <a href="page1.html" class="be-img-block">
                            <img src="img/p8.jpg" alt="omg">
                          </a> <a href="page1.html" class="be-post-title">Racing
                            Queensland</a>
                          <div class="author-post clearfix">
                            <img src="img/a1.png" alt=""
                              class="ava-author"> <span>by
                              <a href="page1.html">Hoang Nguyen</a>
                            </span> <span class="like-counter"><i
                              class="fa fa-thumbs-o-up"></i> 405</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <!-- ===================== 탭4 ===================== -->
                  <div class="tab-info">
                    <div class="collection">
                      <h3 class="menu-article">Creative Ideas</h3>
                      <div class="collection-header">
                        <span><i class="fa fa-user"></i>by <a
                          href="page1.html">Leigh Taylor</a> </span> <span><i
                          class="fa fa-thumbs-o-up"></i> 360</span> <span><i
                          class="fa fa-eye"></i> 789</span>
                        <div class="edit-collection">
                          <i class="fa fa-pencil"></i>
                          <div class="c_edit">
                            <div class="btn-rename">
                              rename
                              <div class="message-popup">
                                <div
                                  class="message-popup-inner container">
                                  <div class="row">
                                    <div
                                      class="col-xs-12 col-sm-8 col-sm-offset-2">
                                      <i
                                        class="fa fa-times close-button"></i>
                                      <h5 class="large-popup-title">Rename</h5>
                                      <div class="form-group">
                                        <input class="form-input"
                                          required=""
                                          placeholder="Your text">
                                      </div>
                                      <button
                                        class="btn btn-right color-1 size-1 hover-1">OK</button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <a href="page1.html">delete</a>

                          </div>
                        </div>
                      </div>
                      <div class="collection-entry">
                        <a href="page1.html" class="portfolio-link type-2 clearfix"> 
                        <img src="img/collection_1.jpg" alt=""> 
                        <img src="img/collection_2.jpg" alt=""> 
                        <img src="img/collection_3.jpg" alt=""> 
                        <img src="img/collection_4.jpg" alt=""> 
                        <img src="img/collection_5.jpg" alt="">
                          <div class="color_bg">
                            <span>view gallery</span> <span
                              class="child"></span>d
                          </div>
                        </a>
                      </div>
                    </div>
                    <div class="collection">
                      <h3 class="menu-article">Creative Agency</h3>
                      <div class="collection-header">
                        <span><i class="fa fa-user"></i>by <a
                          href="page1.html">Leigh Taylor</a> </span> <span><i
                          class="fa fa-thumbs-o-up"></i> 360</span> <span><i
                          class="fa fa-eye"></i> 789</span>
                        <div class="edit-collection">
                          <i class="fa fa-pencil"></i>
                          <div class="c_edit">
                            <div class="btn-rename">
                              rename
                              <div class="message-popup">
                                <div
                                  class="message-popup-inner container">
                                  <div class="row">
                                    <div
                                      class="col-xs-12 col-sm-8 col-sm-offset-2">
                                      <i
                                        class="fa fa-times close-button"></i>
                                      <h5 class="large-popup-title">Rename</h5>
                                      <div class="form-group">
                                        <input class="form-input"
                                          required=""
                                          placeholder="Your text">
                                      </div>
                                      <button
                                        class="btn btn-right color-1 size-1 hover-1">OK</button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <a href="page1.html">delete</a>

                          </div>
                        </div>
                      </div>
                      <div class="collection-entry">
                        <a href="page1.html"
                          class="portfolio-link type-2 clearfix"> <img
                          src="img/collection_6.jpg" alt=""> <img
                          src="img/collection_7.jpg" alt=""> <img
                          src="img/collection_8.jpg" alt=""> <img
                          src="img/collection_9.jpg" alt=""> <img
                          src="img/collection_10.jpg" alt="">
                          <div class="color_bg">
                            <span>view gallery</span> <span
                              class="child"></span>
                          </div>
                        </a>
                      </div>
                    </div>
                    <div class="collection">
                      <h3 class="menu-article">Creative Agency</h3>
                      <div class="collection-header">
                        <span><i class="fa fa-user"></i>by <a
                          href="page1.html">Inspiration Art</a> </span> <span><i
                          class="fa fa-thumbs-o-up"></i> 360</span> <span><i
                          class="fa fa-eye"></i> 789</span>
                        <div class="edit-collection">
                          <i class="fa fa-pencil"></i>
                          <div class="c_edit">
                            <div class="btn-rename">
                              rename
                              <div class="message-popup">
                                <div
                                  class="message-popup-inner container">
                                  <div class="row">
                                    <div
                                      class="col-xs-12 col-sm-8 col-sm-offset-2">
                                      <i
                                        class="fa fa-times close-button"></i>
                                      <h5 class="large-popup-title">Rename</h5>
                                      <div class="form-group">
                                        <input class="form-input"
                                          required=""
                                          placeholder="Your text">
                                      </div>
                                      <button
                                        class="btn btn-right color-1 size-1 hover-1">OK</button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <a href="page1.html">delete</a>

                          </div>
                        </div>
                      </div>
                      <div class="collection-entry">
                        <a href="page1.html"
                          class="portfolio-link type-2 clearfix"> <img
                          src="img/collection_11.jpg" alt=""> <img
                          src="img/collection_12.jpg" alt=""> <img
                          src="img/collection_13.jpg" alt=""> <img
                          src="img/collection_14.jpg" alt=""> <img
                          src="img/collection_15.jpg" alt="">
                          <div class="color_bg">
                            <span>view gallery</span> <span
                              class="child"></span>
                          </div>
                        </a>
                      </div>
                    </div>
                    <div class="collection">
                      <h3 class="menu-article">Ideas For Personal
                        Site</h3>
                      <div class="collection-header">
                        <span><i class="fa fa-user"></i>by <a
                          href="page1.html">Inspiration Art</a> </span> <span><i
                          class="fa fa-thumbs-o-up"></i> 360</span> <span><i
                          class="fa fa-eye"></i> 789</span>
                        <div class="edit-collection">
                          <i class="fa fa-pencil"></i>
                          <div class="c_edit">
                            <div class="btn-rename">
                              rename
                              <div class="message-popup">
                                <div
                                  class="message-popup-inner container">
                                  <div class="row">
                                    <div
                                      class="col-xs-12 col-sm-8 col-sm-offset-2">
                                      <i
                                        class="fa fa-times close-button"></i>
                                      <h5 class="large-popup-title">Rename</h5>
                                      <div class="form-group">
                                        <input class="form-input"
                                          required=""
                                          placeholder="Your text">
                                      </div>
                                      <button
                                        class="btn btn-right color-1 size-1 hover-1">OK</button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <a href="page1.html">delete</a>

                          </div>
                        </div>
                      </div>
                      <div class="collection-entry">
                        <a href="page1.html" class="portfolio-link type-2 clearfix"> 
                        <img src="img/collection_16.jpg" alt=""> 
                        <img src="img/collection_17.jpg" alt=""> 
                        <img src="img/collection_18.jpg" alt=""> 
                        <img src="img/collection_19.jpg" alt=""> 
                        <img src="img/collection_20.jpg" alt="">
                          <div class="color_bg">
                            <span>view gallery</span> 
                            <span class="child"></span>
                          </div>
                        </a>
                      </div>
                    </div>
                    <div class="collection">
                      <h3 class="menu-article">Inspiration Photos</h3>
                      <div class="collection-header">
                        <span><i class="fa fa-user"></i>by <a
                          href="page1.html">Inspiration Art</a> </span> <span><i
                          class="fa fa-thumbs-o-up"></i> 360</span> <span><i
                          class="fa fa-eye"></i> 789</span>
                        <div class="edit-collection">
                          <i class="fa fa-pencil"></i>
                          <div class="c_edit">
                            <div class="btn-rename">
                              rename
                              <div class="message-popup">
                                <div
                                  class="message-popup-inner container">
                                  <div class="row">
                                    <div
                                      class="col-xs-12 col-sm-8 col-sm-offset-2">
                                      <i
                                        class="fa fa-times close-button"></i>
                                      <h5 class="large-popup-title">Rename</h5>
                                      <div class="form-group">
                                        <input class="form-input"
                                          required=""
                                          placeholder="Your text">
                                      </div>
                                      <button
                                        class="btn btn-right color-1 size-1 hover-1">OK</button>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <a href="page1.html">delete</a>

                          </div>
                        </div>
                      </div>
                      <div class="collection-entry">
                        <a href="page1.html"
                          class="portfolio-link type-2 clearfix"> <img
                          src="img/collection_6.jpg" alt=""> <img
                          src="img/collection_10.jpg" alt=""> <img
                          src="img/collection_8.jpg" alt=""> <img
                          src="img/collection_11.jpg" alt=""> <img
                          src="img/collection_3.jpg" alt="">
                          <div class="color_bg">
                            <span>view gallery</span> <span
                              class="child"></span>
                          </div>
                        </a>
                      </div>
                    </div>
                  </div>

                  <!-- ====================탭 5 전체 소모임 리스트 ====================== -->



                  <div class="tab-info">
                    <table class="table table-striped table-bordered table-hover">
                      <thead>
                        <tr>
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
                      <tr>
                      
                        <td><c:out value="${groups.group_id}" /></td>
                        <td><c:out value="${groups.group_title}"/></td>
                        <td><c:out value="${groups.group_regdate}" /></td>
                        <td><c:out value="${groups.group_description}" /></td>
                        <td><c:out value="${groups.group_people_max}" /></td>
                        <td><c:out value="${groups.user_id}" /></td>
                        <td><c:out value="${groups.ctgry_1}" /></td>
                        <td><c:out value="${groups.ctgry_2}" /></td>
                        <td><c:out value="${groups.ctgry_3}" /></td>
                      </tr>
                   </c:forEach>
                    
                    </table>
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
});
</script>

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