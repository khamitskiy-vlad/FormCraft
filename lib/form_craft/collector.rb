# frozen_string_literal: true

module FormCraft
  class Collector
    DEFAULT_LABEL = { label: true }.freeze

    attr_reader :collection

    def initialize(struct, attributes)
      @struct = struct
      @collection = []
      form(attributes)
    end

    def input(name, attributes = {})
      value = @struct.public_send(name) || ''
      @collection << { tag: __method__,
                       name:,
                       value:,
                       attributes: DEFAULT_LABEL.merge(attributes) }
    end

    def submit(value = 'Save', attributes = {})
      @collection << { tag: __method__,
                       value:,
                       attributes: }
    end

    private

    def form(attributes)
      @collection << { tag: __method__,
                       attributes: }
    end
  end
end
