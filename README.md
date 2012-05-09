![Flattr gem](https://github.com/simon/flattr/blob/master/img/logo_medium.png) [![Build Status](https://secure.travis-ci.org/simon/flattr.png)](http://travis-ci.org/simon/flattr) [![Dependency Status](https://gemnasium.com/simon/flattr.png)](https://gemnasium.com/simon/flattr)

This gem is a wrapper around the Flattr API. With the gem you can search things, add new thing and much more. If you want information about updates follow [@simongate](http://twitter.com/simongate) on twitter.

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=smgt&url=https://github.com/simon/flattr&title=Flattr API gem&language=en_GB&tags=github&category=software)

## Installation

Installation is easy, just install the gem with.

`gem install flattr`

### Dependencies

  * [Faraday](https://github.com/technoweenie/faraday)
  * [multi_json](https://github.com/intridea/multi_json)

## Usage

To talk with all of Flattr API resources you need to [register a application](http://flattr.com/apps). This will give you a `client id` and a `client secret` whom you can exchange for a `access token`. The `access token` is then used to access the resources in the Flattr API that needs authentication. You can find more information about the API in [Flattr developer documents](http://developers.flattr.net/api).

### Resources

You can find documentation about available resources in the code.

* [flattrs](https://github.com/simon/flattr/blob/master/lib/flattr/client/flattrs.rb)
* [things](https://github.com/simon/flattr/blob/master/lib/flattr/client/things.rb)
* [users](https://github.com/simon/flattr/blob/master/lib/flattr/client/users.rb)
* [categories](https://github.com/simon/flattr/blob/master/lib/flattr/client/categories.rb)
* [languages](https://github.com/simon/flattr/blob/master/lib/flattr/client/languages.rb)

### Access public resources

There are several public available resources in the Flattr API where you don't need to authenticate to access.

```ruby
# Fetch a public thing
flattr = Flattr.new

flattr.thing 423405
# => #<Flattr::Thing:0x007fccbb4f1d40 @attrs={"type"=>"thing", "resource"=>"https://api.flattr.com/rest/v2/things/423405", "link"=>"https://flattr.com/thing/423405", "id"=>423405, "url"=>"http://blog.flattr.net/2011/10/api-v2-beta-out-whats-changed/", "language"=>"en_GB", "category"=>"text", "owner"=>{"type"=>"user", "resource"=>"https://api.flattr.com/rest/v2/users/flattr", "link"=>"https://flattr.com/profile/flattr", "username"=>"flattr"}, "hidden"=>false, "created_at"=>1319704532, "tags"=>["api"], "flattrs"=>9, "description"=>"We have been working hard to deliver a great experience for developers and tried to build a good foundation for easily add new features. The API will remain in beta for a while for us to kill quirks and refine some of the resources, this means there might be big changes without notice for ...", "title"=>"API v2 beta out – what’s changed?"}>
```

### Access protected resources

The gem allows makes it easy to do the oauth2 dance.

```ruby
Flattr.configure do |config|
  config.client_id = '1234'
  config.client_secret = '4567'
end

flattr = Flattr.new

puts 'Open this URL in your browser to authenticate your application'
puts flattr.authorize_url

puts "\n\n"

puts 'When your with the authentication the browser will redirect you to the callback URL you specified when creating a application. It has also included a code in the query string. Copy paste this code to the command line.'
print 'code: '
code = gets

# Use the code and exchange it for a access_token
access_token = flattr.get_access_token code

puts access_token

# You are now authorized! ;)

```

### Scopes available

If you request a access token without any scopes you won't be able to flattr other users things and such. The scopes available are:

* `thing` - Create and update things
* `flattr` - Flattr things
* `extendedread` - Access all the information about users

## What needs to be done

* Add all the Flattr API resources
* More tests are needed, coverage isn't that good

## Supported Ruby Versions

This library aims to support and is [tested against](http://travis-ci.org/simon/flattr) the following Ruby implementations:

* Ruby 1.8.7
* Ruby 1.9.2
* Ruby 1.9.3
* JRuby
* Rubinius
* Ruby Enterprise Edition

If something doesn't work on one of these interpreters, it should be considered a bug.

This library may inadvertently work (or seem to work) on other Ruby implementations, however support will only be provided for the versions listed above.

If you would like this library to support another Ruby version, you may volunteer to be a maintainer. Being a maintainer entails making sure all tests run and pass on that implementation. When something breaks on your implementation, you will be personally responsible for providing patches in a timely fashion. If critical issues for a particular implementation exist at the time of a major release, support for that Ruby version may be dropped.

## Copyright

Copyright (c) 2011 Simon Gate, Joel Hansson. See LICENSE for details.
