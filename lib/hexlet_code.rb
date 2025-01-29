# frozen_string_literal: true

require_relative "hexlet_code/version"

# Module for HexletCode, a library for generating HTML tags.
module HexletCode
  class Error < StandardError; end

  autoload :Tag, "./hexlet_code/tag.rb"
end
