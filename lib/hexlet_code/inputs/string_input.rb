# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      TAG_NAME = :input
      TYPE = :text
      PAIRABLE = false

      def to_h
        { name: name, type: TYPE, value: @value }.merge(@input_attrs)
      end
    end
  end
end
