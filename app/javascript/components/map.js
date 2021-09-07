 export const initShowMap = () => {
  const map = document.getElementById("map3d");
  if (map) {
    const coords3d = JSON.parse(document.getElementById("map3d").dataset.coords)
    // console.log(coords);
    mapboxgl.accessToken = 'pk.eyJ1IjoicGhlbmVsYWdheWxlIiwiYSI6ImNrczBnMXJkNzFqdWQydW44YjYwbG9jdGMifQ.fQ6FI93dU-T3w9JY2BjHbA';
    const map3d = new mapboxgl.Map({
      container: 'map3d',
      style: 'mapbox://styles/phenelagayle/ckta4p24v3kq917pcf7rgjedf',
      center: coords3d[16],
      zoom: 12,
      interactive: true
    });
    map3d.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: true
      })
    );
    map3d.on('load', () => {
      map3d.addSource('route', {
        'type': 'geojson',
        'data': {
          'type': 'Feature',
          'properties': {},
          'geometry': {
            'type': 'LineString',
            'coordinates': coords3d
          }
        }
      });
      map3d.addLayer({
        'id': 'route',
        'type': 'line',
        'source': 'route',
        'layout': {
          'line-join': 'round',
          'line-cap': 'round'
        },
        'paint': {
          'line-color': '#0058CA',
          'line-width': 2,
          'line-opacity': 0.65,
          'line-gap-width': 1
        }
      });

      map3d.addSource("mapbox-dem", {
        type: "raster-dem",
        url: "mapbox://mapbox.mapbox-terrain-dem-v1",
        tileSize: 512,
        maxZoom: 16
      });
      map3d.setTerrain({ source: "mapbox-dem" });

      map3d.addLayer({
        id: 'hillshading',
        source: 'mapbox-dem',
        type: 'hillshade',
        paint: {
          'hillshade-exaggeration': 0.5,
          'hillshade-illumination-anchor': 'map'
        }
      });
      map3d.addLayer({
        id: "sky",
        type: "sky",
        paint: {
          "sky-type": "atmosphere",
          "sky-atmosphere-sun": [0.0, 90.0],
          "sky-atmosphere-sun-intensity": 15
        }
      });
      const marker = new mapboxgl.Marker()
        .setLngLat(coords3d[0])
        .addTo(map3d);
    });


  map3d.on('click', ({ point }) => {
    // If the user clicked on one of your markers, get its information.
    const features = map3d.queryRenderedFeatures(point, {
      layers: ['trek-notifications'] // replace with your layer name
    });
    if (!features.length) {
      return;
    }
    const feature = features[0];

  const popup = new mapboxgl.Popup({ offset: [0, -15] })
  .setLngLat(feature.geometry.coordinates)
  .setHTML(
    `<p>${feature.properties.Description}</p>`
    )
  .addTo(map3d);
    });
   }
  }
