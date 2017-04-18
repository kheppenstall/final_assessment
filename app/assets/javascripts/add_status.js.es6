var api = 'https://pure-cliffs-71275.herokuapp.com'

$(document).ready(function() {
  addStatusToLinks();
})

function addStatusToLinks() {
  var links = $('.link')
  for(var i=0; i < links.length; i++) {
    addStatus($(links[i]))
  }
}

function addStatus($link) {
  var url = $link.find('a').attr('href')

  $.get({
    url: api + '/api/v1/links/status_by_url',
    data: {url: url}
  }).then(function(data) {
    if (data.status != 'not hot') {
      $link.find('h3').append('<h5>'+ data.status +'</h5>')
    }
  })
}

function statusHTML(status) {
  "<h3>Status!!!!</h3>"
}