require 'flattr/base'

module Flattr
  class Thing < Flattr::Base

    lazy_attr_reader :resource, :link, :id, :url, :language, :category,
      :hidden, :flattred, :tags, :flattrs, :description, :title,
      :last_flattr_at, :updated_at, :image, :owner

    lazy_attr_writer :tags, :language, :category, :hidden, :description,
      :description, :title

    def initialize(attrs={})
      attrs['owner'] = Flattr::User.new attrs['owner'] if attrs['owner']
      super attrs
    end
   end
end
