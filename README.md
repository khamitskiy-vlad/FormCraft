# FormCraft

<img src="https://i.ibb.co/DGtzMK2/Form-Craft.png" width="200">

[![CI](https://github.com/khamitskiy-vlad/FormCraft/actions/workflows/ci.yml/badge.svg)](https://github.com/khamitskiy-vlad/FormCraft/actions/workflows/ci.yml)

**FormCraft** — DSL form generator for create light HTML forms.

This library takes care about tasks that usually require writing a lot of routine code, such as error handling. It is inspired by [Simple Form](https://github.com/heartcombo/simple_form) for Rails, but conceptually simpler.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add form_craft --git 'https://github.com/khamitskiy-vlad/FormCraft.git'

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install specific_install 
    $ gem specific_install -l 'https://github.com/khamitskiy-vlad/FormCraft.git'

## Usage

Сreate the necessary struct, class object and set attributes.

For example, you can call the `.form_for()` method for class instance variable without url path. Then specify the keys from the struct in the argument of `.input()` method. After call the `.submit()`. If you haven't set values for the struct keys, or haven't set destination `url:`, generator will add them by default:

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new

FormCraft.form_for user do |f|
  f.input :name
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="">
#   <input type="submit" value="Save">
# </form>
```

Option `as:` with `:text` will generate a `<textarea>` form. The default row and col values ​​are 40 and 20. But you can set them yourself, such as another options or attributes. Let's look at the full usage of the generator:

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

FormCraft.form_for user, url: '/users', method: :get, class: 'hexlet-code' do |f|
  f.input :job, as: :text, rows: 50, cols: 50
  f.input :job, as: :text, label: false
  f.input :name, class: 'user-input'
  f.input :gender, type: 'color', label: false
  f.submit 'Wow', class: 'user-submit'
end

# <form action="/users" method="get" class="hexlet-code">
#   <label for="job">Job</label>
#   <textarea rows="50" cols="50" name="job">hexlet</textarea>
#   <textarea rows="40" cols="20" name="job">hexlet</textarea>
#   <label for="name">Name</label>
#   <input name="name" type="text" value="rob" class="user-input">
#   <input name="gender" type="color" value="m">
#   <input type="submit" value="Wow" class="user-submit">
# </form>
```

If you try to specify a key that is not in the struct members, you will receive an error:

```ruby
FormCraft.form_for user do |f|
  f.input :age
end

# `public_send': undefined method `age' for #<struct User name="rob", job="hexlet", gender="m"> (NoMethodError)
```

### Input options

* **`as:` `:text`** - provides replacement of the `<input>` tag with `<textarea>`;

* **`type:` `'foo'`** - provides a change of the input type, for example `type="color"` instead of default `"text"`;

* **`label:` `false`** - provides that the label tag field is disabled for input or textarea tag fields.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/khamitskiy-vlad/form_craft. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/khamitskiy-vlad/form_craft/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FormCraft project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/khamitskiy-vlad/form_craft/blob/main/CODE_OF_CONDUCT.md).
