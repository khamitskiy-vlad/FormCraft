# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/hexlet_code'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    # The order is important to make sure that method with attr does not overwrite DEF_ATTR const
    @form_with_attr    = HexletCode.form_for @user, url: '/users' do |f|
                           f.input :job, as: :text, rows: 50, cols: 50
                           f.input :name, class: 'user-input'
                         end

    @form_without_attr = HexletCode.form_for @user do |f|
                           f.input :job, as: :text
                           f.input :name
                         end

    @expected_form_with_attr = File.readlines 'test/fixtures/expected_form_with_attr.txt'

    @expected_form_without_attr = File.readlines 'test/fixtures/expected_form_without_attr.txt'
  end

  def test_form_creation_for_user_with_attr
    assert { @expected_form_with_attr.join == @form_with_attr }
  end

  def test_form_creation_for_user_without_attr
    assert { @expected_form_without_attr.join == @form_without_attr }
  end

  def test_error_should_be_raised_when_undefined_tag_for_struct
    error = assert_raises(RuntimeError) do
      HexletCode.form_for @user do |f|
        f.input :age
      end
    end

    assert_equal "Undefined tag 'age' for {:name=>\"rob\", :job=>\"hexlet\", :gender=>\"m\"}", error.message
  end
end
