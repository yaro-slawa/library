require 'library/version'
require 'library/book'
require 'library/author'
require 'library/order'
require 'library/reader'
require 'yaml'

module Library
  class Library

	attr_accessor :books, :orders, :readers, :authors

	def initialize
		@books = []
		@readers = []
		@authors = []
		@orders = []
	end

	def add_author(author)
		@authors << author
	end

	def add_book(book)
		@books << book
	end

	def add_reader(reader)
		@readers << reader
	end

	def add_order(order)
		@orders << order
	end

	def often_takes_book(book)
		readers = @orders.collect{ |order| order.reader if order.book == book }				
		readers.uniq!.inject(Hash.new(0)) { |total, e| total[e] += 1; total }.max_by{ |k, v| v }.first
	end

	def popular_book
		books = @orders.collect { |order| order.book }
		books.inject(Hash.new(0)) { |total, e| total[e] += 1; total }.max_by{ |k, v| v }.first
	end

	def popular_books_readers
		books = @orders.collect { |order| order.book }
		books.inject(Hash.new(0)) { |total, e| total[e] += 1; total }.sort_by{ |k, v| v }.reverse![0..2]
	end

	def save(filename)
		f = File.open(filename, "w")
		f.write(YAML::dump(self))
		f.close
	end

	def self.load(filename)
		obj = File.read(filename)
		YAML::load(obj)
		f.close
	end
  end
end