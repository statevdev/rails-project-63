# frozen_string_literal: true

module HexletCode
  module Inputs
    autoload :BaseInput, File.expand_path('hexlet_code/inputs/base_input', __dir__)
    autoload :StringInput, File.expand_path('hexlet_code/inputs/string_input', __dir__)
    autoload :TextInput, File.expand_path('hexlet_code/inputs/text_input', __dir__)
  end
end
