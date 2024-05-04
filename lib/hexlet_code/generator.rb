# frozen_string_literal: true

module HexletCode
  class Generator
    attr_reader :data, :attr

    DEF_ATTR = { action: '#', method: 'post' }.freeze

    def initialize(struct, attr = {}, &)
      @struct = struct
      @attr = DEF_ATTR.dup
      @data = []
      attr_setter(@attr, attr) if attr.any?
      instance_eval(&)
    end

    def submit(value = 'Save')
      @data.push("  #{input_form('', value, 'submit')}\n".gsub(' name="" ', ' '))
    end

    def input(tag, options = {})
      @struct.public_send(tag)
      @data.push("  #{label_for(tag)}\n")

      case options[:as]
      when :text
        @data.push("  #{textarea_form(tag, @struct[tag], **options)}\n")
      else
        @data.push("  #{input_form(tag, @struct[tag], 'text', **options)}\n")
      end
    end

    private

    def attr_setter(instance, attr)
      attr[:action] = attr.delete(:url)
      attr.map { |k, v| instance[k] = v }
    end

    def label_for(tag)
      HexletCode::Tag.build('label', for: tag) { tag.capitalize }
    end

    def input_form(tag, value, type, **)
      HexletCode::Tag.build('input', name: tag, type:, value:, **)
    end

    def textarea_form(tag, value, options = {})
      options[:rows] = '40' if options[:rows].nil?
      options[:cols] = '20' if options[:cols].nil?
      options.delete(:as)

      HexletCode::Tag.build('textarea', **options, name: tag) { value }
    end
  end
end
