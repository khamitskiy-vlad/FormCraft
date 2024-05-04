# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift lib unless $:.include?(lib)

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :Generator, 'hexlet_code/generator.rb'

  def self.form_for(struct, attr = {}, &)
    form = Generator.new(struct, **attr, &)
    HexletCode::Tag.build('form', **form.attr) { form.data }
  end
end
