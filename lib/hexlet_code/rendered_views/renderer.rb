# frozen_string_literal: true

module HexletCode
  class Renderer
    include Html

    attr_accessor :collection
    attr_reader :form, :fields

    def initialize(collection)
      @collection = collection
      @fields = String.new
      @form = String.new
    end

    def to_html
      form_hash = collection[0]
      inputs_hash = collection[1..]
      render_html_fields_from(inputs_hash)
      form.concat(form_for(form_hash[:tag], form_hash[:attributes], fields))
    end
  end
end
