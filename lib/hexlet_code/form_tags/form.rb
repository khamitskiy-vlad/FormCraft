# frozen_string_literal: true

module HexletCode
  class Form
    def self.render(form, fields)
      tag = form[:tag]
      action = form[:attributes][:url] || '#'
      attributes = { action:, method: 'post' }.merge(form[:attributes].except(:url))
      Tag.build(tag, **attributes) { fields }
    end
  end
end
