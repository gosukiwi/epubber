# Epubber
This gem allows you to easily build EPUB files programatically.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'epubber'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install epubber

## Usage
Epubber's DSL is rather simple:

```ruby
path = Epubber.generate do
  title 'My First EPUB book'
  author 'Ramirez, Federico'
  description 'This is an example EPUB'
  url 'http://my-url.com'

  chapter do
    title 'Chapter 1'
    content '<p>This is some content!</p>'
  end

  chapter do
    title 'Chapter 2'
    content '<p>Some more content this is.</p>'
  end
end

# Now the `path` variable contains the full path of the generated EPUB file.
# Defaults to `#{title}.epub`
``` 

You can configure the generator 

```ruby
path = Epubber.generate filename: 'some-file.epub', workspace: '/tmp' do
  # Ebook code here...
end
``` 

## Contributing

1. Fork it ( https://github.com/gosukiwi/epubber/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
