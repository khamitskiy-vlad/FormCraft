# frozen_string_literal: true

module HexletCode
  class Generator
    attr_reader :data, :attr

    DEF_ATTR = { action: '#' }.freeze

    def initialize(struct, **attr, &)
      @struct = {}; struct.each_pair { |name, value| @struct[name.to_sym] = value }
      @attr = DEF_ATTR.dup; attr.map { |_k, v| @attr[:action] = v if attr.key?(:url) }
      @data = []
      instance_eval(&)
    end

    def submit(value = 'Save')
      @data.push("  #{input_form('', value, 'submit')}\n".gsub(' name="" ', ' '))
    end

    def input(tag, options = {})
      raise "Undefined tag '#{tag}' for #{@struct}" unless @struct.key?(tag)

      @data.push("  #{label_for(tag)}\n")

      case options[:as]
      when :text
        @data.push("  #{textarea_form(tag, @struct[tag], **options)}\n")
      else
        @data.push("  #{input_form(tag, @struct[tag], 'text', **options)}\n")
      end
    end

    private

    def label_for(tag)
      HexletCode::Tag.build('label', for: tag.to_s) { tag.capitalize }
    end

    def input_form(tag, value, type, **)
      HexletCode::Tag.build('input', name: tag.to_s, type: type.to_s, value: value.to_s, **)
    end

    def textarea_form(tag, value, **options)
      options[:rows] = '40' if options[:rows].nil?
      options[:cols] = '20' if options[:cols].nil?
      options.delete(:as)

      HexletCode::Tag.build('textarea', **options, name: tag.to_s) { value }
    end
  end
end
