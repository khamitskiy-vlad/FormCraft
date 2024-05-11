# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/hexlet_code'

module HexletCode
  autoload :Collector, 'hexlet_code/collector/collector.rb'
  autoload :Input, 'hexlet_code/collector/input.rb'
  autoload :Submit, 'hexlet_code/collector/submit.rb'
  autoload :Form, 'hexlet_code/collector/form.rb'
  autoload :Renderer, 'hexlet_code/rendered_views/renderer.rb'
  autoload :Tag, 'hexlet_code/rendered_views/html/tag.rb'
  autoload :Html, 'hexlet_code/rendered_views/html/html.rb'
end
