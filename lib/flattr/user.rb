require 'flattr/base'

module Flattr
  class User < Flattr::Base
    lazy_attr_reader :username, :email, :firstname, :lastname, :city, :zip,
      :province, :cellphone, :avatar, :about, :country, :resource, :link
  end
end
