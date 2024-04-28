# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end
  # TODO: include or rewrite tests before submitting the project
  #
  # def setup
  #   @expected_unpaired = {
  #     hr: '<hr>',
  #     input: '<input>'
  #   }

  #   @expexted_paired = {
  #     label: '<label></label>',
  #     div: '<div></div>'
  #   }

  #   @expected_with_attr = {
  #     input: '<input type="submit" value="Save">',
  #     img: '<img src="path/to/image">'
  #   }

  #   @expected_with_block = {
  #     span: '<span>Email</span>',
  #     form: '<form for="email">Email</form>'
  #   }

  #   @unexpected = {
  #     br: '<br></br>',
  #     html: '<html>'
  #   }
  # end

  # def test_that_gem_build_paired_html_tags
  #   assert { @expexted_paired[:label] == HexletCode::Tag.build('label') }
  #   assert { @expexted_paired[:div] == HexletCode::Tag.build('div') }
  #   refute { @unexpected[:br] == HexletCode::Tag.build('br') }
  # end

  # def test_that_gem_build_unpaired_html_tags
  #   assert { @expexted_unpaired[:hr] == HexletCode::Tag.build('hr') }
  #   assert { @expexted_unpaired[:input] == HexletCode::Tag.build('input') }
  #   refute { @unexpected[:html] == HexletCode::Tag.build('html') }
  # end

  # def test_that_gem_build_html_tags_with_attributes
  #   assert { @expected_with_attr[:img] == HexletCode::Tag.build('img', src: 'path/to/image') }
  #   assert { @expected_with_attr[:input] == HexletCode::Tag.build('input', type: 'submit', value: 'Save') }
  # end

  # def test_that_gem_build_html_tags_with_block
  #   assert { @expected_with_block[:span] == HexletCode::Tag.build('span') { 'Email' } }
  #   assert { @expected_with_block[:form] == HexletCode::Tag.build('form', for: 'email') { 'Email' } }
  # end
end
