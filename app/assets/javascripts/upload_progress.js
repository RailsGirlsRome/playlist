ns('MyPlaylist.UploadProgress', function(n) {

  function upload(form, callbacks) {

    var url  = form.attr('action');
    var csrf = form.find('input[name="authenticity_token"]').val();
    var data = new FormData(form.get(0));
    var xhr  = new XMLHttpRequest();

    xhr.onloadstart = callbacks.started;
    xhr.onload      = callbacks.complete;

    xhr.upload.onprogress = function(e) {
      if(e.lengthComputable) {
        callbacks.progress((e.loaded / e.total) * 100);
      }
    }

    xhr.open('POST', url, true);
    xhr.setRequestHeader('X-CSRF-Token', csrf);
    xhr.send(data);
  }

  function createProgress(parent) {
    var progress = $('<div></div>');
    var bar      = $('<div></div>');

    progress.addClass('progress');
    progress.addClass('progress-striped');
    progress.addClass('progress-danger');
    progress.addClass('active');

    bar.addClass('bar');

    progress.append(bar);
    parent.append(progress);

    return bar;
  }

  function initUploadProgress(element) {
    var form = element.parents('form');
    form.submit(function(e) {
      var bar    = createProgress(element);
      var button = form.find('button[type="submit"]');
      upload(form, {
        started: function() {
          button.html("Uploading...");
          button.prop("disabled", true);
        },
        progress: function(percent) {
          console.log(percent);
          bar.css({ width: percent + '%' });
        },
        complete: function() {
          window.location.reload(true);
        }
      });
      return false;
    });
  }

  $(window).ready(function() {
    initUploadProgress($('.upload-progress'));
  });
});
