$(document).on('turbolinks:load', function(){
  $('#datetimepicker1').datetimepicker({
   });
  x = navigator.geolocation;
  x.getCurrentPosition(success, failure)
    function success(position) {
      var mylat = position.coords.latitude;
      var mylong = position.coords.longitude;
      $('#lat').val(mylat);
      $('#long').val(mylong);
    }

    function failure () {
      $('#input').html("it didnt work");
    }
  goin()
  callto()
});


var goin = function(){
  $("#coco").on("click",function(e){
    var className = $('#navcol-1').attr('class')
    if (className.includes('in')) {
      $('#navcol-1').removeClass('in');
    } else {
      $('#navcol-1').addClass('in');
    }

  })
}

var callto = function() {
  if ($('body').attr('id') === "showpage"){
    $('#CallToAction').hide()
  }
}
