# frozen_string_literal: true

lib = File.expand_path('../../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/form'

module HexletCode
  class Error < StandardError; end
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :Generator, 'hexlet_code/generator.rb'
end

# User = Struct.new(:name, :job, :gender, keyword_init: true)
# user = User.new name: 'rob', job: 'hexlet', gender: 'm'

# HexletCode.form_for user, url: '/users' do |f|
#   f.input
# end
