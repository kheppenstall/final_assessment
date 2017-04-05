$(document).ready(function() {
  bindSubmitListenerAndPostLink();
})

function postLink() {
  var linkData = {
    link: {
      title: $('#link_title').val(),
      url: $('#link_url').val(),
    }
  }

  $.ajax({
    url: '/links',
    method: 'POST',
    data: linkData,
  })
  .done(function(newLinkMarkup){
    $('.alert').remove()
    $(".links-list").prepend(newLinkMarkup);
    $("#link_title").val("");
    $("#link_url").val("");
  })
}

function bindSubmitListenerAndPostLink() {
  $("#link-submit").on('click', function(event) {
    event.preventDefault();
    postLink();
   });
}