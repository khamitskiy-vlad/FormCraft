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

    def input(tag, options = {})
      raise "Undefined tag '#{tag}' for #{@struct}" unless @struct.key?(tag)

      # Gives a default value for tag, if value == nil (name: nil => name: 'name')
      @struct[tag] = tag.to_s if @struct[tag].nil?

      case options[:as]
      when :text
        @data.push("  #{textarea_form(tag, @struct[tag], **options)}\n")
      else
        @data.push("  #{input_form(tag, @struct[tag], **options)}\n")
      end
    end

    private

    def input_form(tag, value, **)
      HexletCode::Tag.build('input', "#{tag}": tag.to_s, type: 'text', value: value.to_s, **)
    end

    def textarea_form(tag, value, **options)
      options[:rows] = '40' if options[:rows].nil?
      options[:cols] = '20' if options[:cols].nil?
      options.delete(:as)

      HexletCode::Tag.build('textarea', **options, name: tag.to_s) { value }
    end
  end
end
