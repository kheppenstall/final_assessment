$( document ).ready(function(){
  searchLinks();
})

function searchLinks() {
  $('#link-search input').keyup(function() {
    var links = $('.links-list .link h3 a');
    var query = $('#link-search input').val().toLowerCase();
    $('.links-list .link').hide();
    showLinks(query, links);
  })
}

function showLinks(query, links) {
  links.each(function() {
    var title = $(this).text()
    var ref = $(this).attr('href')
    if (title.indexOf(query) >= 0 || ref.indexOf(query) >= 0) {
      $(this).parents('.link').show();
    }
  });
}