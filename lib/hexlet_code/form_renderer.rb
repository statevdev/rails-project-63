# frozen_string_literal: true

module HexletCode
  class FormRenderer
    def self.render_html(form_body)
      inputs = "\n"
      form_body[:inputs].each do |input|
        inputs += HTMLTemplates.send(input[0], input[1], input[2], input[3]).to_s
      end
      Tag.build(:form, form_body[:form_options]) { inputs }
    end
  end
end
