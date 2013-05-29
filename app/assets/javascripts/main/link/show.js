//= require namespace

hacktavism.Views.show = (function () {

  var init = function (api_id, api_key) {

    console.log(api_key);
    console.log(api_id);

    $.ajax({
      type: "GET",
      dataType: "json",
      url: "http://api.charitynavigator.org/api/v1/search/?app_key="+api_key+"&app_id="+api_id+"&field=value"
      }).done(function(data) {
        renderCause(data);
        renderZip(data);
        console.log(data)
      });

  }

  var renderCause = function (data) {
    $(".charity").text(data.objects[0].Cause)
  };

  var renderZip = function (data) {
    var zip = data.objects[0].ZIP;
    $(".zip").text(data.objects[0].ZIP);
  };

  return {
    initialize: init
  }

}());
