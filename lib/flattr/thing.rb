require 'flattr/base'

module Flattr
  class Thing < Flattr::Base

    lazy_attr_reader :resource, :link, :id, :url, :language, :category,
      :hidden, :flattred, :tags, :flattrs, :description, :title,
      :last_flattr_at, :updated_at, :owner,:image

    lazy_attr_writer :tags, :language, :category, :hidden, :description,
      :description, :title

   end
end
