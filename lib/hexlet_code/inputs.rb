# frozen_string_literal: true

class Inputs
  attr_reader :inputs

  autoload :Tag, File.expand_path('tag.rb', __dir__)

  def initialize(object)
    @object = object
    @inputs = []
  end

  def input(input_attr, input_attrs = {})
    tag = input_attrs.delete(:as) || :input
    input = Inputs.send(tag, @object, input_attr, input_attrs)
    inputs << input
    input
  end

  def submit(text_for_button = 'Save')
    submit_attrs = { type: 'submit', value: text_for_button }
    submit = Tag.build(:input, {}, submit_attrs)
    inputs << submit
    submit
  end

  def self.input(object, input_attr, input_attrs)
    default_input_attrs = { name: input_attr, type: 'text', value: object.public_send(input_attr) }
    merged_attrs = default_input_attrs.merge(input_attrs)

    label = self.label(object, input_attr)
    "#{label}\n#{Tag.build(:input, object.to_h, merged_attrs)}"
  end

  def self.text(object, input_attr, input_attrs)
    default_input_attrs = { name: input_attr, cols: 20, rows: 40 }
    merged_attrs = default_input_attrs.merge(input_attrs)

    Tag.build(:textarea, object.to_h, merged_attrs) { object.public_send(input_attr) }
  end

  def self.label(object, input_attr, input_attrs = {})
    default_input_attrs = { for: input_attr }
    merged_attrs = default_input_attrs.merge(input_attrs)

    Tag.build(:label, object.to_h, merged_attrs) { input_attr.to_s.capitalize }
  end
end
