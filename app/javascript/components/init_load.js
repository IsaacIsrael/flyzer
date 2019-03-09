const initLoad = () => {
  const element = document.getElementById('load');
  if (element){
     $.ajax({
      url: element.dataset.url,
      dataType: "script",
      method: 'GET'
    })
  }
};

export { initLoad };
