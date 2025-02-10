# frozen_string_literal: true

class Tag
  def self.build(tag, _objects_hash, object_options = {}, &)
    tag_attrs_string = object_options.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
    return "<#{tag} #{tag_attrs_string}>" unless block_given?

    "<#{tag} #{tag_attrs_string}>#{yield}</#{tag}>"
  end
end
