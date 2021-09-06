import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
// import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
// const form = document.querySelector("#form");
// const coordinate = document.querySelector(".coordinate");
// const mapBox = (x, y) => {
//   console.log(x);
//   console.log(y);

//   mapboxgl.accessToken = 'pk.eyJ1IjoiY2hpZmVycjExODgiLCJhIjoiY2t0N2ZxZHBmMHJxaTJ3bzdhZjFmd2FleSJ9.HMDI6oPvFYWyUVfATrF1mA';
//   const map = new mapboxgl.Map({
//     container: 'map',
//     style:'mapbox://styles/chiferr1188/cksszxmzq3pra17tcqk43rbnu',
//     center: [x, y],
//     zoom: 12
//   });
//   new mapboxgl.Marker()
//     .setLngLat([x, y])
//     .addTo(map);
// };
// // get the user input
// form.addEventListener("submit", (event) => {
//   event.preventDefault();
//   // console.log(event)
//   fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${coordinate.value}.json?access_token=pk.eyJ1IjoiY2hpZmVycjExODgiLCJhIjoiY2t0N2ZxZHBmMHJxaTJ3bzdhZjFmd2FleSJ9.HMDI6oPvFYWyUVfATrF1mA`)

//     .then(response => response.json())
//     .then((data) => {
//       console.log(data.features[0].geometry.coordinates[0]);
//       const long = (data.features[0].geometry.coordinates[0]);
//       const lat = (data.features[1].geometry.coordinates[1]);
//       mapBox(long, lat);
//       coordinate.innerText = (`${long}, ${lat}`);
//     });
// });

// use the input


const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/chiferr1188/cksszxmzq3pra17tcqk43rbnu'
    // 'mapbox://styles/mapbox/streets-v10'
  });
};
// const addMarkersToMap = (map, markers) => {
//   markers.forEach((marker) => {
//     new mapboxgl.Marker()
//       .setLngLat([ marker.lng, marker.lat ])
//       .addTo(map);
//   });
// };
const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window); // add this

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};


const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //                                   mapboxgl: mapboxgl }));
  }
};


// if (mapElement) { // only build a map if there's a div#map to inject into
//   mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//   const map = new mapboxgl.Map({
  //     container: 'map',
  //     style: 'mapbox://styles/chiferr1188/cksszxmzq3pra17tcqk43rbnu'
  //       fitMapToMarkers(map, markers);


  export { initMapbox };
//     });

//     const markers = JSON.parse(mapElement.dataset.markers);
//     markers.forEach((marker) => {
//       const popup = new mapboxgl.Popup().setHTML(marker.info_window);

//       const element = document.createElement('div');
//       element.className = 'marker';
//       element.style.backgroundImage = `url('${marker.image_url}')`;
//       element.style.backgroundSize = 'contain';
//       element.style.width = '25px';
//       element.style.height = '25px';

//       new mapboxgl.Marker(element)
//       .setLngLat([ marker.lng, marker.lat ])
//       .setPopup(popup)
//       .addTo(map);
//     });

//       map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,mapboxgl: mapboxgl }))
//   }
// };
// export { initMapbox };
