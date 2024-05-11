# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :collection

    DEFAULT_ATTRS = { action: '#', method: 'post' }.freeze
    DEFAULT_FORM = { tag: :form }.freeze

    def initialize(attrs)
      @collection = {}
      tag = DEFAULT_FORM[:tag]
      attributes = attrs_handler(attrs)
      @collection.merge!({ tag:, attributes: }).compact!
    end

    private

    def attrs_handler(attrs)
      default_attrs = DEFAULT_ATTRS.dup
      return default_attrs if attrs.empty?

      setted_attrs = default_attrs.merge(attrs)
      setted_attrs[:action] = setted_attrs.delete(:url)
      setted_attrs
    end
  end
end
