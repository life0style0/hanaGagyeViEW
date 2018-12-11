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
 	<!-- bootstrap-progressbar -->
    <link href="/salmon/resources/adminTemplate/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="/salmon/resources/adminTemplate/build/css/custom.css" rel="stylesheet">
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
                <img src="/salmon/resources/adminTemplate/images/favicon.png" alt="hana" class="img-circle profile_img">
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
                    <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>
				<!--푸쉬알람  -->
                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="/salmon/resources/adminTemplate/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="/salmon/resources/adminTemplate/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="/salmon/resources/adminTemplate/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="/salmon/resources/adminTemplate/images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <div class="right_col" role="main">
			<div class="clearfix"></div>
			<div class="clearfix"></div>
			<div class="row">
              	<div class="col-md-12 col-sm-12 col-xs-12">
                	<div class="x_panel">
	                  <div class="x_title">
	                    <h3>역제안 관리 <small>역제안 관리 기능</small></h3>
	                    <ul class="nav navbar-right panel_toolbox">
	                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
	                      </li>
	                      <li><a class="close-link"><i class="fa fa-close"></i></a>
	                      </li>
	                    </ul>
	                    <div class="clearfix"></div>
	                  </div>

                  <div class="x_content">

                    <p>역제안 <code>등록상태 를</code> 관리 해주세요</p>
                      <div class="progress">
                        <div class="progress-bar progress-bar-danger" data-transitiongoal="25"></div>
                      </div>

                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action" id="procRegist">
                        <thead>
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="check-all" class="flat">
                            </th>
                            <th class="column-title">게시글 번호 </th>
                            <th class="column-title">게시글 제목 </th>
                            <th class="column-title">작성일 </th>
                            <th class="column-title">게시글 작성자 </th>
                            <th class="column-title">참여자 수</th>
                            <th class="column-title no-link last"><span class="nobr">제안글 상세내역</span>
                            </th>
                            <th class="bulk-actions" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">제안글 내역 ( <span class="action-cnt"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                         <c:forEach var="propR" items="${propRList}">
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records">
                            </td>
                            <td class="articleId">${propR.article_id }</td>
                            <td class=" ">${propR.article_title }</td>
                            <td class=" ">${propR.article_editdate }<i class="success fa fa-long-arrow-up"></i></td>
                            <td class=" ">${propR.user_id }</td>
                            <td class=" ">${propR.article_like_num }</td>
                            <td class=" last"><a href="javascript:getModal('${propR.article_id }');">보기</a>
                            </td>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                       <button class="btn btn-success" style="float:right;" id="propRBtn">심사 등록</button>		
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="clearfix"></div>
          <div class="clearfix"></div>
          <div class="row">
              	<div class="col-md-12 col-sm-12 col-xs-12">
               		<div class="x_panel">
                  	<div class="x_content">

                    <p>역제안 <code>심사상태 를</code> 관리 해주세요</p>
					<div class="progress">
                        <div class="progress-bar progress-bar-warning" data-transitiongoal="45"></div>
                     </div>
                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action2" id="procJudge">
                        <thead>
                          <tr class="headings">
                            <th>
                              <input type="checkbox" id="check-all" class="flat">
                            </th>
                            <th class="column-title2">게시글 번호 </th>
                            <th class="column-title2">게시글 제목 </th>
                            <th class="column-title2">작성일 </th>
                            <th class="column-title2">게시글 작성자 </th>
                            <th class="column-title2">참여자 수</th>
                            <th class="column-title2 no-link last"><span class="nobr">제안글 상세내역</span>
                            </th>
                            <th class="bulk-actions2" colspan="7">
                              <a class="antoo" style="color:#fff; font-weight:500;">Bulk Actions ( <span class="action-cnt2"> </span> ) <i class="fa fa-chevron-down"></i></a>
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                          <c:forEach var="propJ" items="${propJList}">
                          <tr class="even pointer">
                            <td class="a-center ">
                              <input type="checkbox" class="flat" name="table_records2">
                            </td>
                            <td class="articleId">${propJ.article_id }</td>
                            <td class=" ">${propJ.article_title }</td>
                            <td class=" ">${propJ.article_editdate }<i class="success fa fa-long-arrow-up"></i></td>
                            <td class=" ">${propJ.user_id }</td>
                            <td class=" ">${propJ.article_like_num }</td>
                            <td class=" last"><a href="javascript:getModal('${propJ.article_id }');">보기</a>
                            </td>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                       <button class="btn btn-success" style="float:right;" id="propJBtn">확정 등록</button>		
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
              	<div class="col-md-12 col-sm-12 col-xs-12">
               		<div class="x_panel">
                  	<div class="x_content">

                    <p>역제안 <code>확정상태 를</code> 관리 해주세요</p>
					<div class="progress">
                        <div class="progress-bar progress-bar-info" data-transitiongoal="65"></div>
                      </div>
                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action3" id="procConfirm">
                        <thead>
                          <tr class="headings">
                            <th class="column-title3">게시글 번호 </th>
                            <th class="column-title3">게시글 제목 </th>
                            <th class="column-title3">작성일 </th>
                            <th class="column-title3">게시글 작성자 </th>
                            <th class="column-title3">참여자 수</th>
                            <th class="column-title3 no-link last"><span class="nobr">제안글 상세내역</span>
                            <th class="column-title3 no-link last"><span class="nobr">개발 결과 등록</span>
                            </th>
                          </tr>
                        </thead>

                        <tbody>
                         <c:forEach var="propC" items="${propCList}">
                          <tr class="even pointer">
                            <td class="articleId">${propC.article_id }</td>
                            <td class=" ">${propC.article_title }</td>
                            <td class=" ">${propC.article_editdate }<i class="success fa fa-long-arrow-up"></i></td>
                            <td class=" ">${propC.user_id }</td>
                            <td class=" ">${propC.article_like_num }</td>
                            <td class=" last"><a href="javascript:getModal('${propC.article_id }');">보기</a>
                            <td class=" ">
                             <button class="btn btn-primary" style="float:right;" id="propCImposibleBtn" onclick="javascript:propSuccess(${propC.article_id})">개발 상태 등록</button>
                            </td>
                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>	
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
    <!-- bootstrap-progressbar -->
    <script src="/salmon/resources/adminTemplate/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- NProgress -->
    <script src="/salmon/resources/adminTemplate/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="/salmon/resources/adminTemplate/vendors/iCheck/icheck.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="/salmon/resources/adminTemplate/build/js/custom.js"></script>
	<script>
	function getModal(article_id){
		$.ajax({
	        async: false,
	        url: "/salmon/admin/propShow?article_id="+article_id,
	        method: 'get',
	        dataType: 'json',
	        success: function (datas) {
	        	console.log(datas.length);
	        	var tagSet = ""; 
				var content ="";
	            for(var idx = 0; idx<datas.length; idx++){
	            	if(datas[idx].ctgry_name!="none"){
	            		tagSet += "<a href='' class='tag'><span>"+datas[idx].ctgry_name+"</span></a><br>";
	            	}
	            	content = datas[idx].article_content;
	            }
	        	document.getElementById("ctgryTarget").innerHTML = tagSet;
	        	document.getElementById("contentTarget").innerText = content;
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
	$("#propRBtn").on("click", function(){
		var target = $("#procRegist tr:has(:checked) .articleId");
		console.log("target:" + target);
		var targetIdSet = {};
		var temp = [];
		for(var i = 0; i <target.length; i++){	
			temp.push(target[i].innerText);
		}	
		targetIdSet["article_id"] = temp;
		console.log(targetIdSet);
		
		jQuery.ajaxSettings.traditional = true;
		 
		$.ajax({
	        url: "/salmon/admin/propProc",
	        data : {"article_id":temp, "procType":"J"},
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
	
	$("#propJBtn").on("click", function(){
		var target = $("#procJudge tr:has(:checked) .articleId");
		console.log("target:" + target);
		var targetIdSet = {};
		var temp = [];
		for(var i = 0; i <target.length; i++){	
			temp.push(target[i].innerText);
		}	
		targetIdSet["article_id"] = temp;
		console.log(targetIdSet);
		
		jQuery.ajaxSettings.traditional = true;
		 
		$.ajax({
	        url: "/salmon/admin/propProc",
	        data : {"article_id":temp, "procType":"C"},
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
	
	
		

	
	function propSuccess(articleId){
		$("#procResult_artiId").val(articleId);
		$("#procResultModal").modal({
        	keyboard:false,
        	show:true,
        	backdrop:true
        });
	}

	function resultSend(){
		var article_id = $("#procResult_artiId").val();
		var result_type = $("input[name='resultType']:checked").val();
		var result_value = $("#resultTextArea").val();
		var typeValue;
		if(result_type=="finish"){
			typeValue="F"
		}else{
			typeValue="I"
		}
		
		jQuery.ajaxSettings.traditional = true;
		 
		$.ajax({
	        url: "/salmon/admin/propResultProc",
	        data : {"article_id":article_id, "procType":typeValue, "result_value":result_value },
	        method: 'get',
	        cache:false,
	        success: function (datas) {
	        	$("#procResultModal").modal('hide');
   				$("#resultModal").modal({
	            	keyboard:false,
	            	show:true,
	            	backdrop:true
	            });
	        }
	    });  
	}
	
	
	</script>
	 <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" id="InfoModal">
       <div class="modal-dialog modal-lg">
         <div class="modal-content">

           <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
             </button>
             <h4 class="modal-title" id="myModalLabel">게시글 신고 내역</h4>
           </div>
           <div class="modal-body" id="myModalBody">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>제안글 상세보기 <small>해당 제안글의 상세내용입니다.</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
    				<ul class="list-unstyled timeline">
                    <li>
                      <div class="block">
                        <div class="tags" id="ctgryTarget">
                          
                        </div>
                        
                        <div class="block_content">
                          <h2 class="title" >제안글 내용</h2>
                          <p class="excerpt" id="contentTarget"></p>
                        </div>
                      </div>
                    </li>
					</ul>
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
             <h4>역제안 설정 성공</h4>
             <p>선택하신 설정이 제안에 적용되었습니다.</p>
           </div>
           <div class="modal-footer">
             <button type="button" class="btn btn-primary" onclick="location.href='/salmon/admin/suggestionManage'">확인</button>
           </div>

         </div>
       </div>
  </div>
	
	<!-- 메시지 모달 -->
	 <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" id="procResultModal">
       <div class="modal-dialog modal-lg">
         <div class="modal-content">

           <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
             </button>
             <h4 class="modal-title" id="myModalLabel">게시글 신고 내역</h4>
           </div>
           <div class="modal-body" id="myModalBody">
                <div class="x_panel">
                  <div class="x_title">
                    <h3>제안 결과 보내기 <small>해당 제안의 최종 결과를 전달합니다.</small> </h3>
                    
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  <input type="hidden" name="procResult_artiId" id="procResult_artiId">
                  <div id="gender" class="btn-group" data-toggle="buttons">
                            <label class="btn btn-primary" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                              <input type="radio" name="resultType" value="finish"> 개발완료
                            </label>
                            <label class="btn btn-danger" data-toggle-class="btn-primary" data-toggle-passive-class="btn-default">
                              <input type="radio" name="resultType" value="imposible"> 개발 실패
                            </label>
                  </div>
                  <br><br>
    				<div class="col-md-12 col-sm-12 col-xs-15">
                      <textarea rows='10' class="resizable_textarea form-control" placeholder="결과를 입력해주세요" id="resultTextArea"></textarea>
                    </div>
                  </div>
                </div>
           </div>
           <div class="modal-footer">
           	 <button type="button" class="btn btn-success" onclick="javascript:resultSend();">등록</button>
             <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
           </div>
         </div>
       </div>
     </div>
	

  </body>
</html>
