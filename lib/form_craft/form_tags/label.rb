# frozen_string_literal: true

module FormCraft
  class Label
    LABEL_TAG = :label

    def self.render(name, label)
      return unless label

      label_tag = Tag.build(LABEL_TAG,
                            for: name) { name.capitalize }
      "  #{label_tag}\n"
    end
  end
end
