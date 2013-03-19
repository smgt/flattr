source "http://rubygems.org"

gem 'system_timer', :platforms => :ruby_18

group :development, :test do
  gem 'rake'
end

group :development do
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard'
  gem 'guard-rspec'
  gem 'growl'
end

group :test do
  gem 'json', :platforms => :ruby_18
  gem 'rspec'
  gem 'kramdown'
  gem 'simplecov'
  gem 'webmock'
  gem 'yard'
end

gemspec
