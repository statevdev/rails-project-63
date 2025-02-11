# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, File.expand_path('hexlet_code/tag.rb', __dir__)
  autoload :FormBuilder, File.expand_path('hexlet_code/form_builder.rb', __dir__)

  class Error < StandardError; end

  def self.form_for(object, form_options = {}, &)
    default_form_options = { action: form_options.delete(:url) || '#', method: 'post' }

    merged_options = default_form_options.merge(form_options)

    if block_given?
      inputs = FormBuilder.new(object)

      yield(inputs)

      Tag.build(:form, object.to_h, merged_options) { "\n#{inputs.form_body.join("\n")}\n" }
    else
      Tag.build(:form, object.to_h, merged_options, &proc {})
    end
  end
end
