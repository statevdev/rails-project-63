# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(tag, object_options = {}, &)
      tag_attrs_string = object_options.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      return "<#{tag} #{tag_attrs_string}>\n" unless block_given?

      "<#{tag} #{tag_attrs_string}>#{yield}</#{tag}>\n"
    end
  end
end
