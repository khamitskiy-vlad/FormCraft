# frozen_string_literal: true

module HexletCode
  class Renderer
    class << self
      def to_html(collection)
        form = collection[0]
        inputs = collection[1..]
        fields = render_fields_from(inputs)
        build_form(form, fields)
      end

      private

      def build_form(form, fields)
        tag = form[:tag].capitalize
        HexletCode.const_get(tag).render(form, fields)
      end

      def render_fields_from(inputs)
        inputs.map do |input|
          handled_input = options_handler(input)
          tag = handled_input[:tag].capitalize
          HexletCode.const_get(tag).render(handled_input)
        end.join
      end

      def options_handler(input)
        label = input[:attributes][:label]
        type = input[:attributes][:type]
        handled_input = { label:, type: }.merge(input).compact
        handled_input[:tag] = :textarea if handled_input[:attributes][:as] == :text
        handled_input[:attributes].reject! { |key| %i[as type label].include?(key) }
        handled_input
      end
    end
  end
end
