require 'simplecov'
SimpleCov.start
require 'flattr'
require 'rspec'
require 'webmock/rspec'

def a_delete(path, endpoint=Flattr.endpoint)
  a_request(:delete, endpoint + path)
end

def a_get(path, endpoint=Flattr.endpoint)
  a_request(:get, endpoint + path)
end

def a_post(path, endpoint=Flattr.endpoint)
  a_request(:post, endpoint + path)
end

def a_put(path, endpoint=Flattr.endpoint)
  a_request(:put, endpoint + path)
end

def stub_delete(path, endpoint=Flattr.endpoint)
  stub_request(:delete, endpoint + path)
end

def stub_get(path, endpoint=Flattr.endpoint)
  stub_request(:get, endpoint + path)
end

def stub_post(path, endpoint=Flattr.endpoint)
  stub_request(:post, endpoint + path)
end

def stub_put(path, endpoint=Flattr.endpoint)
  stub_request(:put, endpoint + path)
end

