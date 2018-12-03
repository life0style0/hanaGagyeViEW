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

function abc(e) {
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