# Pdf2htmlDocker

This gem is the same as [pdf2html](https://github.com/oshchyhol/pdf2html) but instead of requiring the library **Pdf2HtmlEX** library installed in the OS host, just need **docker**.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pdf2html_docker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pdf2html_docker

**Note:** Make sure that you have docker installed in your OS, if not it will throw a **CommandNotFound** exception.

## Usage

```ruby
 Pdf2htmlDocker.convert "/path/to/document.pdf", { option: "value", option: "value2" }, "output_file.html"

> Pdf2htmlDocker.convert "/home/enmanuel/document.pdf", { dest_dir: "/home/enmanuel/" }
```

**Note:** The name of the output file and the options are optional, it works without it. If you put a mistaken option it will ignore it.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/enmanuelm19/pdf2html_docker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pdf2htmlDocker project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/enmanuelm19/pdf2html_docker/blob/master/CODE_OF_CONDUCT.md).
