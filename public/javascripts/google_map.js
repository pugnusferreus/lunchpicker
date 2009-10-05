var maps = new Object();
var geocoder = null;

function getMap(id)
{
	
	if (GBrowserIsCompatible() && !maps[id])
	{
		
		var map = new GMap2(document.getElementById(id));
		
		var customUI = map.getDefaultUI();
		customUI.maptypes.hybrid = false;
		map.setUI(customUI);
		
		maps[id] = map;
		
	}
	
	return maps[id];
	
}

function showPoint(id, point, text)
{
	var map = getMap(id);
	map.setCenter(point, 13);
	var marker = new GMarker(point);
	map.addOverlay(marker);
	if (text)
	{
		marker.openInfoWindowHtml(text);
	}
}

function showAddress(id, address)
{
	
	if (!geocoder)
	{
		geocoder = new GClientGeocoder();
	}
	
	geocoder.getLatLng(address, function(point)
	{
		showPoint(id, point, address);
	});
	
}
