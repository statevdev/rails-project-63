# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, File.expand_path('hexlet_code/tag.rb', __dir__)
  autoload :FormBuilder, File.expand_path('hexlet_code/form_builder.rb', __dir__)
  autoload :Inputs, File.expand_path('hexlet_code/inputs.rb', __dir__)
  autoload :HTMLTemplates, File.expand_path('hexlet_code/html_templates.rb', __dir__)
  autoload :FormRenderer, File.expand_path('hexlet_code/form_renderer.rb', __dir__)

  class Error < StandardError; end

  def self.form_for(entity, attributes = {})
    builded_form = FormBuilder.new(entity, attributes)
    yield(builded_form) if block_given?
    FormRenderer.render_html(builded_form.form_body)
  end
end

# User = Struct.new(:name, :job, keyword_init: true)
# user = User.new job: 'hexlet'

# result = HexletCode.form_for user do |f|
#   f.input :job
#   f.submit
#   f.submit 'Wow'
# end
# puts result

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input type="submit" value="Save">
# </form>
