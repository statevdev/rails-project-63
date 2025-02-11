# frozen_string_literal: true

module HexletCode
  autoload :Tag, File.expand_path('tag.rb', __dir__)
  autoload :HTMLTemplates, File.expand_path('html_templates.rb', __dir__)
  autoload :FormRenderer, File.expand_path('form_renderer.rb', __dir__)

  class FormBuilder
    attr_reader :form_body

    def initialize(entity)
      @entity = entity
      @form_body = []
    end

    def input(input_attr, input_attrs = {})
      tag = input_attrs.delete(:as) || :input
      input = FormRenderer.to_html(tag, @entity, input_attr, input_attrs)
      form_body << input
      input
    end

    def submit(text_for_button = 'Save')
      submit_attrs = { type: 'submit', value: text_for_button }
      submit = Tag.build(:input, {}, submit_attrs)
      form_body << submit
      submit
    end
  end
end
