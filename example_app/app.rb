require 'sinatra'
$LOAD_PATH << "../lib"
require 'flattr'


get '/' do
  "hello world"
end
