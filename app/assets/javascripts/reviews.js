$(function() {
  var photoDropzone = new Dropzone("#photo-dropzone");
  Dropzone.options.photoDropzone = false;
  photoDropzone.options.acceptedFiles = ".jpeg,.jpg,.png,.gif";
  photoDropzone.on("complete", function(files) {
    var _this = this;
    if (_this.getUploadingFiles().length === 0 && _this.getQueuedFiles().length === 0) {
      setTimeout(function(){
        $('#myModal').modal('hide');
        var acceptedFiles = _this.getAcceptedFiles();
        var rejectedFiles = _this.getRejectedFiles();

        for(var index = 0; index < acceptedFiles.length; index++) {
          var file = acceptedFiles[index];
          var response = JSON.parse(file.xhr.response);
          appendContent(response.file_name.url, response.id);
        }

        if(acceptedFiles.length != 0) {
          alertify.success('Uploaded ' + acceptedFiles.length + ' files successfully.');
        }
        if(rejectedFiles.length != 0) {
          alertify.error('Error uploading ' + rejectedFiles.length + ' files. Only image files are accepted.');
        }

        _this.removeAllFiles();

      }, 2000);
    }
  });
});

var appendContent = function(imageUrl, photoId) {
  $("#photos").append('<div class="col-xs-12 col-md-offset-6 col-md-6">' +
    '<img src="' + imageUrl + '"/>' +
    '<div class="caption">' +
    '<a rel="nofollow" class="btn btn-lake" data-method="delete" href="/delete_photo?id=' + photoId + '">Delete</a>' +
    '</div></div>');
  $("#no-media").html("");
};