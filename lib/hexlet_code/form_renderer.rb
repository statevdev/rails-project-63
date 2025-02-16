# frozen_string_literal: true

module HexletCode
  class FormRenderer
    def self.render_html(form_body)
      inputs = "\n"
      form_body[:inputs].each do |input|
        inputs += html_pair_check_and_select(input, input.to_h, input.value)
      end
      inputs += Tag.build(:input, form_body[:submit][:options]) unless form_body[:submit][:options].nil?
      Tag.build(:form, form_body[:form_options]) { inputs }
    end

    def self.html_pair_check_and_select(input_object, input_attrs, input_value)
      tag_name = input_object.class::TAG_NAME
      pair_bool = input_object.class::PAIRABLE

      label = Tag.build(:label, for: input_object.name) { input_object.name.to_s.capitalize }
      if pair_bool
        label + Tag.build(tag_name, input_attrs) { input_value }
      else
        label + Tag.build(tag_name, input_attrs)
      end
    end
  end
end
