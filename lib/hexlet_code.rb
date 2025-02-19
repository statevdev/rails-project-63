# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, File.expand_path('hexlet_code/tag.rb', __dir__)
  autoload :FormBuilder, File.expand_path('hexlet_code/form_builder.rb', __dir__)
  autoload :Inputs, File.expand_path('inputs.rb', __dir__)
  autoload :FormRenderer, File.expand_path('hexlet_code/form_renderer.rb', __dir__)

  class Error < StandardError; end

  def self.form_for(entity, attributes = {})
    builded_form = FormBuilder.new(entity, attributes)
    yield(builded_form) if block_given?
    FormRenderer.render_html(builded_form.form_body)
  end
end

User = Struct.new(:name, :job, keyword_init: true)
user = User.new(name: 'rob', job: 'hexlet')

result = HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end

puts result
