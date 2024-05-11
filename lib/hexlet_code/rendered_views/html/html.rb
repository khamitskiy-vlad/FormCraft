# frozen_string_literal: true

module HexletCode
  module Html
    def form_for(tag, attributes, inputs)
      Tag.build(tag, **attributes.to_h) { inputs }
    end

    def render_html_fields_from(inputs_hash)
      inputs_hash.each do |hash|
        fields << "  #{label_for(hash[:name])}\n" if hash[:label]
        fields << render_html_fields(hash)
      end
    end

    def render_html_fields(hash)
      case hash[:tag]
      when :textarea
        "  #{textarea_field(hash[:tag], hash[:name], hash[:value], hash[:attributes])}\n"
      when :input
        "  #{input_field(hash[:tag], hash[:name], hash[:value], hash[:type], hash[:attributes])}\n"
      end
    end

    def input_field(tag, name, value, type, attributes)
      return submit_type(tag, value, type, attributes) if type == 'submit'

      Tag.build(tag, name:, type:, value:, **attributes.to_h)
    end

    def label_for(name)
      Tag.build(:label, for: name) { name.capitalize }
    end

    def submit_type(tag, value, type, attributes)
      Tag.build(tag, type:, value:, **attributes.to_h)
    end

    def textarea_field(tag, name, value, attrs)
      Tag.build(tag, **attrs, name:) { value }
    end
  end
end
