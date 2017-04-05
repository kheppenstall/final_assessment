// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

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