const url = 'https://api.openweathermap.org/data/2.5/weather?lat=51.507407&lon=-0.12772404&appid=ce87e44939fcddffcfcc2152db1a3fbe';
// console.log(test);
const coordsLocation = document.getElementById("#weather");
const date = document.getElementById("#date");
const heading = document.getElementById("#heading");
const description = document.getElementById("#description");
const wind = document.getElementById("#wind");
const umidity = document.getElementById("#umidity");
const uv = document.getElementById("#uv");

fetch(url)
.then(response => response.json())
.then((data) =>{
  console.log(data);
});
//   const coordLocation =document.getElementById("weather");
//   const icon = document.getElementById('icon');
//   const temperature = document.getElementById('temperature');
//   const description = document.getElementById('description');
//   const date = document.getElementById('date');

//   // use by coordinates
//   // in the  controller take the route
//   //  expose in the view of show page the coordinates
//   // js collect the coordinates and put in variables
//   // request to openWeather (input coordiantes)
//   //  read the anwer and select the elements needed
//   // display in the html pg



//   const fetchWeatherByCoordinates = (coordinates) => {
//     fetch(`http://api.openweathermap.org/data/2.5/weather?lat=${coordinates.lat}&lon=${coordinates.lon}&appid=${API_KEY}`)
//     .then(response => response.json())
//     .then(updateCard);
//   };

//   const fetchWeatherByCoordinates = (coordinates) => {
//     fetch(`http://api.openweathermap.org/data/2.5/weather?lat=${coordinates.lat}&lon=${coordinates.lon}&appid=${API_KEY}`)
//     .then(response => response.json())
//     .then(updateCard);
//   };
// export { fetchWeather, fetchCurrentPositionWeather };
