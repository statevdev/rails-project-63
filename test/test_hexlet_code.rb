# frozen_string_literal: true

require_relative "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:name, :job, :gender, keyword_init: true)
  def setup
    @user = User.new(name: "rob", job: "hexlet", gender: "m")
  end

  def test_form_for_without_inputs
    fixture = File.read("test/fixtures/fixture_without_inputs.html").chomp
    test = HexletCode.form_for(@user)
    assert { test == fixture }
  end

  def test_form_for_new_attr
    fixture = File.read("test/fixtures/fixture_with_new_attr.html").chomp
    test = HexletCode.form_for(@user, class: "hexlet-form")
    assert { test == fixture }
  end

  def test_form_for_reassign_attr
    fixture = File.read("test/fixtures/fixture_with_reassign_attr.html").chomp
    test = HexletCode.form_for(@user, url: "/profile", class: "hexlet-form")
    assert { test == fixture }
  end

  def test_form_for_inputs
    fixture = File.read("test/fixtures/fixture_with_inputs.html").chomp
    test = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
      f.input :name, class: "user-input"
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert { test == fixture }
  end

  def test_form_for_submit
    fixture = File.read("test/fixtures/fixture_with_submit.html").chomp
    test = HexletCode.form_for @user, url: "#" do |f|
      f.input :name
      f.input :job
      f.submit
      f.submit "Wow"
    end
    assert_equal test, fixture
  end

  def test_form_for_no_method
    HexletCode.form_for @user do |f|
      assert_raises(NoMethodError) { f.input :age }
    end
  end
end
