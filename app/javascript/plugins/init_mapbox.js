import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const addPopUps = (marker) => {
  const popup = new mapboxgl.Popup()
                            .setHTML(`<a href ="${marker.home_link}">
                                        <h6>${marker.home_title} - R$${marker.home_price}</h6>
                                        <p>${marker.home_address}</p>
                                        <img src="${marker.home_photo}" alt="No photos" style="width:200px;height:200px;">
                                      </a>`);
  return popup;
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    console.log(marker)
    if (marker.home) {
      const popup = addPopUps(marker) // <-- added this
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // <-- added this
        .addTo(map);
      map.flyTo({ center: [ marker.lng, marker.lat ] });
    } else{
      new mapboxgl.Marker({color: 'red'})
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
      map.flyTo({ center: [ marker.lng, marker.lat ] });
    }
  });
};

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    zoom: 12,
    center: [-46.741735, -23.55762]
  });
};

const initMapbox = () => {

  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
  }
};

export { initMapbox };

// const AddSearchMarker = (map, marker) => {
//   new mapboxgl.Marker()
//       .setLngLat([ marker.lng, marker.lat ])
//       .addTo(map);
//   map.flyTo({ center: [ marker.lng, marker.lat ] });
// };

// const initSearchForm = (map) => {
//   console.log('initSearchForm')
//   if (document.getElementById('search-form')) {
//       const searchForm = document.getElementById('search-form');

//       searchForm.addEventListener('submit', (event) => {
//         event.preventDefault();
//         const location = document.getElementById('location').value;
//         const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${location}.json?access_token=${mapElement.dataset.mapboxApiKey}`;
//         const marker = {};
//         fetch(url)
//           .then(response => response.json())
//           .then((data) => {
//             marker.lat = data.features[0].center[1]
//             marker.lng = data.features[0].center[0]
//             AddSearchMarker(map, marker);
//           })
//       });
//    }
//   };


// const fitMapToMarkers = (map, markers) => {
//   const bounds = new mapboxgl.LngLatBounds();
//   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
//   map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
// };
