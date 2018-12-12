<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<title>HANA 가계ViEW</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="shortcut icon" href="/salmon/resources/template/img/favicon.png">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="/salmon/resources/template/style/icon.css">
		<link rel="stylesheet" href="/salmon/resources/template/style/loader.css">
		<link rel="stylesheet" href="/salmon/resources/template/style/idangerous.swiper.css">
		<link rel="stylesheet" href="/salmon/resources/template/style/jquery-ui.css">
		<link rel="stylesheet" href="/salmon/resources/template/style/stylesheet.css">
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<!-- 이미지 드래그 앤 드롭 관련 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<!--[if lt IE 10]>
			<link rel="stylesheet" type="text/css" href="style/ie-9.css" />
		<![endif]-->		
		<!--[if lt IE 9]>
		    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
		<!-- 이미지업로드 CSS -->
		 <style>
    .dropzone {
      border: 2px dotted #3292A2;
      width: 40rem;
      height: 20rem;
      line-height: 20rem;
      color: #92AAB0;
      text-align: center;
      font-size: 24px;
      margin: 10px auto;
      vertical-align: middle;
    }

    .dropzone.drag-on {
      border: 2px solid #5272A0;
      background-color: gainsboro;
    }

    img.preview {
      width: 20%;
      height: auto;
    }

    .caption p {
      word-break: break-all;
    }
  </style>
	  <!-- 이미지업로드 CSS -->   
	
	</head>
	<body data-spy="scroll" data-target=".be-dropdown-content">

	<!-- THE LOADER -->

	<div class="be-loader">
    	<div class="spinner">
			<img src="/salmon/resources/template/img/logo-loader.png"  alt="">
			<p class="circle">
			  <span class="ouro">
			    <span class="left"><span class="anim"></span></span>
			    <span class="right"><span class="anim"></span></span>
			  </span>
			</p>
		</div>
    </div>
	<!-- THE HEADER -->
		<!-- THE HEADER -->
	<%@ include file="../includes/header.jsp"%>
		
	<!-- MAIN CONTENT -->
	<div id="content-block">
		<div class="container be-detail-container">
			<div class="row">
				<div class="col-xs-12 col-md-3 left-feild">
					<div class="be-vidget back-block">
						<a class="btn full color-1 size-1 hover-1" href="author.html"><i class="fa fa-chevron-left"></i>나의 가계ViEW로 돌아가기</a>
					</div>
				</div>
				<form name="articleForm" id="articleForm" method="post" action="/salmon/article/update">
				<input type="hidden" name="article_id" value="${editArticle.article_id}">
				<div class="col-xs-12 col-md-9 _editor-content_">
					<div class="sec"  data-sec="gagyeInfo">
						<div class="be-large-post">
							<div class="info-block style-2">
								<div class="be-large-post-align"><h3 class="info-block-label">가계부 정보</h3><span style="float:right;color:red;" id="infoSpot"></span></div>
							</div>
							<div class="be-large-post-align">
								<div class="row">
									<div class="input-col col-xs-12 col-sm-4">
										<div class="form-group focus-2">
											<div class="form-label">금액</div>									
											<input class="form-input" name="article_payment_fee" id="article_payment_fee"  type="text" placeholder="" value="${editArticle.article_payment_fee }">
										</div>								
									</div>
									<div class="input-col col-xs-12 col-sm-4" >
										<div class="form-label">카테고리</div>
										<div class="be-drop-down icon-none">
											<span class="be-dropdown-content" id="selCategory">${ctgryName }</span>
											<input type="hidden" name="categoryName" id="inputCategory">
											<ul class="drop-down-list" style="overflow:scroll; height:200px">
											<c:forEach var="catList" items="${categoryList}">
												<c:choose>
													<c:when test="${catList=='none' }">
													</c:when>
													<c:otherwise>
													<li><a>${catList}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											</ul>
										</div>							
									</div>
									<div class="input-col col-xs-12 col-sm-4">
										<div class="form-label">결제수단</div>
										<div class="be-drop-down icon-none">
											<span class="be-dropdown-content" id="selPayType">${editArticle.article_payment_type }</span>
											<input type="hidden" name="article_payment_type" id="inputPayType">
											<ul class="drop-down-list">
												<li><a>카드</a></li>
												<li><a>현금</a></li>
											</ul>
										</div>								
									</div>													
								</div>
							</div>
							<div class="be-large-post-align">
								<div class="row">
									<div class="col-md-12">
										<div class="col-md-4">
											<div class="form-label">구분</div>
											<div class="be-drop-down icon-none">
												<span class="be-dropdown-content" id="selArtiCategory">
												<c:if test="${editArticle.article_ctgry_id=='1'}">수입 </c:if>
												<c:if test="${editArticle.article_ctgry_id=='2'}">지출 </c:if>
												</span>
												<input type="hidden" name="article_ctgry_name" id="inputArtiCategory">
												<ul class="drop-down-list" >
													<li><a>지출</a></li>
													<li><a>수입</a></li>
												</ul>
											</div>	
										</div>
										<div class="col-md-4">
											<div class="form-label">공개범위</div>
											<div class="be-drop-down icon-none">
												<span class="be-dropdown-content" id="selScope">
													<c:if test="${editArticle.article_scope=='u'}">public</c:if>
													<c:if test="${editArticle.article_scope=='r'}">private</c:if>
												</span>
												<input type="hidden" name="article_scope" id="inputScope">
												<ul class="drop-down-list" >
													<li><a>private</a></li>
													<li><a>public</a></li>
												</ul>
											</div>	
										</div>
										<div class="col-md-4">
											<div class="form-label">날짜 선택</div>
											<div class='input-group date' id='datetimepicker1'>
												<input type='text' class="form-control " name="article_regdate" value="${editArticle.article_regdate}" /> <span class="input-group-addon">
													<span class="fa fa-calendar"></span>
												</span>
											</div>
										</div>
									</div>	
								</div>
							</div>
							<div class="be-large-post-align" style="padding:20px">
								<div class="row">
									<div class="input-col col-xs-12">
										<div class="form-group focus-2">
											<div class="form-label">간단 메모</div>									
											<input class="form-input" name="article_title" type="text" value="${editArticle.article_title }">
										</div>								
									</div>	
								</div>
							</div>
						</div>
					</div>
					<a id="addInfoBtn" class="btn full color-1 size-1 hover-1" href="javascript:addInfo();"><i class="fa fa-plus"></i>SNS정보 올리기</a>
					<div class="sec"  data-sec="basic-information" id="snsInfo" style="display:none;">
						<div class="be-large-post">
							<div class="info-block style-2">
								<div class="be-large-post-align "><h3 class="info-block-label">SNS정보</h3></div>
							</div>
							<div class="be-large-post-align">
								<div class="be-change-ava">
									<!-- 이미지 업로드 시작 -->
									  <div id="filesUpload" class="dropzone"><a href="javascript:inputFileEvent()">Drag & Drop Files Here</a></button></div>
									  <input type="file" name="inputF" id="inputFile" multiple="multiple" style="display:none;">
									  <div class="row upload-image-preview"></div>
									
									<div class="modal fade image-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
									  <div class="modal-dialog modal-lg">
									    <div class="modal-content">
									      <img class="img-responsive upload-image">
									    </div>
									  </div>
									</div>
									<!-- 이미지 업로드 끝 -->
								</div>
							</div>
							<div class="be-large-post-align">
								<div class="form-group focus-2">
									<div class="form-label">내용</div>
									<textarea name="article_content" class="form-input" placeholder="여러분의 합리적인 소비생활을 소개해주세요">${editArticle.article_content}</textarea>
								</div>						
							</div>
						</div>																
					</div>				
				</div>
				 <span style="float:right;"><input class="btn btn-success" type="button" id="submitBtn" value="등 록"><input class="btn btn-danger" type="reset" value="초기화"></span>
				</form>
			</div>
		</div>
	</div>
	
	<form name="imgForm" id="imgForm"></form>
	
	
	<!-- THE FOOTER -->
	<%@ include file="../includes/footer.jsp"%>
	<!--  로그아웃 팝업 -->
	<%@ include file="/WEB-INF/views/includes/logout.jsp"%>
	<!--  로그아웃 팝업 끝-->

	<!-- SCRIPTS	 -->
	<script src="/salmon/resources/template/script/jquery-2.1.4.min.js"></script>
	<script src="/salmon/resources/template/script/jquery-ui.min.js"></script>
	<script src="/salmon/resources/template/script/bootstrap.min.js"></script>		
	<script src="/salmon/resources/template/script/idangerous.swiper.min.js"></script>
	<script src="/salmon/resources/template/script/jquery.mixitup.js"></script>
	<script src="/salmon/resources/template/script/jquery.viewportchecker.min.js"></script>
	<script src="/salmon/resources/template/script/filters.js"></script>
	<script src="/salmon/resources/template/script/global.js"></script>
	
	<!-- datepicker -->
	<link rel="stylesheet" href="/salmon/resources/hjh/css/bootstrap-datetimepicker.css">
	<script type='text/javascript' src="/salmon/resources/hjh/js/moment-with-locales.min.js"></script>
	<script type='text/javascript' src="/salmon/resources/hjh/js/bootstrap-datetimepicker.js"></script>
	<script type='text/javascript' src="/salmon/resources/hjh/js/articleEdit.js"></script>

	
	<script type="text/javascript">
	
	$(function () {
		   setDatetimepickerSetting();
		   $("#inputFile").on("change", function(){
			   var inputTypeFile = document.querySelector('input[type=file]').files;
			   uploadFiles(inputTypeFile);
		   });
		   $("#submitBtn").on("click", function(){
			   if($("#article_payment_fee").val() == ""){
				   $("#article_payment_fee").focus();
				   $("#infoSpot").text("금액을 입력해주세요");
				   return false;
			   }
			   if($("#selCategory").text()!="선택해주세요"){
				   $("#inputCategory").val($("#selCategory").text()); 
			   }else{
				   $("#selCategory").focus();
				   $("#infoSpot").text("카테고리를 선택해주세요");
				   return false;
			   }
			   if($("#selScope").text() != "선택해주세요"){
				   $("#inputScope").val($("#selScope").text());
			   }else{
				   $("#selScope").focus();
				   $("#infoSpot").text("공개범위를 선택해주세요");
				   return false;
			   }		   
			   if($("#selPayType").text() != "선택해주세요"){
				   $("#inputPayType").val($("#selPayType").text());
			   }else{
				   $("#selPayType").focus(); 
				   $("#infoSpot").text("결제수단을 선택해주세요");
				   return false;
			   }
			   if($("#selArtiCategory").text() != "선택해주세요"){
				   $("#inputArtiCategory").val($("#selArtiCategory").text());
			   }else{
				   $("#selArtiCategory").focus();
				   $("#infoSpot").text("구분을 선택해주세요");
				   return false;
			   }
			   
			   var articleForm = $("#articleForm").serialize();
			   $.ajax({
				   	  cache : false,
			          url: '/salmon/article/update?_csrf=${_csrf.token}',
			          data: articleForm,
			          type: 'post',
			          success: function (articleId) {
			        	  if(parseInt(articleId) > 0){
				            	if(!imgUpload(articleId)){
				            		$("#resultModal").modal({
				    		        	keyboard:false,
				    		        	show:true,
				    		        	backdrop:true
				    		        });
				            	}
				            }
			          },
			          error: function (xhr,status,er) {
			  			alert('게시글 등록 실패');
			          }
			    });
			   
		   })
		});
	
	function imgUpload(articleId) {
		  var formData = new FormData();
		  if (fileList.length <= 0) {
		    return false;
		  } else {
		    for (var i = 0; i < fileList.length; i += 1) {
		      var file = fileList[i];
		      formData.append("uploadFile",fileList[i]);
		    }
		    $.ajax({
		      url: '/salmon/article/imageUpload?_csrf=${_csrf.token}&articleId='+articleId,
		      processData: false,
		      contentType: false,
		      cache:false,
		      enctype:'multipart/form-data',
		      data:  formData,
		      type: 'post',
		      success: function (result) {
		        $("#resultModal").modal({
		        	keyboard:false,
		        	show:true,
		        	backdrop:true
		        });
		      }
		    });
		  }
		};

	</script>
	<!-- 성공시 모달 -->
	<div class="modal fade bs-example-modal-sm" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" data-backdrop="static">
  		<div class="modal-dialog modal-sm">
    		<div class="modal-content">
      			<div class="modal-header">
          			<h4 class="modal-title" id="gridSystemModalLabel">게시글 작성 결과</h4>
        		</div>
        		<div class="modal-body">
        		 	<h5>게시글 수정이 완료되었습니다.</h5>
        		 	<div>
        		 		메인으로
        		 		 <button type="button" class="btn btn-default" aria-label="Left Align" onclick="location.href='/salmon'" value="홈으로">
  							<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
						</button>
        		 	</div>
        		</div>
    		</div>
  		</div>
	</div>
	<script>
		 <c:if test="${articlePathList.size()>0}">
		 <c:forEach var="path" items="${articlePathList}">
		 function blobToFile(blob,filename){
		     return new File([blob], filename, {type: blob.type, lastModified: Date.now()});
		}
		  $(function () {
		      $.ajax({
		        url: '/salmon/main/image?fileName=${path}',
		        method: 'get',
		        cache: false,
		        xhr: function () { // Seems like the only way to get access to the xhr object
		            var xhr = new XMLHttpRequest();
		            xhr.responseType = 'image/png'
		            return xhr;
		          },
		          success: function (data) {
		        	var blob = new Blob([data], {type: 'image/png'});
		        	var curFilePath = '${path}'.split("_")[1];
		        	var file = blobToFile(blob, '${path}');
		        	var tempFile = {};
		        	tempFile[0]= file;
		        	tempFile['length']=1; 
		        	uploadFilesBefore(tempFile,curFilePath);
		          },

		        error: function () {

		        }
		      });
		});  
		</c:forEach>
		</c:if>
	</script>
	
	</body>
</html>