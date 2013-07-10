<script>
  $(function() {
    $("#facebook-share").on("click",function(event) {
      event.preventDefault();
      console.log("facebook sharing");
      var url = $(this).attr('href');
      window.open(url,'facebook-share-dialog','width=626,height=436');
    });
  });
</script>