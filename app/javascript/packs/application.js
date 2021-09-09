// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// CSS

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initMapbox } from '../packs/init_mapbox';
import { initShowMap } from '../components/map';
import  { weather } from '../components/weather';
import { initMapPage } from '../components/map_page';

// Internal imports, e.g:
// import { initWeather } from '..//init_Weather';

import "controllers"

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initWeather();
  initMapbox();
  initShowMap();
  weather();
  initMapPage();
});
