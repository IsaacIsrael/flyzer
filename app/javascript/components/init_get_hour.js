const addZero = (i) => {
  if (i < 10) {
    i = "0" + i;
  }
  return i;
}

const initGetHour = () => {
  const date = new Date();
  const greeting = document.getElementById("greeting");
  const hour = (date.getHours());
  console.log(hour);
  if (0 > hour > 12) {
    greeting.innerHTML = "Good morning,";
  } else if (18 > hour > 23) {
    greeting.innerHTML = "Good evening,";
  } else {
    greeting.innerHTML = "Good afternoon,";
  }
}

export { initGetHour };
