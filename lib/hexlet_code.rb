# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :Generator, 'hexlet_code/generator.rb'

  def self.form_for(struct, attrs = {})
    yield form = Generator.new(struct, attrs)
    HexletCode::Tag.build('form', form.attrs) { form.data }
  end
end
