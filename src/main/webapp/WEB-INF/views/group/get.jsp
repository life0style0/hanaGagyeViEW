<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
  <!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
    crossorigin="anonymous">
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
  <!-- 게시물 보기 위한 링크 stylesheet -->
  <link rel="stylesheet" href="/salmon/resources/template/style/jquery-ui.css">
  <link rel="stylesheet" href="/salmon/resources/sjh/css/card-sjh.css">
  <link rel="stylesheet" href="/salmon/resources/jjw/css/stylesheet_jjw.css">
  <link rel="stylesheet" href="/salmon/resources/jjw/css/common.css">
  <link rel="stylesheet" href="/salmon/resources/jjw/css/stylesheet_jjw.css">
  <link rel="stylesheet" href="/salmon/resources/jjw/css/owl.carousel.min.css">
  <link rel="stylesheet" href="/salmon/resources/jjw/css/owl.theme.default.min.css">
  <!-- 새로 추가한 링크 리스트 -->




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

.swiper-arrow-left:after, .swiper-arrow-right:after {
    font-weight: 900;
    font-family: "Font Awesome\ 5 Free";
}

</style>

    <!-- 소모임 게시물 작성하기 버튼  -->
    <button type="button" id="regBtn" class="button" style="vertical-align: middle; float: right; font-size: 12pt;"
      onclick="location.href='/salmon/article/registerGroup?group_id=${groups.group_id}'">
      <span>게시물 작성</span>
    </button>


    <div class="container be-detail-container">
      <div class="row">
        <div class="col-xs-12 col-md-4 left-feild">
          <!-- 왼쪽 소모임 상세 리스트  -->
          <div class="be-user-block style-3">
            <!-- 소모임 기본 프로필 사진 설정을 위한 CSS -->
            <style>
              .be-ava-user.style-2>img {
	width: 190px;
	height: 190px;
}
</style>
            <div class="be-user-detail">
              <a class="be-ava-user style-2" href="page1.html" style="width: 200px; height: 200px;"> <img width="200px;"
                  height="200px;" src="https://images.unsplash.com/photo-1525336001612-b942036da7b7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1784&q=80"
                  alt="">
              </a>


              <!-- =========== C태그 활용한 소모임 제목 / 소모임 상세 정보 띄우기   -->
              <p class="be-use-name">
                <c:out value="${groups.group_title}" />
              </p>
              <div class="be-user-info">
                <c:out value="${groups.group_description}" />
              </div>

              <!-- 소모임 (가입)팔로우 여부 확인을 위한 Modal-fade 띄우기  -->
              <form role="form" action="/salmon/group/get" method="post">
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                  aria-hidden="true">
                  <div class="modal-dialog" style="font-family: 'Noto Sans KR', sans-serif;">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">×</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">소모임
                          가입</h4>
                      </div>
                      <div class="modal-body">
                        소모임에 가입하시겠습니까? <br> <input type="hidden" name="group_id" value="${groups.group_id}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <button type="submit" class="btn btn-primary" style="margin: 10px;" onclick="haerimAddFunction()">가입</button>
                        <div id="snackbar">소모임 가입이 완료되었습니다. 소모임을
                          즐겨보세요 :-)</div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
              <!-- 소모임 가입 완료를 위한 JS 스낵바 -->
              <script type="text/javascript">
                function haerimAddFunction() {
                  var x = document
                    .getElementById("snackbar");
                  x.className = "show";
                  setTimeout(
                    function () {
                      x.className = x.className
                        .replace(
                          "show",
                          "");
                    }, 3000);

                }
              </script>


              <!-- ============== a태그 누르면 가입 모달 띄우기 ================= -->
              <div class="be-user-activity-block" style="font-family: 'Noto Sans KR', sans-serif;">
                <div class="row">
                  <div class="col-lg-6">
                    <!-- FOLLOW -->
                    <c:if test="${checkRegist}">
                      <a data-toggle="modal" data-target="#myModal" class="be-user-activity-button be-follow-type"
                        style="font-family: Noto Sans KR, sans-serif; font-size: 8.5pt; padding: 5px; text-align: center;">
                        <i class="fa fa-plus"></i>소모임 참여
                      </a>
                    </c:if>
                  </div>
                  <div class="col-lg-6">
                    <!-- MESSAGE -->
                    <a class="col-lg-6 be-user-activity-button send-btn be-message-type">
                      <i class="fa fa-envelope"></i>MESSAGE
                    </a>
                    <!-- ============소모임 메시지 팝업 ====== -->
                    <div class="large-popup send-m">
                      <div class="large-popup-fixed"></div>
                      <div class="container large-popup-container">
                        <div class="row">
                          <div class="col-md-10 col-md-push-1 col-lg-8 col-lg-push-2 large-popup-content">
                            <div class="row">
                              <div class="col-xs-12 col-sm-8 col-sm-offset-2">
                                <i class="fa fa-times close-m close-button"></i>
                                <h5 class="large-popup-title">♥
                                  소모임에 메시지 보내기 ♥</h5>
                                <div class="form-group">
                                  <textarea class="form-input" required="" placeholder="Your text"></textarea>
                                </div>
                                <a class="btn btn-right color-1 size-1 hover-1" onclick="hyerimFunction()">send
                                  message</a>
                                <div id="snackbar1">메시지가 등록되었습니다.
                                  :-)</div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 소모임 메시지가 등록되었습니다. 스낵바 보여주기 위한 JS -->
              <script type="text/javascript">
                function hyerimFunction() {
                  var x = document
                    .getElementById("snackbar1");
                  x.className = "show";
                  setTimeout(
                    function () {
                      x.className = x.className
                        .replace(
                          "show",
                          "");
                    }, 3000);
                }
              </script>

              <style>
                #snackbar, #snackbar1 {
	visibility: hidden;
	min-width: 250px;
	margin-left: -125px;
	background-color: #333;
	color: #fff;
	text-align: center;
	border-radius: 2px;
	padding: 16px;
	position: fixed;
	z-index: 1;
	left: 50%;
	bottom: 30px;
	font-size: 17px;
}

