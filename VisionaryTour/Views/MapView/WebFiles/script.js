let map;
let marker;

function initMap() {

    // initial position; where Apple HQ is
    const center = { lat: 37.3346, lng: -122.0090 };


    // create map
    map = new google.maps.Map(document.getElementById("map"), {
        center: center,
        zoom: 10,
        fullscreenControl: false,
        streetViewControl: false,
        clickableIcons: false,
        mapTypeControl: false,
        zoomControl: false
    });


    // add marker lines of street view coverage
    const streetViewLayer = new google.maps.StreetViewCoverageLayer();
    streetViewLayer.setMap(map);

    // add a click event listener to the map
    map.addListener("click", (e) => {
        const clickedLatLang = e.latLng;
        const latitude = clickedLatLang.lat();
        const longitude = clickedLatLang.lng();
        
        if (marker) {
            marker.setMap(null);
        }
        
        marker = new google.maps.Marker({
            position: clickedLatLang,
            map: map,
            draggable: true
        })
    });
    
    map.addListener("zoom_changed", () => {
        const currentZoom = map.getZoom();
        window.webkit.messageHandlers.zoomChanged.postMessage(currentZoom)
    })

}

function setLocation(address) {
    const geocoder = new google.maps.Geocoder();
    geocoder.geocode({ address: address }, (results, status) => {
        if (status == "OK") {
            const location = results[0].geometry.location;
            map.setCenter(location);
        } else {
            console.error("Geocode was not successful for the following reason: " + status);
        }
    });
}

// load the map
function loadScript() {
    const script = document.createElement("script");
    script.src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyCvNpWrz0mA6MU_NgB7n-WzgD4LU3izPn8&callback=initMap";
    script.defer = true;
    script.async = true;
    document.head.appendChild(script);
}


// load the map when the window loads
window.onload = loadScript;
