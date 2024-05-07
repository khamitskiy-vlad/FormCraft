# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/hexlet_code'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_form_creation_for_user_with_attr
    expected_form = load_fixture('expected_form_with_attr')
    form = HexletCode.form_for @user, url: '/profile', method: :get, class: 'hexlet-form' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
      f.input :name, class: 'user-input'
      f.submit 'Wow'
    end

    assert { expected_form == form }
  end

  def test_form_creation_for_user_without_attr
    expected_form = load_fixture('expected_form_without_attr')
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text
      f.input :name
      f.submit
    end

    assert { expected_form == form }
  end

  def test_error_should_be_raised_when_undefined_tag_for_struct
    error = assert_raises(NoMethodError) do
      HexletCode.form_for @user do |f|
        f.input :age
      end
    end

    assert_equal(
      "undefined method `age' for #<struct TestHexletCode::User name=\"rob\", job=\"hexlet\", gender=\"m\">",
      error.message
    )
  end
end
