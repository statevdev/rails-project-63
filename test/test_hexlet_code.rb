# frozen_string_literal: true

require_relative "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_for
    user = HexletCode.create_user(:test)

    forms = [
      '<form action="#" method="post"></form>',
      '<form action="#" method="post" class="hexlet-form"></form>',
      '<form action="/profile" method="post" class="hexlet-form"></form>'
    ]

    assert { HexletCode.form_for(user) == forms[0] }
    assert { HexletCode.form_for(user, class: "hexlet-form") == forms[1] }
    assert { HexletCode.form_for(user, url: "/profile", class: "hexlet-form") == forms[2] }
  end
end
