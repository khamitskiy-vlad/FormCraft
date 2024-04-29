# frozen_string_literal: true

require 'bundler/setup'
Bundler.require

lib = File.expand_path('../../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'hexlet_code'

require 'minitest/autorun'
