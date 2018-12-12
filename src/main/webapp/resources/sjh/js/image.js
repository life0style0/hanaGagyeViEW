function uploadFiles(fileObject) {
    let files = fileObject;

    if (files) {
        for (let i = 0; i < files.length; i += 1) {
            const fileName = files[i].name;
            const fileSize = files[i].size;

            if (!checkUploadFile(fileName, fileSize)) {} else {
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

function inputFileEvent() {
    $("#inputFile").trigger("click");
}

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
            e.stopPropagation();
            e.preventDefault();
            $(this).toggleClass('drag-on');
            return false;
        },
        dragleave: function (e) {
            e.stopPropagation();
            e.preventDefault();
            $(this).toggleClass('drag-on');
            return false;
        },
        dragover: function (e) {
            e.stopPropagation();
            e.preventDefault();
            return false;
        },
        drop: function (e) {
            e.preventDefault();
            $(this).toggleClass('drag-on');

            var file = e.originalEvent.dataTransfer.files;
            setCroppie(file);
            return false;
        }
    });

    $("#inputFile").on("change", function () {
        var file = document.querySelector('#inputFile').files;
        setCroppie(file);
    });
});

function setCroppie(file) {
    if (checkUploadFile(file[0].name, file[0].size)) {
        const reader = new FileReader();
        reader.onload = function (e) {
            // const img = `<img id="userImage" src="${e.target.result}" />`;
            // $('.modal-image').append(img);
            const myCroppie = $('.modal-image');
            myCroppie.croppie('destroy');

            myCroppie.croppie({
                viewport: {
                    width: 300,
                    height: 300
                },
                boundary: {
                    width: 500,
                    height: 500
                }
            });
            $('.user-image').one('shown.bs.modal', function () {
                myCroppie.croppie('bind', {
                    url: e.target.result,
                    zoom: true
                });
            });

            $('#uploadImage').one('click', function () {
                $('.user-image').modal('hide');

                myCroppie.croppie('result', {
                    type: 'base64',
                    size: 'viewport'
                }).then(function (base64) {
                    const html = `<div class="croppie-result" style="height: 300px;"><img src="${base64}"></div>`;
                    $('.dropzone').before(html).remove();
                });
            });
            $('.user-image').modal('show');
        }
        reader.readAsDataURL(file[0]);
    }
}

/**
 * Convert a base64 string in a Blob according to the data and contentType.
 * 
 * @param b64Data {String} Pure base64 string without contentType
 * @param contentType {String} the content type of the file i.e (image/jpeg - image/png - text/plain)
 * @param sliceSize {Int} SliceSize to process the byteCharacters
 * @see http://stackoverflow.com/questions/16245767/creating-a-blob-from-a-base64-string-in-javascript
 * @return Blob
 */
function b64toBlob(b64Data, contentType, sliceSize) {
    contentType = contentType || '';
    sliceSize = sliceSize || 512;

    var byteCharacters = atob(b64Data);
    var byteArrays = [];

    for (var offset = 0; offset < byteCharacters.length; offset += sliceSize) {
        var slice = byteCharacters.slice(offset, offset + sliceSize);

        var byteNumbers = new Array(slice.length);
        for (var i = 0; i < slice.length; i++) {
            byteNumbers[i] = slice.charCodeAt(i);
        }

        var byteArray = new Uint8Array(byteNumbers);

        byteArrays.push(byteArray);
    }

    var blob = new Blob(byteArrays, {
        type: contentType
    });
    return blob;
}

function checkUploadFile(fileName, fileSize, fileRegexSrc, maxUploadSizeSrc) {
    const fileRegex = fileRegexSrc || new RegExp('(.*?)\.(jpg|JPG|jpeg|JPEG|png|PNG|gif)$');
    const maxUploadSize = maxUploadSizeSrc || 524280; // 5MB
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