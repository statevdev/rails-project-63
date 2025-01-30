# frozen_string_literal: true

require_relative "hexlet_code/version"

# Module for HexletCode, a library for generating HTML tags.
module HexletCode
  class Error < StandardError; end

  autoload :Tag, File.expand_path("hexlet_code/tag.rb", __dir__)

  def self.form_for(_user, **attrs, &)
    attrs = { "action" => attrs.delete(:url) || "#", "method" => "post" }.merge(attrs)
    HexletCode::Tag.build("form", attrs, &proc {})
  end

  def self.create_user(*fields, **options)
    options[:keyword_init] ||= true
    Struct.new(*fields, **options).new
  end
end

# user = HexletCode.create_user(:name, :job)
# user.name = 'rob'
#
# puts HexletCode.form_for(user)
# puts HexletCode.form_for(user, class: 'hexlet-form')
# puts HexletCode.form_for(user, url: '/profile', class: 'hexlet-form')
