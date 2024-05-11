# frozen_string_literal: true

module HexletCode
  def self.form_for(struct, attrs = {})
    yield collector = Collector.new(struct, attrs)
    form = Renderer.new(collector.collection)
    form.to_html
  end
end
