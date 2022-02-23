[![Actions Status](https://github.com/alek-pol/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/alek-pol/rails-project-lvl1/actions)
[![CI](https://github.com/alek-pol/test1/actions/workflows/CI.yml/badge.svg)](https://github.com/alek-pol/rails-project-lvl1/actions)

# HexletCode

Form generator (Hexlet project 1)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = @user.new(name: 'rob', job: 'hexlet', gender: 'm')

form = HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end

puts form

# <form action="#" method="post">
# <input type="text" value="rob" name="name">
# <textarea cols="20" rows="40" name="job">hexlet</textarea>
# </form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alek_pol/hexlet_code.
