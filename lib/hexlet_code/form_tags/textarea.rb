# frozen_string_literal: true

module HexletCode
  class Textarea
    def self.render(input)
      tag = input[:tag]
      name = input[:name]
      value = input[:value]
      label = input[:label]
      attributes = { rows: '40', cols: '20' }.merge(input[:attributes])
      "#{Label.render(name, label)}  #{Tag.build(tag, **attributes, name:) { value }}\n"
    end
  end
end
