# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      TAG_NAME = :textarea
      COLS = 20
      ROWS = 40
      PAIRABLE = true

      def to_h
        { name: name, cols: COLS, rows: ROWS }.merge(@input_attrs)
      end
    end
  end
end
