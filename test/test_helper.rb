# frozen_string_literal: true

require 'bundler/setup'
Bundler.require

require 'form_craft'
require 'minitest/autorun'

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

def load_fixture(filename)
  File.read(File.dirname(__FILE__) + "/fixtures/#{filename}.txt")
end
