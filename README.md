# Library

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'library'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install library

## Usage

```ruby
require 'library'

# You can create empty library

lib = Library::Library.new

# or you can load library from file

lib = Library::Library.load("filepath")

# You can add more authors, books, readers and orders

author_tolstoi = Library::Author.new("Lev Tolstoi", "Biography")
author_pushkin = Library::Author.new("Alexander Pushkin", "Biography")

book_tolstoi1 = Library::Book.new("War and Peace", author_tolstoi)
book_tolstoi2 = Library::Book.new("Anna Karenina", author_tolstoi)
book_tolstoi3 = Library::Book.new("Hadji Murad", author_tolstoi)
book_pushkin1 = Library::Book.new("Eugene Onegin", author_pushkin)
book_pushkin2 = Library::Book.new("The Gypsies", author_pushkin)

reader1 = Library::Reader.new("Matthew Perry", "matt@org.com", "Los Angeles", "1st street", "1A")
reader2 = Library::Reader.new("Courteney Cox", "courteney@org.com", "Los Angeles", "2nd street", "1A")
reader3 = Library::Reader.new("David Schwimmer", "david@org.com", "Los Angeles", "3rd street", "1A")

lib.add_order(Library::Order.new(book_tolstoi1, reader1))
lib.add_order(Library::Order.new(book_tolstoi1, reader1))
lib.add_order(Library::Order.new(book_tolstoi1, reader1))
lib.add_order(Library::Order.new(book_pushkin1, reader2))
lib.add_order(Library::Order.new(book_pushkin2, reader2))
lib.add_order(Library::Order.new(book_pushkin2, reader3))

readers_of_tolstoi1 = lib.often_takes_book(book_tolstoi1)

pop_book = lib.popular_book

pop_books_readers = lib.popular_books_readers

lib.save("filepath")

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/library/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
