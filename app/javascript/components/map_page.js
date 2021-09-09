export const initMapPage = () => {
  const map = document.getElementById("map2d");
  if (map) {
    mapboxgl.accessToken = 'pk.eyJ1IjoicGhlbmVsYWdheWxlIiwiYSI6ImNrczBnMXJkNzFqdWQydW44YjYwbG9jdGMifQ.fQ6FI93dU-T3w9JY2BjHbA';
          const map2d = new mapboxgl.Map({
            container: 'map2d',
            style: 'mapbox://styles/phenelagayle/ckta4p24v3kq917pcf7rgjedf',
            center: [-1.8156194686889646, 53.367480740224586],
            zoom: 15,
          });
          map2d.addControl(
            new mapboxgl.GeolocateControl({
              positionOptions: {
              enableHighAccuracy: true
                },
              trackUserLocation: true,
              showUserHeading: true
                })
            );
          map2d.on('load', () => {
            map2d.addSource('route', {
              'type': 'geojson',
              'data': {
                'type': 'Feature',
                'properties': {},
                'geometry': {
                  'type': 'LineString',
                  'coordinates': [
                [
                  -1.817260980606079,
                  53.36451025411531
                ],
                [
                  -1.8159842491149902,
                  53.36480475121083
                ],
                [
                  -1.816263198852539,
                  53.36523368899098
                ],
                [
                  -1.8163812160491941,
                  53.36568823028403
                ],
                [
                  -1.8165099620819092,
                  53.36621318743304
                ],
                [
                  -1.8165850639343262,
                  53.366546083737
                ],
                [
                  -1.8165099620819092,
                  53.36683416497747
                ],
                [
                  -1.8162739276885986,
                  53.36703902156331
                ],
                [
                  -1.8157696723937988,
                  53.36726308232617
                ],
                [
                  -1.8155872821807861,
                  53.36757036374187
                ],
                [
                  -1.8154156208038328,
                  53.367941659162106
                ],
                [
                  -1.8154156208038328,
                  53.36832575446737
                ],
                [
                  -1.8155336380004883,
                  53.36869704330397
                ],
                [
                  -1.8157267570495605,
                  53.36901711728997
                ],
                [
                  -1.8158340454101562,
                  53.36949082237588
                ],
                [
                  -1.8160808086395264,
                  53.36988770636527
                ],
                [
                  -1.8165099620819092,
                  53.370220573956786
                ],
                [
                  -1.816906929016113,
                  53.37052143281119
                ],
                [
                  -1.8172717094421387,
                  53.37082869072463
                ],
                [
                  -1.8172931671142578,
                  53.371116743005615
                ],
                [
                  -1.8175935745239256,
                  53.37125116673678
                ],
                [
                  -1.8179047107696535,
                  53.37161602901163
                ],
                [
                  -1.818108558654785,
                  53.37192968004807
                ]
              ]
                }
              }
            });
            map2d.addLayer({
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

            map2d.addSource("mapbox-dem", {
              type: "raster-dem",
              url: "mapbox://mapbox.mapbox-terrain-dem-v1",
              tileSize: 512,
              maxZoom: 16
            });
            map2d.setTerrain({ source: "mapbox-dem" });

            map2d.addLayer({
              id: 'hillshading',
              source: 'mapbox-dem',
              type: 'hillshade',
              paint: {
                'hillshade-exaggeration': 0.5,
                'hillshade-illumination-anchor': 'map'
              }
            });

            const marker = new mapboxgl.Marker()
              .setLngLat([-1.817374775658692, 53.364507286303024])
              .addTo(map2d);
          });
  }
}
