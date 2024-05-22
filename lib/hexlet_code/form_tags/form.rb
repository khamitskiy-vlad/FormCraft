# frozen_string_literal: true

module HexletCode
  class Form
    DEFAULT_ACTION = '#'
    DEFAULT_METHOD = 'post'

    def self.render(form, fields)
      attributes = { action: form[:attributes][:url] || DEFAULT_ACTION,
                     method: DEFAULT_METHOD }.merge(form[:attributes]
                                             .except(:url))
      Tag.build(form[:tag], **attributes) { fields }
    end
  end
end
