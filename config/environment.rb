# Load the rails application
require File.expand_path('../application', __FILE__)

#Google maps key
#GOOGLE_MAP_KEY = 'ABQIAAAAD3guJbG5cT8WfO7vt9ClXhT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSQHgp1aR-x-tXoC8woO7zH5yBT-g' #for localhost
GOOGLE_MAP_KEY = 'ABQIAAAAD3guJbG5cT8WfO7vt9ClXhSIcLphRYVPagdrHN6Zvi0KzoRl1hRfmE4isMNdNN2UF_kQoZQCE8gJ8w'
#all possible values from google weather that needs to go to a place with shelter
NEED_SHELTER_WEATHERS = Array["storm","thunderstorm","snow","rain"]

#weather icon image root path
WEATHER_ICON_ROOT_PATH = "http://www.google.com"
# Initialize the rails application
Lunchpicker::Application.initialize!
