import swal from 'sweetalert';

const formatDate = (date) => date.toLocaleDateString('en-GB', {
  day : 'numeric',
  month : 'short',
  year : 'numeric',
  hour: '2-digit',
  minute: '2-digit'
});

const getHTML = (info) =>{
   const html = document.createElement("div");

    html.innerHTML = `
      <p>E-ticket: ${info.number}</p>
      <p>${info.origin} <i class="fas fa-plane fa-xs"></i> ${info.destination}</p>
      <p>${formatDate(new Date(info.departure_time))} - ${formatDate( new Date(info.arrival_time))} </p>
    `;
    return html;
}


const display = (e) => {
  console.log(e.currentTarget.dataset.url)
  swal({
    title: "Did you miss your flight?",
    content: getHTML(JSON.parse(e.currentTarget.dataset.info)),
    icon: "warning",
    buttons: ["No", "Yes"],
  }).then((value) => {
    if (value) {
      window.location = e.target.parentElement.dataset.url
    }
  });
};

const initSweetalert = () =>{
  const  swalButtons = document.querySelectorAll('.cancel-flight')
  if (swalButtons.length > 0){
    Array.from(swalButtons).forEach(swalButton => {
      swalButton.addEventListener('click',display);
    });
  };
};

export { initSweetalert };
