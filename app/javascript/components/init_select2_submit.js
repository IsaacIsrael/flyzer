const initSelect2Submit = () => {
  const element = document.getElementById('search');
  if(element){
     $('.select2').on("change", function (e) {
        $(this).closest('form').submit();
    });
  }
};

export {initSelect2Submit};