#snackbar.show, #snackbar1.show {
	visibility: visible;
	-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}
}
@keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@-webkit-keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
@keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>


              <div class="be-text-tags style-2" style="color: #383b43;">
                <a href="#" style="color: #383b43;">소모임</a>, <a href="#" style="color: #383b43;">관심사 취미</a>, <a href="#"
                  style="color: #383b43;">소비패턴</a>
              </div>

              <!-- =========소셜 정보 div -->
              <div class="be-user-social">
                <a class="social-btn color-1" href="#"><i class="fa fa-facebook"></i></a> <a class="social-btn color-2"
                  href="#"><i class="fa fa-twitter"></i></a> <a class="social-btn color-3" href="#"><i class="fa fa-google-plus"></i></a>
                <a class="social-btn color-4" href="#"><i class="fa fa-pinterest-p"></i></a> <a class="social-btn color-5"
                  href="#"><i class="fa fa-instagram"></i></a> <a class="social-btn color-6" href="#"><i class="fa fa-linkedin"></i></a>
              </div>
              <a class="be-user-site" href="#"><i class="fa fa-link"></i>
                www.GAGYEViEW.com</a>
            </div>
            <!-- =========검은색 리스트 내용 리스트 -->
            <div class="be-user-statistic">
              <div class="stat-row clearfix">
                <i class="stat-icon icon-views-b"></i> 방문자<span class="stat-counter">218098</span>
              </div>
              <div class="stat-row clearfix">
                <i class="stat-icon icon-like-b"></i> 공감 <span class="stat-counter">14335</span>
              </div>
              <div class="stat-row clearfix">
                <i class="stat-icon icon-followers-b"></i>Followers<span class="stat-counter">2208</span>
              </div>
              <div class="stat-row clearfix">
                <i class="stat-icon icon-following-b"></i>Following<span class="stat-counter">0</span>
              </div>
            </div>
          </div>

          <!-- ======================= 주요 상세 리스트 끝 =================== -->


          <!-- ======================= 소모임 소개  =================== -->
          <div class="be-desc-block">
            <div class="be-desc-author">
              <div class="be-desc-label">About Me</div>
              <div class="clearfix"></div>
              <div class="be-desc-text" style="color: #383b43;">
                너와 나의 연결 고리!<br> 취미 생활 소비 생활 크루 찾기! <br> 같은
                취향과 소비 패턴을 가진 사람들과 소비 생활을 즐겨요!<br>


              </div>
            </div>
            <div class="be-desc-author">
              <div class="be-desc-label">My Values</div>
              <div class="clearfix"></div>
              <div class="be-desc-text" style="color: #383b43;">
                소모임 크루와 워라밸, 효율적인 소비패턴을 배우며 소확행을 시작해요 :) <br> 오프라인,
                온라인 정모를 중심으로, 활발하게 활동을 하고 있습니다!<br> 문화 활동 및 레저스포츠
                소모임을 통해 더 여유롭고 행복한 삶을 만들어 보세요.<br>
              </div>
            </div>
            <div class="be-desc-author">
              <div class="be-desc-label">My Skills</div>
              <div class="clearfix"></div>
              <div class="be-desc-text" style="color: #383b43;">
                누구나 쉽게 가입하고 직접 개설할 수 있어요. :)<br> 다양한 소비 정보가 모여있는
                소모임에서 배우고 즐겨요.<br>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xs-12 col-md-8">
          <!--  =========================== 주요 컨텐츠 내용 스타트 ========================= -->
          <div class="tab-wrapper style-1">
            <div class="tab-nav-wrapper">
              <div class="nav-tab  clearfix">
                <div class="nav-tab-item active">
                  <span>정보</span>
                </div>
                <div class="nav-tab-item ">
                  <span>게시판</span>
                </div>
                <div class="nav-tab-item ">
                  <span>방명록</span>
                </div>
              </div>
            </div>

            <div class="tabs-content clearfix" style="font-family: 'Noto Sans KR', sans-serif;">
              <!-- =============== 첫번째 정보 =============== -->
              <div class="tab-info active" style="font-family: 'Noto Sans KR', sans-serif;">
                <div class="row" style="font-family: 'Noto Sans KR', sans-serif;">
                  <h2>
                    <c:out value="${groups.group_title}" />
                  </h2>
                  <h3>
                    소모임 간단 소개 :
                    <c:out value="${groups.group_description}" />
                  </h3>
                  <h4>
                    소모임 방장 :
                    <c:out value="${groups.user_id}" />
                  </h4>
                  <h4>
                    소모임 현재인원 / 정원 : 현재인원 /
                    <c:out value="${groups.group_people_max}" />
                  </h4>
                  <h4>
                    소모임 카테고리 1 :
                    <c:out value="${groups.ctgry_1}" />
                  </h4>

                  <!-- 썸네일 프리뷰 : 사진 리스트 시작 -->
                  <div class="be-large-post-slider type-wide" style="margin: 0px;">
                    <div class="swiper-container thumbnails-preview" data-autoplay="0" data-loop="1" data-speed="500"
                      data-center="0" data-slides-per-view="1">
                      <div class="swiper-wrapper">
                        <div class="swiper-slide active" data-val="0">
                          <img class="img-responsive img-full" src="https://images.unsplash.com/photo-1517840933437-c41356892b35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
                            alt="">
                          <div class="slider-text">너와 나의 연결 고리!
                            소비와 취미 생활 크루 찾기</div>
                        </div>
                        <div class="swiper-slide" data-val="1">
                          <img class="img-responsive img-full" src="https://images.unsplash.com/photo-1495837174058-628aafc7d610?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
                            alt="">
                          <div class="slider-text">같은 취향과 소비 패턴을
                            가진 사람들과 소비 생활을 즐겨요!</div>
                        </div>
                        <div class="swiper-slide" data-val="2">
                          <img class="img-responsive img-full" src="https://images.unsplash.com/photo-1511988617509-a57c8a288659?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80"
                            alt="">
                          <div class="slider-text">소모임 크루와 워라밸,
                            효율적인 소비패턴을 배우며 소확행을 시작해요 :D</div>
                        </div>
                        <div class="swiper-slide" data-val="3">
                          <img class="img-responsive img-full" src="https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
                            alt="">
                          <div class="slider-text">문화 활동 레저스포츠
                            소비생활 개선 소모임을 통해 더 여유롭고 생복한 삶을 만들어 보세요 :)</div>
                        </div>
                        <div class="swiper-slide" data-val="4">
                          <img class="img-responsive img-full" src="https://images.unsplash.com/photo-1536010447069-d2c8af80c584?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
                            alt="">
                          <div class="slider-text">누구나 쉽게 가입하고 직접
                            개설할 수 있어요. 다양한 소비정보가 모여있는 소모임에서 배우고 즐겨요.</div>
                        </div>
                      </div>
                      <div class="pagination hidden"></div>
                      <div class="swiper-arrow-left type-2"></div>
                      <div class="swiper-arrow-right type-2"></div>
                    </div>
                    <div class="swiper-container thumbnails" data-autoplay="0" data-loop="0" data-speed="500"
                      data-center="0" data-slides-per-view="responsive" data-xs-slides="3" data-sm-slides="5"
                      data-md-slides="5" data-lg-slides="5" data-add-slides="5">
                      <div class="swiper-wrapper">
                        <div class="swiper-slide current active" data-val="0">
                          <img src="https://images.unsplash.com/photo-1517840933437-c41356892b35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
                            alt="">
                        </div>
                        <div class="swiper-slide" data-val="1">
                          <img src="https://images.unsplash.com/photo-1495837174058-628aafc7d610?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
                            alt="">
                        </div>
                        <div class="swiper-slide" data-val="2">
                          <img src="https://images.unsplash.com/photo-1511988617509-a57c8a288659?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80"
                            alt="">
                        </div>
                        <div class="swiper-slide" data-val="3">
                          <img src="https://images.unsplash.com/photo-1519671482749-fd09be7ccebf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
                            alt="">
                        </div>
                        <div class="swiper-slide" data-val="4">
                          <img src="https://images.unsplash.com/photo-1536010447069-d2c8af80c584?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
                            alt="">
                        </div>
                      </div>
                      <div class="pagination hidden"></div>
                    </div>
                  </div>
                </div>
              </div>


              <div class="tab-info">
                <!-- ==================== 게시판 ====================-->
                <div class="row">

                  <!-- main/home에서 복붙한 것 : 적용 되는지 확인 필요  -->
                  <div class="col-ml-12 col-xs-6 col-sm-4">
                    <c:if test="${fn:length(articleList) == 0 }">
                      <div class="be-post">
                        <div class="be-large-post info-block">
                          <h2>내 주변 활동이 없습니다. 지금 주변을 둘러보고 팔로우를
                            시작하세요!</h2>
                          <h3>
                            <a href="/salmon/sns/showall">둘러보기</a>
                          </h3>
                        </div>
                      </div>
                    </c:if>
                    <c:if test="${fn:length(articleList) > 0 }">
                      <c:forEach var="article" items="${articleList}">
                        <div class="be-post">
                          <div id='article-post-<c:out value="${article.article_id}"/>' class="be-post-sjh">
                            <a class="be-img-block">
                              <c:if test="${fn:length(article.imagePaths) == 0 }">
                                <div class="article-size">
                                  <div class="padding-1-sjh">
                                    <c:out value="${article.article_content}" />
                                  </div>
                                </div>
                                <!-- <img src="/salmon/resources/hjh/images/noimage.gif" alt="img"> -->
                              </c:if>
                              <c:if test="${fn:length(article.imagePaths) > 0 }">
                                <c:forEach var="image" items="${article.imagePaths}">
                                  <div class="article-size" style="text-align: center;">
                                    <img src="/salmon/main/image?fileName=${image}" alt="img">
                                  </div>
                                </c:forEach>
                              </c:if>
                            </a>
                            <a id='article-title-<c:out value="${article.article_id}"/>' class="be-post-title">
                              ${article.article_title}
                            </a>
                            <span>
                              <c:forEach var="tag" items="${article.hashtags}">
                                <a href="blog-detail-2.html" class="be-post-tag">${tag} </a>
                              </c:forEach>
                            </span>
                            <div class="author-post">
                              <a href="/salmon/sns/feeds?userid=${article.user_id}">${article.user_nickname}</a>
                            </div>
                            <div class="info-block">
                              <span>
                                <i class="fa fa-thumbs-up"></i>
                                <%--좋아요 --%>
                                <c:out value="${fn:length(article.likes)}" />
                              </span>
                              <span>
                                <i class="fa fa-eye"></i>
                                <%--스크랩수 --%>
                                <c:out value="${fn:length(article.scraps)}" />
                              </span>
                              <span>
                                <i class="fa fa-comment"></i>
                                <%--댓글수 --%>
                                <c:out value="${fn:length(article.comments)}" />
                              </span>
                            </div>
                          </div>
                        </div>
                      </c:forEach>
                    </c:if>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-info">
              <!-- ============== 방명록  ============== -->

              <div class="be-comment-block">
                <h1 class="comments-title">
                  댓글 (<span id="commentCnt" class="comment-count">${article.commentCnt}</span>)
                </h1>
                <c:forEach items="${article.comments}" var="comment" varStatus="status">
                  <div class="be-comment">
                    <input type="hidden" name="comment-id" value="${comment.comment_id}"> <input type="hidden" name="article-id"
                      value="${article.articleId}">
                    <div class="be-img-comment">
                      <a href=""> <input type="hidden" class="imagePath" value="/salmon/image?fileName=${comment.user_image}">
                        <img src="" alt="" class="be-ava-comment image-src thumbnail-comment">
                      </a>
                    </div>
                    <div class="be-comment-content">
                      <span class="be-comment-name"> <a href="">${comment.user_nickname}</a>
                      </span> <span class="be-comment-time">
                        <c:if test="${comment.user_id == userId}">
                          <span name="comment-delete-btn" class="comment-delete-btn"> <i class="fas fa-times"></i>삭제
                          </span>
                        </c:if> <i class="fa fa-clock"></i>
                        ${comment.comment_regdate}
                      </span>
                      <p class="be-comment-text">
                        ${comment.comment_content}</p>
                    </div>
                  </div>
                </c:forEach>
                <form class="form-block comment-form" method="post">
                  <div class="row">
                    <div class="col-xs-12">
                      <div class="form-group">
                        <textarea class="form-input" required placeholder="댓글 내용을 입력하세요" name="content"></textarea>
                      </div>
                    </div>
                    <input type="hidden" name="lastCommentId" value="">
                    <input type="hidden" name="articleId" value="${article.articleId}"> <input type="hidden" id="csrf"
                      name="${_csrf.parameterName}" value="${_csrf.token}">
                    <button type="submit" class="btn color-1 size-2 hover-1 pull-right" id="comment">댓글 달기</button>
                  </div>
                </form>
              </div>


            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>




  <!-- THE FOOTER -->
  <%@ include file="../includes/footer.jsp"%>

  <!-- 게시글 모달 -->
  <%@ include file="/WEB-INF/views/includes/articlemodal_group.jsp"%>
  <!--  게시글 모달끝 -->

  <!-- 게시글 신고 모달 -->
  <%@ include file="/WEB-INF/views/includes/reportModal.jsp"%>
  <%@ include file="/WEB-INF/views/includes/reportConfirmModal.jsp"%>
  <!--  게시글 신고 모달끝 -->

  <!-- SCRIPTS	 -->
  <script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
  <script src="/salmon/resources/template/script/bootstrap.min.js"></script>
  <script src="/salmon/resources/template/script/idangerous.swiper.min.js"></script>
  <script src="/salmon/resources/template/script/isotope.pkgd.min.js"></script>
  <script src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>
  <script src="/salmon/resources/template/script/global.js"></script>
  <!-- 추가한 SCRIPTS 파일 -->
  <script src="/salmon/resources/sjh/js/main-article.js"></script>
  <script src="/salmon/resources/jjw/js/owl.carousel.min.js"></script>
  <!--***************************절대 빼면안되********************************-->
  <script type="text/javascript">
    var me;
    var isGroup = true;
    $(function () {
      //내정보 불러오기
      me = ${ meJSON };
    });
  </script>

  <script>
    $('#article-modal').on('show.bs.modal', function () {
      const articleId = $('#article-id-modal').val();
      const addr = $('#regBtn').attr('onclick').split('=');
      const groupId = addr[addr.length - 1].substr(0, addr[addr.length - 1].length - 1);
      $('#article-edit-btn a').attr('href', '/salmon/article/editGroup?article_id=' + articleId);
      $('#article-delete-btn a').attr('href', '/salmon/group/delete?article_id=' + articleId + '&group_id=' + groupId);
    });
  </script>

</body>

</html>