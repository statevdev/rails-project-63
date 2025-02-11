# frozen_string_literal: true

module HexletCode
  class FormRenderer
    def self.to_html(tag, object, input_attr, input_attrs)
      HTMLTemplates.send(tag, object, input_attr, input_attrs)
    end
  end
end
