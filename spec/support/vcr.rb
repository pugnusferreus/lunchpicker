VCR.config do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.stub_with :webmock
  c.default_cassette_options = { :record => :new_episodes }
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end
