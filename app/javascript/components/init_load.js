const initLoad = () => {
  const element = document.getElementById('load');
  if (element){
    console.log(element.dataset.url)
     $.ajax({
      url: element.dataset.url,
      dataType: "script",
      method: 'GET'
    })
  }
};

export { initLoad };
