# frozen_string_literal: true

require_relative "hexlet_code/version"

# Главный модуль библиотеки для генерации форм и html-тэгов.
module HexletCode
  class Error < StandardError; end

  autoload :Tag, File.expand_path("hexlet_code/tag.rb", __dir__)

  # Класс для создания инпутов формы.
  class Input
    attr_reader :inputs

    def initialize(user)
      @user = user
      @inputs = []
    end

    def input(attr, **attrs)
      tag = attrs[:as] || :input
      attrs.delete(:as)
      input = HexletCode::Tag.send(tag, @user, attr, attrs)
      inputs << input
      input
    end
  end

  def self.form_for(user, **attrs, &)
    attrs = { "action" => attrs.delete(:url) || "#", "method" => "post" }.merge(attrs)

    form = Input.new(user)

    return HexletCode::Tag.build("form", attrs, &proc {}) unless block_given?

    yield(form)

    Tag.build("form", attrs) { "\n#{form.inputs.join("\n")}\n" }
  end

  def self.create_user_with(**attributes)
    user_struct = Struct.new(*attributes.keys, keyword_init: true)
    user_struct.new(**attributes)
  end
end
