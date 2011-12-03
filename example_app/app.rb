require 'sinatra'
$:.unshift File.expand_path('../../lib', __FILE__)
require 'flattr'
require 'haml'

require 'yaml'
local_config = YAML.load_file './local_config.yml'

layout :default
set :session, :enable

before do
  puts " -- #{request.request_method.upcase} #{request.path_info} --"
  @flattr_client = Flattr.new(
    :client_id    => local_config['client_id'],
    :cient_secret => local_config['client_secret']
  )
end
get '/' do
  haml :index
end

get '/callback' do
  puts "callback params: #{params.inspect}"
  # @todo @flattr_client.get_access_token params["code"]
  redirect '/tests'
end

get '/open_calls' do
  @user = @flattr_client.user('smgt')
  haml :open_calls
end

get '/tests' do
  haml :tests
end
