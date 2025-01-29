# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, attributes = {}, &block)
      attrs = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      attrs_string = attrs.empty? ? '' : " #{attrs}"

      if block_given?
        content = yield
        "<#{name}#{attrs_string}>#{content}</#{name}>"
      else
        "<#{name}#{attrs_string}>"
      end
    end
  end
end
