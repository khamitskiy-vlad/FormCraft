# frozen_string_literal: true

module FormCraft
  class Form
    DEFAULT_ACTION = '#'
    DEFAULT_METHOD = 'post'

    def self.render(form, fields)
      attributes = { action: DEFAULT_ACTION,
                     method: DEFAULT_METHOD }.merge(form[:attributes])
      Tag.build(form[:tag], **attributes) { fields }
    end
  end
end
