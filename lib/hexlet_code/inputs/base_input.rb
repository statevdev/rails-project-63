# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      attr_accessor :name, :value

      def initialize(name, value, input_attrs = {})
        @name = name
        @value = value
        @input_attrs = input_attrs
      end
    end
  end
end
