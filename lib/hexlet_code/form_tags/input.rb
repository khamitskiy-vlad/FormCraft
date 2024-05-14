# frozen_string_literal: true

module HexletCode
  class Input
    def self.render(input)
      tag = input[:tag]
      name = input[:name]
      type = input[:type] || 'text'
      value = input[:value]
      label = input[:label]
      attributes = input[:attributes]
      "#{Label.render(name, label)}  #{Tag.build(tag, name:, type:, value:, **attributes)}\n"
    end
  end
end
