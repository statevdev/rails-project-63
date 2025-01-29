# frozen_string_literal: true

module HexletCode
  # Class for generating HTML tags.
  class Tag
    # Generates an HTML tag.
    def self.build(name, attributes = {}, &_block)
      attrs = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
      attrs_string = attrs.empty? ? "" : " #{attrs}"

      if block_given?
        content = yield
        "<#{name}#{attrs_string}>#{content}</#{name}>"
      else
        "<#{name}#{attrs_string}>"
      end
    end
  end
end
