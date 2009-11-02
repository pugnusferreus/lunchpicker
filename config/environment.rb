# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

#Google maps key
#GOOGLE_MAP_KEY = 'ABQIAAAAD3guJbG5cT8WfO7vt9ClXhT2yXp_ZAY8_ufC3CFXhHIE1NvwkxSQHgp1aR-x-tXoC8woO7zH5yBT-g' #for localhost
GOOGLE_MAP_KEY = 'ABQIAAAAD3guJbG5cT8WfO7vt9ClXhSIcLphRYVPagdrHN6Zvi0KzoRl1hRfmE4isMNdNN2UF_kQoZQCE8gJ8w'
#all possible values from google weather that needs to go to a place with shelter
NEED_SHELTER_WEATHERS = Array["storm","thunderstorm","snow","rain"]

#weather icon image root path
WEATHER_ICON_ROOT_PATH = "http://www.google.com"

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"
  config.gem 'validatable'
  config.gem "haml", :lib => "haml", :version => ">=2.2.0"
  config.gem "httparty"
  config.gem 'jnunemaker-google-weather', :lib => 'google_weather'
  config.gem "authlogic"

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
  config.active_record.primary_key_prefix_type = :table_name_with_underscore
  config.active_record.schema_format = :sql
end
