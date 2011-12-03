require 'sinatra'
$:.unshift File.expand_path('../../lib', __FILE__)
require 'flattr'
require 'haml'

layout :default
session :enable

before do
  puts "request: #{request.method.upcase} #{request.path}"
  @flattr_client = Flattr.new
end
get '/' do
  puts " this is cheap loggin"
  haml :index
end

get '/callback' do
  puts "hejhopp i callback #{params.inspect}"
  redirect '/tests'
end

get '/open_calls' do
  @user = @flattr.users('simon_g')
  haml :open_calls
end

get '/tests' do
  haml :tests
end
