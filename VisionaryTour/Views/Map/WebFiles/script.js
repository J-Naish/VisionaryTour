let map;
let marker;
let streetViewService;
let panoId = null;


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
        zoomControl: false,
        rotateControl: false
    });


    // add marker lines of street view coverage
    const streetViewLayer = new google.maps.StreetViewCoverageLayer();
    streetViewLayer.setMap(map);
    
    // initialize the street view service
    streetViewService = new google.maps.StreetViewService();

    // add a click event listener to the map
    map.addListener("click", (e) => {
        const clickedLatLang = e.latLng;
        
        if (marker) {
            marker.setMap(null);
        }
        
        marker = new google.maps.Marker({
            position: clickedLatLang,
            map: map,
            //draggable: true
        });
        
        streetViewService.getPanorama({
            location: clickedLatLang,
            radius: 25
        }, (data, status) => {
            if (status === google.maps.StreetViewStatus.OK) {
                panoId = data.location.pano;
                const lat = data.location.latLng.lat();
                const lng = data.location.latLng.lng();
                const accurateLatLng = {
                    latitude: lat,
                    longitude: lng
                };
                window.webkit.messageHandlers.panoIdChanged.postMessage({
                    panoId: panoId,
                    latLng: accurateLatLng
                });
            } else {
                panoId = null;
                const lat = clickedLatLang.lat();
                const lng = clickedLatLang.lng();
                const accurateLatLng = {
                latitude: lat,
                longitude: lng
                };
                window.webkit.messageHandlers.panoIdChanged.postMessage({
                    panoId: panoId,
                    latLng: accurateLatLng
                });
            }
        });
    });
    
    map.addListener("zoom_changed", () => {
        const currentZoom = map.getZoom();
        window.webkit.messageHandlers.zoomChanged.postMessage(currentZoom)
    });
}

function setLocation(address) {
    const geocoder = new google.maps.Geocoder();
    geocoder.geocode({ address: address }, (results, status) => {
        if (status == "OK") {
            const location = results[0].geometry.location;
            map.setCenter(location);
        } else {
            //console.error("Geocode was not successful for the following reason: " + status);
        }
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
