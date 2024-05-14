# frozen_string_literal: true

module HexletCode
  class Submit
    def self.render(input)
      tag = :input
      type = :submit
      value = input[:value]
      attributes = input[:attributes]
      "  #{Tag.build(tag, type:, value:, **attributes)}\n"
    end
  end
end
