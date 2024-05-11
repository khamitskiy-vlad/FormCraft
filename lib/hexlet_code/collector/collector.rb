# frozen_string_literal: true

module HexletCode
  class Collector
    attr_reader :struct, :form_attrs, :collection

    def initialize(struct, attrs)
      @struct = struct
      @form_attrs = attrs
      @collection = []
      form_from(form_attrs)
    end

    def input(name = struct.members[0], attrs = {})
      value = struct.public_send(name) || ''
      input = Input.new(name, value, attrs)
      collection << input.collection
    end

    def submit(val = 'Save', attrs = {})
      submit = Submit.new(val, attrs)
      collection << submit.collection
    end

    private

    def form_from(form_attrs)
      form = Form.new(form_attrs)
      collection << form.collection
    end
  end
end
