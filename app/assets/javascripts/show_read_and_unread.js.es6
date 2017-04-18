$(document).ready(function() {
  showRead();
  showUnread();
})

function showRead() {
  $('#show-read a').on('click', function(event) {
    event.preventDefault();
    hideLinks();
    showReadLinks();
   });
}

function showReadLinks() {
  $('.true').parents('.link').show();
}

function showUnread() {
  $('#show-unread a').on('click', function(event) {
    event.preventDefault();
    hideLinks();
    showUnreadLinks();
   });
}

function showUnreadLinks() {
  $('.false').parents('.link').show();
}

function hideLinks() {
  $('.links-list .link').hide();
}