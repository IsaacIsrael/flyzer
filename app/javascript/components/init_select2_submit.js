const initSelect2Submit = () => {
  const element = document.getElementById('search');
  if(element){
     $('.select2-selection').on('keyup', function (e) {
      if (e.keyCode === 13) {
        $(this).closest('form').submit();
      }
    });
  }
};

export {initSelect2Submit};
