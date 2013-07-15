$(function() {
  $("#reddit-share").on("click",function(event) {
    event.preventDefault();
    var reddit_url = $(this).attr('href');
    var page_url = location.href
    var tagline = "Hacktivism: Online Documentaries for Action"
    window.open(reddit_url+encodeURIComponent(page_url)+"&title="+encodeURIComponent(tagline),'twitter-share-box','toolbar=0,status=0,width=1200,height=536'); 
    return false;
  });
});
