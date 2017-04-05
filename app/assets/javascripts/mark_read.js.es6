$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markRead)
  $("body").on("click", ".mark-as-unread", markUnread)
})

function markUnread(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.attr('id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false },
  }).then(updateLinkStatusToUnread)
    .fail(displayFailure);
}

function updateLinkStatusToUnread(link) {
  $('#' + link.id + ' .mark-as-unread').remove()
  $('#' + link.id).append(markAsRead())
  $('#' + link.id + ' div').removeClass('true')
  $('#' + link.id + ' div').addClass('false')
}

function markRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.attr('id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $('#' + link.id + ' .mark-as-read').remove()
  $('#' + link.id).append(markAsUnread())
  $('#' + link.id + ' div').removeClass('false')
  $('#' + link.id + ' div').addClass('true')
}

function markAsUnread() {
  return(
    `<div class='mark-as-unread'>
      <a href="/">Mark as unread</a>
    </div>`
  )
}

function markAsRead() {
  return(
    `<div class='mark-as-read'>
      <a href="/">Mark as read</a>
    </div>`
  )
}


function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
