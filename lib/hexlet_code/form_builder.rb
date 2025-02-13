# frozen_string_literal: true

module HexletCode
  autoload :Tag, File.expand_path('tag.rb', __dir__)
  autoload :HTMLTemplates, File.expand_path('html_templates.rb', __dir__)
  autoload :FormRenderer, File.expand_path('form_renderer.rb', __dir__)

  class FormBuilder
    attr_reader :form_body

    def initialize(entity, attributes)
      @entity = entity
      @form_body = {
        inputs: [],
        submit: { options: nil },
        form_options: {
          action: attributes.fetch(:url, '#'),
          method: attributes.fetch(:method, 'post')
        }.merge(attributes.except(:url, :method))
      }
    end

    def input(input_attr, input_attrs = {})
      input = input_attrs.delete(:as) || :input
      form_body[:inputs] << [input, @entity, input_attr, input_attrs]
    end

    def submit(text_for_button = 'Save')
      # submit = Tag.build(:input, submit_attrs)
      # form_body[:submit][:options] = submit
      form_body[:inputs] << [:submit, nil, nil, text_for_button]
    end
  end
end
