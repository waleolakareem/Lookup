$( document ).ready(function() {
    $('#datetimepicker1').datetimepicker({
    });
    goin()
    $("#input").geocomplete();

  // x = navigator.geolocation;
  // x.getCurrentPosition(success, failure)
  // function success(position) {
  //   var mylat = position.coords.latitude;
  //   var mylong = position.coords.longitude;
  //   $('#place').val(mylat);
  //   $('#input').val(mylong);
  // }

  // function failure () {
  //   $('#input').html("it didnt work");
  // }




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


