$(document).ready(function(loaded) {
  // if (signedIn === false ) {
  var request = $.ajax({
    url: "/",
    });
    request.done(function(response){
      console.log(response)
      // var content = JSON.parse(response);
      $("#ajax-content").html(response);
    })
});
