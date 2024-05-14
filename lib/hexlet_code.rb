# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Form, 'hexlet_code/form_tags/form.rb'
  autoload :Input, 'hexlet_code/form_tags/input.rb'
  autoload :Label, 'hexlet_code/form_tags/label.rb'
  autoload :Submit, 'hexlet_code/form_tags/submit.rb'
  autoload :Textarea, 'hexlet_code/form_tags/textarea.rb'
  autoload :Collector, 'hexlet_code/collector.rb'
  autoload :Renderer, 'hexlet_code/renderer.rb'
  autoload :Tag, 'hexlet_code/tag.rb'

  def self.form_for(struct, attrs = {})
    collector = Collector.new(struct, attrs)
    yield collector if block_given?
    Renderer.to_html(collector.collection)
  end
end
