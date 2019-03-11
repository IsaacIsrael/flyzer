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
  if (hour >= 0 && hour < 12) {
    greeting.innerHTML = "Good morning,";
    console.log("Manha")
  } else if (hour >= 18 && hour <= 24) {
    greeting.innerHTML = "Good evening,";
    console.log("noite")
  } else {
    greeting.innerHTML = "Good afternoon,";
    console.log("tarde")
  }
}

export { initGetHour };
