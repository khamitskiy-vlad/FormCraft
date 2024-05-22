# frozen_string_literal: true

module HexletCode
  class Textarea
    DEFAULT_TEXTAREA_ATTRIBUTES = { rows: '40',
                                    cols: '20' }.freeze

    def self.render(input)
      label = Label.render(input[:name], input[:label])
      textarea = Tag.build(input[:tag],
                           **DEFAULT_TEXTAREA_ATTRIBUTES.merge(input[:attributes]),
                           name: input[:name]) { input[:value] }
      "#{label}  #{textarea}\n"
    end
  end
end
