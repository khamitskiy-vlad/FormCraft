# frozen_string_literal: true

module HexletCode
  class Submit
    DEFAULT_TAG = :input
    DEFAULT_SUBMIT_TYPE = :submit

    def self.render(input)
      submit = Tag.build(DEFAULT_TAG,
                         type: DEFAULT_SUBMIT_TYPE,
                         value: input[:value],
                         **input[:attributes])
      "  #{submit}\n"
    end
  end
end
