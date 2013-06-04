//= require namespace
hacktavism.Views.show = (function () {

  var init = function (url) {

    console.log(url);

    $.ajax({
      type: "GET",
      dataType: "json",
      url: url
      }).done(function(data) {
        renderCause(data);
        renderNames(data);
        console.log(data)
      });
  }

  var renderCause = function (data) {
    $(".cause").html('<a href="http://google.com/search?q=' + data.objects[0].Cause + '" target="_blank">' + data.objects[0].Cause + '</a>')
  };



  var renderNames = function (data) {
    var names = data.objects[0].Charity_Name;
    $(".charity").html('<a href="http://google.com/search?q=' + data.objects[0].Charity_Name + '" target="_blank">' + data.objects[0].Charity_Name + '</a>')
  };

  return {
    initialize: init
  }

}());




