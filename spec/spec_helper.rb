require "rspec"
require "capybara/rspec"
require "csv"

require_relative "../server"

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before(:suite) do
    CSV.open('favorites_list.csv', 'w') { |file| file.puts(["favorite"]) }
  end

  config.after(:each) do
    CSV.open('favorites_list.csv', 'w') { |file| file.puts(["favorite"]) }
  end
end
