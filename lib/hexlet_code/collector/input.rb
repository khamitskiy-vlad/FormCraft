# frozen_string_literal: true

module HexletCode
  class Input
    attr_reader :collection

    DEFAULT_TEXTAREA = { rows: 40, cols: 20 }.freeze
    DEFAULT_INPUT = { tag: :input, type: 'text', label: true }.freeze
    OPTIONS_TO_CLEAN = %i[as type label].freeze

    def initialize(name, value, attrs)
      @collection = {}
      tag = tag_handler(attrs)
      type = type_handler(tag, attrs)
      label = label_handler(attrs)
      attributes = attrs_handler(tag, attrs)
      @collection.merge!({ tag:, type:, name:, value:, label:, attributes: }).compact!
    end

    private

    def attrs_handler(tag, attrs)
      only_attrs = attrs.reject { |key| OPTIONS_TO_CLEAN.include?(key) }
      return DEFAULT_TEXTAREA.dup.merge!(only_attrs) if tag == :textarea

      only_attrs
    end

    def label_handler(attrs)
      return false if attrs[:label] == false

      DEFAULT_INPUT[:label]
    end

    def tag_handler(attrs)
      return :textarea if attrs[:as] == :text

      DEFAULT_INPUT[:tag]
    end

    def type_handler(tag, attrs)
      return nil if tag == :textarea

      return attrs[:type] if attrs.include?(:type)

      DEFAULT_INPUT[:type]
    end
  end
end
