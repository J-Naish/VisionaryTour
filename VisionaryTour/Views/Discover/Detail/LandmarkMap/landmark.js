let map;
let marker;

function initMap(latitude, longitude) {

    // coordinates of the landmark
    const center = { lat: latitude, lng: longitude };

    // create map
    map = new google.maps.Map(document.getElementById("map"), {
        center: center,
        zoom: 8,
        fullscreenControl: false,
        streetViewControl: false,
        clickableIcons: false,
        mapTypeControl: false,
        zoomControl: false,
        rotateControl: false,
        gestureHandling: "none"
    });
    
    
    // place marker
    marker = new google.maps.Marker({
        position: center,
        map: map,
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
