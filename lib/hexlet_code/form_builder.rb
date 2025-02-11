# frozen_string_literal: true

module HexletCode
  autoload :Tag, File.expand_path('tag.rb', __dir__)
  autoload :HTMLTemplates, File.expand_path('html_templates.rb', __dir__)

  class FormBuilder
    attr_reader :inputs

    def initialize(object)
      @object = object
      @inputs = []
    end

    def input(input_attr, input_attrs = {})
      tag = input_attrs.delete(:as) || :input
      input = HTMLTemplates.send(tag, @object, input_attr, input_attrs)
      inputs << input
      input
    end

    def submit(text_for_button = 'Save')
      submit_attrs = { type: 'submit', value: text_for_button }
      submit = Tag.build(:input, {}, submit_attrs)
      inputs << submit
      submit
    end
  end
end
