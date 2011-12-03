require "flattr/base"

module Flattr
  class Category < Flattr::Base
    lazy_attr_reader :id, :text
  end
end
