import 'select2';


const initSelect2Ticket = () =>{
  const element = document.getElementById('ticket');
  if (element) {

    $('.select2.places').select2({
      theme: "bootstrap",
      placeholder: "Aeroport"
    });

  }
}

const initSelect2Search = () => {
  const element = document.getElementById('search');
  if(element){
    const select =  $('.select2');
    select.select2({
      theme: "bootstrap",
      placeholder: "where are we traveling"
    });
   select.on("change", function (e) {
      $(this).closest('form').submit();
  });
  }
};



const initSelect2 = () => {
  initSelect2Search();
  initSelect2Ticket();
};

export { initSelect2 };
