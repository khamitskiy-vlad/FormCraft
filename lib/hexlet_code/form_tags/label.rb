# frozen_string_literal: true

module HexletCode
  class Label
    def self.render(name, label)
      "  #{Tag.build(:label, for: name) { name.capitalize }}\n" unless label == false
    end
  end
end
