let map;
let marker;

function initMap() {

    // initial position; where Apple HQ is
    const center = { lat: 37.3346, lng: -122.0090 };

    // create map
    map = new google.maps.Map(document.getElementById("map"), {
        center: center,
        zoom: 8,
        fullscreenControl: false,
        streetViewControl: false,
        clickableIcons: false,
        mapTypeControl: false,
        zoomControl: false,
        rotateControl: false
    });
}

// load the map
function loadScript() {
    const script = document.createElement("script");
    script.defer = true;
    script.async = true;
    document.head.appendChild(script);
}


// load the map when the window loads
window.onload = loadScript;
