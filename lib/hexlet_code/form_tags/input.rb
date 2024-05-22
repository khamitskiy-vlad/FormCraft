# frozen_string_literal: true

module HexletCode
  class Input
    DEFAULT_INPUT_TYPE = 'text'

    def self.render(input)
      label = Label.render(input[:name], input[:label])
      input_tag = Tag.build(input[:tag],
                            name: input[:name],
                            type: input[:type] || DEFAULT_INPUT_TYPE,
                            value: input[:value],
                            **input[:attributes])
      "#{label}  #{input_tag}\n"
    end
  end
end
