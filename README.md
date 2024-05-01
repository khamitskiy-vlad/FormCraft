# HexletCode
[![CI](https://github.com/khamitskiy-vlad/rails-project-63/actions/workflows/ci.yml/badge.svg)](https://github.com/khamitskiy-vlad/rails-project-63/actions/workflows/ci.yml) [![hexlet-check](https://github.com/khamitskiy-vlad/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/khamitskiy-vlad/rails-project-63/actions/workflows/hexlet-check.yml)


**HexletCode** - DSL form generator for create light HTML forms.

This library takes care about tasks that usually require writing a lot of routine code, such as error handling. It is inspired by [Simple Form](https://github.com/heartcombo/simple_form) for Rails, but conceptually simpler.

## Installation

TODO: Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

## Usage
Сreate the necessary struct, class object and set attributes.

For example, you can call the `.form_for()` method for class instance variable without url path. Then specify the keys from the struct in the `.input()` method options. If you haven't set values for the struct key, or haven't set `url:`, generator will add them by default:

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new

HexletCode.form_for user do |f|
  f.input :name
end

# <form action="#" method="post">
#   <input name="name" type="text" value="name">
# </form>
```

Option `as:` with `:text` will generate a `<textarea>` form. The default row and col values ​​are 40 and 20. But you can set them yourself. Let's look at the full usage of the generator:

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user, url: '/users' do |f|
  f.input :job, as: :text
  f.input :job, as: :text, rows: 50, cols: 50
  f.input :name, class: 'user-input'
end

# <form action="/users" method="post">
#   <textarea rows="40" cols="20" name="job">hexlet</textarea>
#   <textarea rows="50" cols="50" name="job">hexlet</textarea>
#   <input name="name" type="text" value="rob" class="user-input">
# </form>
```

If you try to specify a key that is not in the struct, you will receive an error:

```ruby
HexletCode.form_for user do |f|
  f.input :age
end

# RuntimeError: Undefined tag 'age' for {:name=>"rob", :job=>"hexlet", :gender=>"m"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/main/CODE_OF_CONDUCT.md).
