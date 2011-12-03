require 'flattr/base'

module Flattr
  class Thing < Flattr::Base
    lazy_attr_reader :resorce, :link, :id, :url, :language, :category,
      :hidden, :flattred, :tags, :flattrs, :description, :title,
      :last_flattr_at, :updated_at, :flattrs_current_period
   end
end
