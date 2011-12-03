require 'sinatra'
$:.unshift File.expand_path('../../lib', __FILE__)
require 'flattr'
require 'haml'

layout :default
set :session, :enable

before do
  puts " -- #{request.request_method.upcase} #{request.path_info} --"
  @flattr_client = Flattr.new
end
get '/' do
  puts " this is cheap logging"
  haml :index
end

get '/callback' do
  puts "hejhopp i callback #{params.inspect}"
  redirect '/tests'
end

get '/open_calls' do
  @user = @flattr_client.user('smgt')
  haml :open_calls
end

get '/tests' do
  haml :tests
end
