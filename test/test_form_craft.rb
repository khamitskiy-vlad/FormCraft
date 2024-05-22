# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/form_craft'

class TestFormCraft < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    @empty_user = User.new
  end

  def test_form_creation_for_user_with_attr
    expected_form = load_fixture('expected_form_with_attr')
    form = FormCraft.form_for @user, url: '/profile', method: :get, class: 'hexlet-form' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
      f.input :name, class: 'user-input'
      f.submit 'Wow'
    end

    assert { expected_form == form }
  end

  def test_form_creation_for_user_without_attr
    expected_form = load_fixture('expected_form_without_attr')
    form = FormCraft.form_for @user do |f|
      f.input :job, as: :text
      f.input :name
      f.submit
    end

    assert { expected_form == form }
  end

  def test_error_should_be_raised_when_undefined_tag_for_struct
    error = assert_raises(NoMethodError) do
      FormCraft.form_for @user do |f|
        f.input :age
      end
    end

    assert_equal(
      "undefined method `age' for #<struct TestFormCraft::User name=\"rob\", job=\"hexlet\", gender=\"m\">",
      error.message
    )
  end

  def test_form_creation_for_empty_user
    expected_form = load_fixture('expected_for_empty_user')
    form = FormCraft.form_for @empty_user do |f|
      f.input :name
    end

    assert { expected_form == form }
  end

  def test_setting_labels_ability
    expected_form = load_fixture('expected_with_setting_labels')
    form = FormCraft.form_for @user do |f|
      f.input :name, label: false
      f.input :name
    end

    assert { expected_form == form }
  end

  def test_setting_input_type_ability
    expected_form = load_fixture('expected_with_setting_types')
    form = FormCraft.form_for @user do |f|
      f.input :name, type: 'color'
      f.input :name
    end

    assert { expected_form == form }
  end

  def test_submit_inputs
    expected_form = load_fixture('expected_submit_inputs')
    form = FormCraft.form_for @user do |f|
      f.submit
      f.submit 'Wow'
      f.submit class: 'user-submit'
      f.submit 'Wow', class: 'user-submit'
    end

    assert { expected_form == form }
  end

  def test_form_seting_default_action
    expected_form = load_fixture('expected_default_action_setted')
    form = FormCraft.form_for @user, class: 'hexlet-form'

    assert { expected_form == form }
  end
end
