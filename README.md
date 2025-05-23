[![CI Status](https://github.com/statevdev/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/statevdev/rails-project-63/actions)
[![Hexlet-Checkout Status](https://github.com/statevdev/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/statevdev/rails-project-63/actions)

# HexletCode

This gem provides an easy-to-use interface for creating HTML forms.

## Installation

Add this line to your Gemfile:

```bash
gem 'hexlet_code', git: 'https://github.com/statevdev/rails-project-63.git'
```

Then execute:

```bash
bundle install
```

## Usage
To create a form, you need to pass in a data structure about its future fields, here is an example of such a structure:
```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new(name: 'rob', job: 'hexlet')
```

The required form fields are passed through the block to the `form_for` method:
```ruby
HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end
```

In the output we get:
```ruby
# <form action="#" method="post">
#<input name="name" type="text" value="rob">
#<textarea name="job" cols="20" rows="40">hexlet</textarea>
# </form>
```


