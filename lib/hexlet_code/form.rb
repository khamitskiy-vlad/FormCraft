# frozen_string_literal: true

module HexletCode
  def self.form_for(_name, url = {})
    if url.empty?
      HexletCode::Tag.build 'form', action: '#', method: 'post'
    else
      url.map do |_key, value|
        HexletCode::Tag.build 'form', action: value, method: 'post'
      end.join
    end
  end
end
