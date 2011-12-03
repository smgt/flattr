require 'sinatra'
$:.unshift File.expand_path('../../lib', __FILE__)
#require 'flattr'
require 'haml'


get '/' do
  haml :index
end

get '/callback' do
end
