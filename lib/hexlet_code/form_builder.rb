# frozen_string_literal: true

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
      input_type = input_attrs.delete(:as) || :input
      input_attr_value = @entity.public_send(input_attr)
      input_class = case input_type
                    when :text
                      Inputs::TextInput.new(input_attr, input_attr_value, input_attrs)
                    when :input
                      Inputs::StringInput.new(input_attr, input_attr_value, input_attrs)
                    end

      form_body[:inputs] << input_class
    end

    def submit(text_for_button = 'Save')
      form_body[:submit][:options] = { type: 'submit', value: text_for_button }
    end
  end
end
