require 'sinatra'
$:.unshift File.expand_path('../../lib', __FILE__)
#require 'flattr'
require 'haml'

layout :default

get '/' do
  haml :index
end

get '/callback' do
end
