<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="utf-8">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="/salmon/resources/adminTemplate/images/favicon.png" type="image/ico" />

    <title>HANA 가계ViEW </title>

    <!-- Bootstrap -->
    <link href="/salmon/resources/adminTemplate/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/salmon/resources/adminTemplate/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/salmon/resources/adminTemplate/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
   <link href="/salmon/resources/adminTemplate/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/salmon/resources/adminTemplate/build/css/custom.min.css" rel="stylesheet">
  </head>

    <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
            	<a href="/salmon">
            		<img class="logo-c active be_logo" src="/salmon/resources/template/img/logo.png" alt="logo" style="width:200px;height:48px">
            	</a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="/salmon/resources/template/img/favicon.png" alt="hana" class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>안녕하세요,</span>
                <h2>관리자님</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>관리자 메뉴</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-table"></i> 통계분석 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="index">유저 분석</a></li>
                      <li><a href="paymentInfo">소비 분석</a></li>
                      <li><a href="articleInfo">게시글 분석</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> 게시글 및 유저 관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="articleManage">게시글 관리</a></li>
                      <li><a href="userManage">유저 관리</a></li>
                      <li><a href="suggestionManage">역제안 관리</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="/salmon/resources/adminTemplate/images/favicon.png" alt="">관리자님
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li>
                    <%-- 로그아웃 추가 --%>
                    <form method="post" action="/salmon/customLogout" class="popup-input-search">
		              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		              <button class="btn" style="background-color:#fff; width:200px;">로그아웃</button>
		            </form>
		            <%-- 로그아웃 추가 --%>
                   <!--  <a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a> -->
                    </li>
                  </ul>
                </li>
				<!--푸쉬알람  -->
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <div class="right_col" role="main">
			<div class="clearfix"></div>
			<div class="row">
              	<div class="col-md-12 col-sm-12 col-xs-12">
                	<div class="x_panel">
	                  <div class="x_title">
	                    <h2>유저 관리 <small>유저 관리 기능</small></h2>
	                    <ul class="nav navbar-right panel_toolbox">
	                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
	                      </li>
	                      <li><a class="close-link"><i class="fa fa-close"></i></a>
	                      </li>
	                    </ul>
	                    <div class="clearfix"></div>
	                  </div>

                  <div class="x_content">

                    <p>관리자님께서 <code>블랙하실 유저를</code> 선택해주세요</p>

                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="check-all" class="flat">
                            </th>
                            <th class="column-title">유저 아이디</th>
                            <th class="column-title">유저 이메일</th>
                            <th class="column-title">가입일 </th>
                            <th class="column-title">생년월일</th>
                            <th class="column-title">블랙게시글수</th>
                            <th class="column-title no-link last"><span class="nobr">블랙 게시글 보기</span>
                            </th>
                            <th class="bulk-actions" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">선택 유저 ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="user" items="${userInfoList}">
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class="userId">${user.user_id }</td>
                            <td class=" ">${user.user_email }</td>
                            <td class=" ">${user.user_regdate }<i class="success fa fa-long-arrow-up"></i></td>
                            <td class=" ">${user.user_birthday }</td>
                            <td class=" ">${user.black_ct }</td>
                            <td class=" last"><a href="javascript:getModal('${user.user_id }');">보기</a>
                            </td>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                       <button class="btn btn-danger" style="float:right;" id="deleteBtn">삭제하기</button>		
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>



    <!-- jQuery -->
    <script src="/salmon/resources/adminTemplate/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/salmon/resources/adminTemplate/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/salmon/resources/adminTemplate/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/salmon/resources/adminTemplate/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="/salmon/resources/adminTemplate/vendors/iCheck/icheck.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="/salmon/resources/adminTemplate/build/js/custom.min.js"></script>

	<script>
	function getModal(user_id){
		$.ajax({
	        async: false,
	        url: "/salmon/admin/blackArticleShow?user_id="+user_id,
	        method: 'get',
	        dataType: 'json',
	        success: function (datas) {
	        	var domSet = ""; 
	            for(var idx = 0; idx<datas.length; idx++){
	            	domSet += "<tr><th>"+(idx+1)+"</th>"+
	            	"<td>"+datas[idx].article_id+"</td>" +
	            	"<td>"+datas[idx].article_title+"</td>" +
	            	"<td>"+datas[idx].article_report_num+"</td></tr>" ;
	            }
	        	console.log(domSet);
	        	console.log($("#listTarget"));
	        	document.getElementById("listTarget").innerHTML = domSet;
	        	$("#listTarget").innerHTML=domSet; 
	        }
	    });
	
		$("#InfoModal").modal({
        	keyboard:false,
        	show:true,
        	backdrop:true
        });
	}
	
	
	</script>


	<script>
	$("#deleteBtn").on("click", function(){
		var target = $("tr:has(:checked) .userId");
		var targetIdSet = {};
		var temp = [];
		for(var i = 0; i <target.length; i++){	
			temp.push(target[i].innerText);
		}	
		targetIdSet["user_id"] = temp;
		console.log(targetIdSet);
		
		jQuery.ajaxSettings.traditional = true;
		
		$.ajax({
	        url: "/salmon/admin/userBlockProc",
	        data : {"user_id":temp},
	        method: 'get',
	        cache:false,
	        success: function (datas) {
   				$("#resultModal").modal({
	            	keyboard:false,
	            	show:true,
	            	backdrop:true
	            });
	        }
	    });
		
		
	});
	
	</script>
	 <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" id="InfoModal">
       <div class="modal-dialog modal-lg">
         <div class="modal-content">

           <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
             </button>
             <h4 class="modal-title" id="myModalLabel">유저 정보</h4>
           </div>
           <div class="modal-body" id="myModalBody">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>신고 게시글 내역 <small>해당 유저의 신고 게시글 내역입니다.</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>게시글 아이디</th>
                          <th>게시글 제목</th>
                          <th>신고 수</th>
                        </tr>
                      </thead>
                      <tbody id="listTarget">
                        
                      </tbody>
                    </table>

                  </div>
                </div>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
           </div>
         </div>
       </div>
     </div>
     
     <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true" id="resultModal">
       <div class="modal-dialog modal-sm">
         <div class="modal-content">

           <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>
             </button>
             <h4 class="modal-title" id="myModalLabel2">처리 결과</h4>
           </div>
           <div class="modal-body">
             <h4>회원 블랙리스트 설정 성공</h4>
             <p>선택하신 회원이 성공적으로 블랙리스트에 등록되었습니다.</p>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary" onclick="location.href='/salmon/admin/articleManage'">확인</button>
           </div>

         </div>
       </div>
  </div>
  </body>
</html>
