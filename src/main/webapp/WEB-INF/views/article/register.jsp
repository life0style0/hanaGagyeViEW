<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<form method="post" action="/salmon/article/submit">
				<div class="col-xs-12 col-md-9 _editor-content_">
					<div class="sec"  data-sec="gagyeInfo">
						<div class="be-large-post">
							<div class="info-block style-2">
								<div class="be-large-post-align"><h3 class="info-block-label">가계부 정보 <span style="float:right;"><input class="btn btn-success" type="submit" value="등 록"><input class="btn btn-danger" type="reset" value="초기화"></span></h3></div>
							</div>
							<div class="be-large-post-align">
								<div class="row">
									<div class="input-col col-xs-12 col-sm-4">
										<div class="form-group focus-2">
											<div class="form-label">금액</div>									
											<input class="form-input" name="article_payment_fee"  type="text" placeholder="">
										</div>								
									</div>
									<div class="input-col col-xs-12 col-sm-4" >
										<div class="form-label">카테고리</div>
										<div class="be-drop-down icon-none">
											<span name="article_category" class="be-dropdown-content">선택해주세요 </span>
											<ul class="drop-down-list" style="overflow:scroll; height:200px">
											<c:forEach var="catList" items="${categoryList}">
												<li><a>${catList}</a></li>
											</c:forEach>
											</ul>
										</div>							
									</div>
									<div class="input-col col-xs-12 col-sm-4">
										<div class="form-label">결제수단</div>
										<div class="be-drop-down icon-none">
											<span class="be-dropdown-content">선택 </span>
											<ul class="drop-down-list">
												<li><a>카드</a></li>
												<li><a>현금</a></li>
												<li><a>사채</a></li>
												<li><a>담보</a></li>
											</ul>
										</div>								
									</div>													
								</div>
							</div>
							<div class="be-large-post-align">
								<div class="row">
									<div class="col-md-12">
										<div class="col-md-6">
											<div class="form-label">공개범위</div>
											<div class="be-drop-down icon-none">
												<span class="be-dropdown-content" name="article_scope">private </span>
												<ul class="drop-down-list" >
													<li><a>private</a></li>
													<li><a>public</a></li>
												</ul>
											</div>	
										</div>
										<div class="col-md-6">
											<div class="form-label">날짜 선택</div>
											<div class='input-group date' id='datetimepicker1'>
												<input type='text' class="form-control " name="article_regdate" value="${searchStartDay}" /> <span class="input-group-addon">
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
											<input class="form-input" name="article_title" type="text">
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
									  <input type="file" name="article_photo" id="inputFile" style="display:none;">
									  <div class="row upload-image-preview"></div>
									  <div class="row text-center">
									    <button id="upload" class="btn btn-defualt">Upload</button>
									    <button id="cancel" class="btn btn-defualt">Cancel</button>
									  </div>
									
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
									<textarea name="article_content" class="form-input" placeholder="여러분의 합리적인 소비생활을 소개해주세요"></textarea>
								</div>						
							</div>
						</div>																
					</div>				
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	<!-- THE FOOTER -->
	<%@ include file="../includes/footer.jsp"%>

	<!-- 이미지 업로드 자바스크립트 -->
	<script>
    let fileCnt = 0;
    let fileList = [];
    let totalFileSize = 0;
    const fileRegex = new RegExp('(.*?)\.(jpg|jpeg|png|gif)$');
    const maxUploadSize = 524280; // 5MB

    $(function () {
      $(document).on({
        dragover: function (e) {
          e.preventDefault();
          return false;
        },
        drop: function (e) {
          e.preventDefault();
          return false;
        }
      });

      const dropzone = $("#filesUpload");
      dropzone.on({
        dragenter: function (e) {
          console.log('dragenter');
          e.stopPropagation();
          e.preventDefault();
          $(this).toggleClass('drag-on');
          return false;
        },
        dragleave: function (e) {
          console.log('dragleave');
          e.stopPropagation();
          e.preventDefault();
          $(this).toggleClass('drag-on');
          return false;
        },
        dragover: function (e) {
          console.log('dragover');
          e.stopPropagation();
          e.preventDefault();
          return false;
        },
        drop: function (e) {
          console.log('drop');
          e.preventDefault();
          $(this).toggleClass('drag-on');

          var files = e.originalEvent.dataTransfer.files;
          if (files.length < 1) {
            return;
          }
          uploadFiles(files);
          // F_FileMultiUpload(files, obj);
          return false;
        }
      });

      $('.upload-image-preview').on('click', '.close', function (e) {
        const fileNameT = $(this).next().val();
        const fileSizeT = $(this).next().next().val();
        fileList.some((file, index) => {
          if (file.name === fileNameT && file.size == fileSizeT) {
            fileList.splice(index, 1);
            fileCnt -= 1;
            totalFileSize -= file.size;
            $(this).closest('.col-md-3').remove();
            return true;
          }
          return false;
        })
      });

      $('#cancel').on('click', function () {
        fileList = [];
        fileCnt = 0;
        totalFileSize = 0;
        $('.upload-image-preview').html('');
      });

      $('.upload-image-preview').on('click', '.thumbnail-image', function() {
        $('.image-modal').find('.upload-image').attr('src', $(this).attr('src'));
        $('.image-modal').modal('show');
      })
    });

    function makePreview(file) {
      if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
          const img = '<div class="col-xs-3 col-md-3"><div class="thumbnail">'+
          '<img class="img-responsive thumbnail-image" src="'+e.target.result+'" />'+
          '<div class="caption">'+
          '<p>file name : '+file.name + '</p>'+
          '<p>file size : '+file.size + '</p>'+
          '<p><span class="invisible">.</span>' +
          '<button type="button" class="close">삭제</button>' +
          '<input type="hidden" name="fileName" value="'+file.name +'">' +
          '<input type="hidden" name="fileSize" value="'+file.size+'">' +
          '</p></div></div></div>';
          $('.upload-image-preview').append(img);
        }
        reader.readAsDataURL(file);
      }
    }

    function checkUploadFile(fileName, fileSize) {
      if (!fileRegex.test(fileName)) {
        alert('해당 종류의 파일은 업로드 할 수 없습니다.');
        return false;
      }
      if (fileSize > maxUploadSize) {
        alert("용량 초과\n업로드 가능 용량 : " + maxUploadSize + " MB");
        return false;
      }
      return true;
    }

    function uploadFiles(fileObject) {
      let files = fileObject;
		console.log("hi");
      if (files) {
        for (let i = 0; i < files.length; i += 1) {
        	console.log("file");
          const fileName = files[i].name;
          const fileSize = files[i].size;
          console.log(fileName);
          console.log(fileSize);
          if (!checkUploadFile(fileName, fileSize)) {
          } else {
            totalFileSize += fileSize;
            fileList[fileCnt] = files[i];
            fileCnt += 1;

            // Preview image 생성
            makePreview(files[i]);
          }
        }
      } else {
        alert("등록하고자 하는 파일이 없습니다.");
      }
    }

    $('#upload').on('click', function (event) {
      if (fileList.length <= 0) {
        alert('업로드할 파일이 없습니다.');
      } else {
        var formData = new FormData();
        for (let i = 0; i < fileList.length; i += 1) {
          const file = fileList[i];
          formData.append('uploadFile', file);
        }

        $.ajax({
          url: '/spring/upload/uploadAjaxAction',
          processData: false,
          contentType: false,
          data: formData,
          type: 'post',
          success: function (result) {
            alert("uploaded");
          }
        });
      }
    })
	
    function addInfo(){
    	$("#snsInfo").attr('style','display:block');
    	$("#addInfoBtn").attr('disabled','disabled');
    }
    
    function inputFileEvent(){
    	$("#inputFile").trigger("click");
    }
  </script>
  <!-- 끝 -->

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
		<!-- date picker test -->
	<script type="text/javascript">
	$(function () {
	   setDatetimepickerSetting();
	   $("#inputFile").on("change", function(){
		   var inputTypeFile = document.querySelector('input[type=file]').files;
		   uploadFiles(inputTypeFile);
	   });
	});
	
	function setDatetimepickerSetting() {
	    $('#datetimepicker1').datetimepicker({
	        locale: 'ko',
	        format: 'YYYY-MM-DD',
	        icons: {
	            next: "fa fa-chevron-right",
	            previous: "fa fa-chevron-left",
	        },
	        defaultDate: 'now'
	    });
	}
	
	
	</script>
	
	
	</body>
</html>