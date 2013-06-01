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
        renderZip(data);
        renderNames(data);
        console.log(data)
      });
  }

  var renderCause = function (data) {
    $(".cause").text(data.objects[0].Cause)
  };

  var renderZip = function (data) {
    var zip = data.objects[0].ZIP;
    $(".zip").text(data.objects[0].ZIP);
  };

  var renderNames = function (data) {
    var names = data.objects[0].Charity_Name;
    $(".charity").text(data.objects[0].Charity_Name);
  };

  return {
    initialize: init
  }

}());

