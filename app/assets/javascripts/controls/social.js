$(function() {
  $("#facebook-share").on("click",function(event) {
    event.preventDefault();
    console.log("facebook sharing");
    var url = $(this).attr('href');
    alert(url)
    var page_url = location.href
    window.open(url+encodeURIComponent(location.href),'facebook-share-box','width=626,height=336');
  });

  $("#twitter-share").on("click",function(event) {
    event.preventDefault();
    var twitter_url = $(this).attr('href');
    var page_url = location.href
    alert(page_url)
    var twitter_handle = ' via @Nomadic_Knight';
    alert(encodeURIComponent(page_url))
    window.open('http://twitter.com/share?text='+encodeURIComponent(page_url)+twitter_handle,'twitter-share-box','toolbar=0,status=0,width=626,height=436'); 
    return false;
  });
});

