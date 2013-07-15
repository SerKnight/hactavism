//= require namespace
//= require controls/social
//= require controls/disqus
hacktavism.Views.show = (function () {

  var init = function (url) {

    disqus(); 
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
    $(".charity").html('<a href="http://google.com/search?q=' + data.objects[0].Charity_Name + '" target="_blank">' + data.objects[0].Charity_Name + '</a>' + "<br/><br/>" + '<a href="http://google.com/search?q=' + data.objects[1].Charity_Name + '" target="_blank">' + data.objects[1].Charity_Name + '</a>')
  };


  var disqus = function() {
      var disqus_shortname = 'serknight';
      var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
      dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
      (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
  };

  return {
    initialize: init
  }

}());




