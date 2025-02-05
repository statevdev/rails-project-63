# frozen_string_literal: true

# Класс для сборки HTML-тэгов.
class Tag
  def self.build(tag, _users_hash, user_options = {}, &)
    tag_attrs_string = user_options.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
    return "<#{tag} #{tag_attrs_string}>" unless block_given?

    "<#{tag} #{tag_attrs_string}>#{yield}</#{tag}>"
  end
end

# Класс для создания инпутов формы.
class Inputs
  attr_reader :inputs

  def initialize(user)
    @user = user
    @inputs = []
  end

  def input(input_attr, input_attrs = {})
    tag = input_attrs.delete(:as) || :input
    input = Inputs.send(tag, @user, input_attr, input_attrs)
    inputs << input
    input
  end

  def submit(text_for_button = "Save")
    submit_attrs = { type: "submit", value: text_for_button }
    submit = Tag.build(:input, {}, submit_attrs)
    inputs << submit
    submit
  end

  def self.input(user, input_attr, input_attrs)
    default_input_attrs = { name: input_attr, type: "text", value: user.public_send(input_attr) }
    merged_attrs = default_input_attrs.merge(input_attrs)

    label = self.label(user, input_attr)
    "#{label}\n#{Tag.build(:input, user.to_h, merged_attrs)}"
  end

  def self.text(user, input_attr, input_attrs)
    default_input_attrs = { name: input_attr, cols: 20, rows: 40 }
    merged_attrs = default_input_attrs.merge(input_attrs)

    Tag.build(:textarea, user.to_h, merged_attrs) { user.public_send(input_attr) }
  end

  def self.label(user, input_attr, input_attrs = {})
    default_input_attrs = { for: input_attr }
    merged_attrs = default_input_attrs.merge(input_attrs)

    Tag.build(:label, user.to_h, merged_attrs) { input_attr.to_s.capitalize }
  end
end
