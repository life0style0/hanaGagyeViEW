/**
 * 가계부 글등록
 */

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

function makePreviewBefore(file, curFilePath) {
  console.log('imain')
  if (file) {
    const reader = new FileReader();
    reader.onload = function (e) {
      const img = '<div class="col-xs-3 col-md-3"><div class="thumbnail">'+
      '<img class="img-responsive thumbnail-image" src="/salmon/main/image?fileName='+file.name+'" />'+
      '<div class="caption">'+
      '<p>file name : '+curFilePath + '</p>'+
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

function uploadFilesBefore(fileObject, curFilePath) {
  let files = fileObject;
  console.log(files);
  if (files) {
    for (let i = 0; i < files.length; i += 1) {
      console.log("name바꼇니" + files[i].name);
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
        makePreviewBefore(files[i], curFilePath);
      }
    }
  } else {
    alert("등록하고자 하는 파일이 없습니다.");
  }
  
}


function addInfo(){
	$("#snsInfo").attr('style','display:block');
	$("#addInfoBtn").attr('disabled','disabled');
}

function inputFileEvent(){
	$("#inputFile").trigger("click");
}




//date picker
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


function uploadFiles(fileObject) {
	  console.log(fileObject);
	  let files = fileObject;
	  console.log(files);
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
function makePreview(file) {
	  console.log('imain')
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



