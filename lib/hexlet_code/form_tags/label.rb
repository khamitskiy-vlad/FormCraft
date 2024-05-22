# frozen_string_literal: true

module HexletCode
  class Label
    DEFAULT_LABEL_TAG = :label

    def self.render(name, label)
      label_tag = Tag.build(DEFAULT_LABEL_TAG,
                            for: name) { name.capitalize }
      "  #{label_tag}\n" unless label == false
    end
  end
end
