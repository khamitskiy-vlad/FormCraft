# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require_relative 'form_craft/version'

module FormCraft
  autoload :Form, 'form_craft/form_tags/form.rb'
  autoload :Input, 'form_craft/form_tags/input.rb'
  autoload :Label, 'form_craft/form_tags/label.rb'
  autoload :Submit, 'form_craft/form_tags/submit.rb'
  autoload :Textarea, 'form_craft/form_tags/textarea.rb'
  autoload :Collector, 'form_craft/collector.rb'
  autoload :Renderer, 'form_craft/renderer.rb'
  autoload :Tag, 'form_craft/tag.rb'

  def self.form_for(struct, attrs = {})
    collector = Collector.new(struct, attrs)
    yield collector if block_given?
    Renderer.to_html(collector.collection)
  end
end
