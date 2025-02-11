# frozen_string_literal: true

module HexletCode
  autoload :Tag, File.expand_path('tag.rb', __dir__)

  class HTMLTemplates
    def self.input(object, input_attr, input_attrs)
      default_input_attrs = { name: input_attr, type: 'text', value: object.public_send(input_attr) }
      merged_attrs = default_input_attrs.merge(input_attrs)

      label = self.label(object, input_attr)
      input = Tag.build(:input, object.to_h, merged_attrs)
      "#{label}\n#{input}"
    end

    def self.text(object, input_attr, input_attrs)
      default_input_attrs = { name: input_attr, cols: 20, rows: 40 }
      merged_attrs = default_input_attrs.merge(input_attrs)

      label = self.label(object, input_attr)
      textarea = Tag.build(:textarea, object.to_h, merged_attrs) { object.public_send(input_attr) }
      "#{label}\n#{textarea}"
    end

    def self.label(object, input_attr, input_attrs = {})
      default_input_attrs = { for: input_attr }
      merged_attrs = default_input_attrs.merge(input_attrs)

      Tag.build(:label, object.to_h, merged_attrs) { input_attr.to_s.capitalize }
    end
  end
end
