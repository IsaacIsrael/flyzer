const initGetHour = () => {
  const element = document.getElementById("home")
  if (element) {
    const date = new Date();
    const greeting = document.getElementById("greeting");
    const hour = (date.getHours());
    if (hour >= 0 && hour < 12) {
      greeting.innerHTML = "Good morning,";
    } else if (hour >= 18 && hour <= 24) {
      greeting.innerHTML = "Good evening,";
    } else {
      greeting.innerHTML = "Good afternoon,";
    }
  }
}

export { initGetHour };
