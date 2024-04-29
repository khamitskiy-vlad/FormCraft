# frozen_string_literal: true

lib = File.expand_path('../../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/form'

module HexletCode
  class Error < StandardError; end
  autoload :Tag, 'hexlet_code/classes/tag.rb'
end
