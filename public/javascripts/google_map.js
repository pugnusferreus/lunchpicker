var map = null;
var geocoder = null;

function initMap(id) 
{
    if (GBrowserIsCompatible()) 
    {
        map = new GMap2(document.getElementById(id));
        geocoder = new GClientGeocoder();
        var customUI = map.getDefaultUI();
        customUI.maptypes.hybrid = false;
        map.setUI(customUI);
    }
      
}

function showAddress(id, address)
{
	initMap(id)
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
