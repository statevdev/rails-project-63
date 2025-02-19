# frozen_string_literal: true

require 'active_support/all'

module HexletCode
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
      input_type = input_attrs.delete(:as) || :string
      input_attr_value = @entity.public_send(input_attr)
      input_class = "HexletCode::Inputs::#{input_type.capitalize}Input"
      input = input_class.constantize.new(input_attr, input_attr_value, input_attrs)

      form_body[:inputs] << input
    end

    def submit(text_for_button = 'Save')
      form_body[:submit][:options] = { type: 'submit', value: text_for_button }
    end
  end
end
