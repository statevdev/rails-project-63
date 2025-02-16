# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:name, :job, :gender, keyword_init: true)
  def setup
    @user = User.new(name: 'rob', job: 'hexlet', gender: 'm')
  end

  def test_form_for_without_inputs
    fixture = File.read('test/fixtures/fixture_without_inputs.html')
    test = HexletCode.form_for(@user)
    assert_equal test, fixture
  end

  def test_form_for_new_attr
    fixture = File.read('test/fixtures/fixture_with_new_attr.html')
    test = HexletCode.form_for(@user, class: 'hexlet-form')
    assert_equal test, fixture
  end

  def test_form_for_reassign_attr
    fixture = File.read('test/fixtures/fixture_with_reassign_attr.html')
    test = HexletCode.form_for(@user, url: '/profile', class: 'hexlet-form')
    assert_equal test, fixture
  end

  def test_form_for_inputs
    fixture = File.read('test/fixtures/fixture_with_inputs.html')
    test = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
      f.input :name, class: 'user-input'
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert_equal test, fixture
  end

  def test_form_for_submit
    fixture = File.read('test/fixtures/fixture_with_submit.html')
    test = HexletCode.form_for @user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert_equal test, fixture
  end

  def test_form_for_no_method
    assert_raises(NoMethodError) do
      HexletCode.form_for @user do |f|
        f.input :age
      end
    end
  end
end
