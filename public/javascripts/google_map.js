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


$(function()
{
	var address_field = $('#venue_address');
	if (address_field)
	{
		
		var btn = $('<button></button>').insertAfter(address_field);
		var map_div = map_div = $('<div id="venue_address_map" class="map_canvas" style="display: none"></div>').insertAfter(btn);
		
		function resetMap()
		{
			btn.attr('disabled', 'disabled');
			map_div.hide('slow', function()
			{
				btn.html('View');
				btn.removeAttr('disabled');
			});
		}
		
		function mapLoaded(map, point)
		{
			showPoint(map_div.attr('id'), point)
			map_div.show('slow', function()
			{
				map.checkResize();
				showPoint(map_div.attr('id'), point, address_field.val());
				btn.html('Hide');
				btn.removeAttr('disabled');
			});
		}
		
		function loadMap()
		{
			
			btn.attr('disabled', 'disabled');
			
			if (!geocoder)
			{
				geocoder = new GClientGeocoder();
			}
			geocoder.getLatLng(address_field.val(), function(point)
			{
				var map = getMap(map_div.attr('id'));
				mapLoaded(map, point);
			});
			
		}
		
		btn.click(function(e)
		{
			e.preventDefault();
			
			if (btn.html() == 'View')
			{
				loadMap();
			}
			else
			{
				resetMap();
			}
		});
		
		address_field.keypress(resetMap);
		resetMap();
		
	}
	
});
