# frozen_string_literal: true

module HexletCode
  class Submit
    attr_reader :collection

    DEFAULT_SUBMIT = { tag: :input, type: 'submit', value: 'Save' }.freeze

    def initialize(val, attrs)
      @collection = {}
      tag = DEFAULT_SUBMIT[:tag]
      type = DEFAULT_SUBMIT[:type]
      value = value_handler(val)
      attributes = attrs.merge(val) if val.is_a?(Hash)
      @collection.merge!({ tag:, type:, value:, attributes: }).compact!
    end

    private

    def value_handler(val)
      return val unless val.is_a?(Hash)

      DEFAULT_SUBMIT[:value]
    end
  end
end
