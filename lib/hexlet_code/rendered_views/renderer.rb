# frozen_string_literal: true

module HexletCode
  class Renderer
    include Html

    attr_accessor :form, :form_fields
    attr_reader :collection

    def initialize(collection)
      @collection = collection
      @form_fields = String.new
      @form = String.new
    end
  end
end
