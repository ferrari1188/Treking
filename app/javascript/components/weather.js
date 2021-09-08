const weather = () => {
  const data = document.querySelector(".weather-card").dataset;
  const key = data.key;
  console.log(key);
  const url = `https://api.openweathermap.org/data/2.5/weather?lat=${data.latitude}&lon=${data.longitude}&appid=${key}&unit=metric`;
  const coordsLocation = document.getElementById("weather");
  const date = document.getElementById("date");
  const description = document.getElementById("description");
  const heading = document.getElementById("heading");
  const wind = document.getElementById("wind");
  const humidity = document.getElementById("umidity");
  const icon = document.getElementById("icon");
  const sun = document.getElementById("sun");

  fetch(url)
  .then(response => response.json())
  .then((data) =>{
    console.log(data);
    coordsLocation.innerText = data.name;
    const today = new Date();
    const localOffset = data.timezone + today.getTimezoneOffset() * 60;
    const localDate = new Date(today.setUTCSeconds(localOffset));
    const options = { weekday: 'long', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric'};
    const formattedDate = localDate.toLocaleDateString('en-US', options);
    date.innerText = formattedDate;
    description.innerText = data.weather[0].description;
    heading.innerText = `${Math.round(data.main.temp)/10}°C`;
    icon.src = `http://openweathermap.org/img/wn/${data.weather[0].icon}.png`;
    wind.innerText = data.wind.speed;
    humidity.innerText = data.main.humidity;
    const unixTimestamp = data.sys.sunrise * 1000;
    const milliseconds = new Date(unixTimestamp);
    const sunrise = milliseconds.toLocaleString("en-US", {hour: "numeric", minute: "numeric"})

    const uniTimestamp = data.sys.sunset * 1000;
    const millisecond = new Date(uniTimestamp);
    const sunset= millisecond.toLocaleString("en-US", {hour: "numeric", minute: "numeric"})
    sun.innerText = `${sunrise} - ${sunset}`

    });

};
export {weather};

//   // use by coordinates
//   // in the  controller take the route
//   //  expose in the view of show page the coordinates
//   // js collect the coordinates and put in variables
//   // request to openWeather (input coordiantes)
//   //  read the anwer and select the elements needed
//   // display in the html pg
