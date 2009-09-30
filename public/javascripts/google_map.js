var map = null;
var geocoder = null;

function initMap(address,map_canvas_id) 
{
    if (GBrowserIsCompatible()) 
    {
        map = new GMap2(document.getElementById(map_canvas_id));
        geocoder = new GClientGeocoder();
        var customUI = map.getDefaultUI();
        customUI.maptypes.hybrid = false;
        map.setUI(customUI);
    }
      
    showAddress(address);
    
}

function showAddress(address) 
{
    if (geocoder) 
    {
        geocoder.getLatLng(address,
            function(point) 
            {
                if (point) 
                {
                    map.setCenter(point, 13);
                    var marker = new GMarker(point);
                    map.addOverlay(marker);
                    marker.openInfoWindowHtml(address);
                }
            }
        );
    }
}
