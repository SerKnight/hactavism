$(function() {

  $("#facebook-share").on("click",function(event) {
    event.preventDefault();
    console.log("facebook sharing");
    var facebook_url = $(this).attr('href');
    var page_url = location.href
    window.open(facebook_url,'facebook-share-box','width=626,height=336');
  });

  $("#twitter-share").on("click",function(event) {
    event.preventDefault();
    var twitter_url = $(this).attr('href');
    var page_url = location.href
    var twitter_handle = ' via @Nomadic_Knight';
    window.open('http://twitter.com/share?text='+encodeURIComponent(page_url)+twitter_handle,'twitter-share-box','toolbar=0,status=0,width=626,height=436'); 
    return false;
  });
});



// http://www.reddit.com/submit?title=**SETUP+URL+ENCODED**&text=**PUNCHLINE+URL+ENCODED**+%0D**permalink+to+joke**