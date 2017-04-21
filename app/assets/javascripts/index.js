$(document).ready(function(loaded) {
  // if (signedIn === false ) {
  var request = $.ajax({
    url: "/",
    });
    request.done(function(response){
      $("#ajax-content").html(response);
    })
});
