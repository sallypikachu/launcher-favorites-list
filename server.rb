require "sinatra"
require 'csv'
require 'pry'

set :views, File.join(File.dirname(__FILE__), "app/views")

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe",
  expire_after: 86400
}

# To access erb files
set :views, File.join(File.dirname(__FILE__), "app/views")

get '/favorites-list' do
  @sites = []

  CSV.foreach('favorites_list.csv', headers: true, header_converters: :symbol) do |row|
    site = row.to_hash
    @sites << site
  end
  erb :index
end

get '/' do
  redirect '/favorites-list'
end

post '/favorites-list' do
  list = params[:url]
  unless list == nil || list == ""
    CSV.open('favorites_list.csv', 'a') do |file|
      file << [list]
    end
  end
  redirect '/favorites-list'
end
