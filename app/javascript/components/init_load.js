const initLoad = () => {
  const element = document.getElementById('load');
  if (element){
     $.ajax({url: element.dataset.url, dataType: "script"})
  }
};

export { initLoad };
