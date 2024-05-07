# frozen_string_literal: true

module HexletCode
  class Generator
    attr_reader :data, :attrs

    DEFAULT_ATTRS = { action: '#', method: 'post' }.freeze

    def initialize(struct, attrs = {})
      @struct = struct
      @attrs = DEFAULT_ATTRS.dup
      @data = String.new
      attrs_setter(@attrs, attrs) if attrs.any?
    end

    def submit(value = 'Save')
      @data << "  #{input_form('', value, 'submit')}\n".gsub(' name="" ', ' ')
    end

    def input(tag_name, options = {})
      tag_value = @struct.public_send(tag_name)
      @data << "  #{label_for(tag_name)}\n"

      @data << case options[:as]
               when :text
                 "  #{textarea_form(tag_name, tag_value, **options)}\n"
               else
                 "  #{input_form(tag_name, tag_value, 'text', **options)}\n"
               end
    end

    private

    def attrs_setter(default_attrs, attrs)
      default_attrs.merge!(attrs)
      default_attrs[:action] = default_attrs.delete(:url)
    end

    def label_for(tag)
      HexletCode::Tag.build('label', for: tag) { tag.capitalize }
    end

    def input_form(tag, value, type, **)
      HexletCode::Tag.build('input', name: tag, type:, value:, **)
    end

    def textarea_form(tag, value, options = {})
      attrs = { rows: '40', cols: '20' }.merge(options)
      attrs.delete(:as)

      HexletCode::Tag.build('textarea', **attrs, name: tag) { value }
    end
  end
end
