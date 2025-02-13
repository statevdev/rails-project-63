# frozen_string_literal: true

module HexletCode
  class HTMLTemplates
    def self.input(entity, input_attr, input_attrs)
      default_input_attrs = { name: input_attr, type: 'text', value: entity.public_send(input_attr) }
      merged_attrs = default_input_attrs.merge(input_attrs)

      label = self.label(entity, input_attr)
      input = Tag.build(:input, merged_attrs)
      "#{label}#{input}"
    end

    def self.text(entity, input_attr, input_attrs)
      default_input_attrs = { name: input_attr, cols: 20, rows: 40 }
      merged_attrs = default_input_attrs.merge(input_attrs)

      label = self.label(entity, input_attr)
      textarea = Tag.build(:textarea, merged_attrs) { entity.public_send(input_attr) }
      "#{label}#{textarea}"
    end

    def self.label(_entity, input_attr, input_attrs = {})
      default_input_attrs = { for: input_attr }
      merged_attrs = default_input_attrs.merge(input_attrs)

      Tag.build(:label, merged_attrs) { input_attr.to_s.capitalize }
    end

    def self.submit(_entity, _input_attr, text_for_button)
      submit_attrs = { type: 'submit', value: text_for_button }

      Tag.build(:input, submit_attrs)
    end
  end
end
