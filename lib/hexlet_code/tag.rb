# frozen_string_literal: true

module HexletCode
  # Класс для генерации HTML-тэгов.
  class Tag
    def self.build(name, attributes = {}, &)
      attrs = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")

      attrs_string = attrs.empty? ? "" : " #{attrs}"

      if block_given?
        content = yield
        "<#{name}#{attrs_string}>#{content}</#{name}>"
      else
        "<#{name}#{attrs_string}>"
      end
    end

    def self.tag(name, default_attrs = {}, &)
      lambda do |user, attr, attrs = {}|
        merged_attrs = build_attributes(user, attr, default_attrs, attrs)
        process_block(name, merged_attrs, user, attr, &)
      end
    end

    class << self
      define_method(:text, Tag.tag(:textarea, name: :user_attr, cols: "20", rows: "40", &proc {}))
      define_method(:input, Tag.tag(:input, name: :user_attr, type: "text", value: :user_attr_value))
      define_method(:label, Tag.tag(:label, for: :user_attr, &proc {}))
      define_method(:select, Tag.tag(:select, name: :user_attr_value))
    end

    def self.build_attributes(user, attr, default_attrs, attrs)
      result = default_attrs.transform_values do |value|
        case value
        when :user_attr then attr
        when :user_attr_value then user.send(attr)
        else value
        end
      end
      result.merge(attrs)
    end

    def self.process_block(name, attrs, user, attr, &)
      if block_given?
        build(name, attrs) { user.send(attr) }
      else
        build(name, attrs)
      end
    end
  end
end
