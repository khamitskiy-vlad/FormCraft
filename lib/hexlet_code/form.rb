# frozen_string_literal: true

module HexletCode
  def self.form_for(struct, attributes = {}, &)
    Generator.new struct, attributes, &
  end
end
