import 'select2';


const initSelect2Ticket = () =>{
  const element = document.getElementById('ticket');
  if (element) {
    $('.select2.places').select2({
      theme: "bootstrap",
      placeholder: "Aeroport"
    });
     $('.select2.companies').select2({
       theme: "bootstrap"
     });
  }
}

const initSelect2Search = () => {
  const element = document.getElementById('search');
  if(element){
    const search =  $('.select2');
    search.select2({
      theme: "bootstrap",
      placeholder: "where are we traveling"
    });
    search.on("change", function (e) {
      $(this).closest('form').submit();
    });
  }
};


const initSelect2 = () => {
  initSelect2Search();
  initSelect2Ticket();
};

export { initSelect2 };
