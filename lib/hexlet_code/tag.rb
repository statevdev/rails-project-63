# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %i[input img br].freeze

    def self.build(tag, options = {}, &)
      tag_options = options.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      return "<#{tag} #{tag_options}>\n" unless block_given?

      "<#{tag} #{tag_options}>#{yield}</#{tag}>\n"
    end
  end
end
