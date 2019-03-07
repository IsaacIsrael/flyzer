function readURL(input) {

  if (input.files && input.files[0]) {
    const reader = new FileReader();

    reader.onload = function(e) {
      $('#user_profile').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

function initReadUrl(){
  var element = $("#user_photo");
  if (element){
    element.change(function() {
      readURL(this);
    });
  }
}

export { initReadUrl };
