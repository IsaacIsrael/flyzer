function readURL(input) {

  if (input.files && input.files[0]) {
    const reader = new FileReader();

    reader.onload = function(e) {
      $('#image').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

function initReadUrl(){
  var element = $("#flight_photo");
  if (element){
    element.change(function() {
      readURL(this);
    });
  }
}

export { initReadUrl };
