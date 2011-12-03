require "flattr/base"

module Flattr
  class Language < Flattr::Base
    lazy_attr_reader :id, :text
  end
end
