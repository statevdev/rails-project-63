# frozen_string_literal: true

require_relative "hexlet_code/version"

# Главный модуль библиотеки для генерации форм и html-тэгов.
module HexletCode
  class Error < StandardError; end

  autoload :Tag, File.expand_path("hexlet_code/tag.rb", __dir__)
  autoload :Inputs, File.expand_path("hexlet_code/tag.rb", __dir__)

  def self.form_for(user, form_options = {}, &)
    default_form_options = { action: form_options.delete(:url) || "#", method: "post" }

    merged_options = default_form_options.merge(form_options)

    if block_given?
      inputs = Inputs.new(user)

      yield(inputs)

      Tag.build(:form, user.to_h, merged_options) { "\n#{inputs.inputs.join("\n")}\n" }
    else
      Tag.build(:form, user.to_h, merged_options, &proc {})
    end
  end
end
