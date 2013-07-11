$(document).ready(function(){
  var $docsTable  = $('#documentaries');
  var $docs = $docsTable.find('tr');
  $docs.each(function(i, doc){
    console.log($(doc).data('title'));

  });
});

underscore
var $filteredByTitle = _.sortBy($docs, function (doc){
  return $(doc).data('title');
})

$docsTable.html($filterdByTitle);
