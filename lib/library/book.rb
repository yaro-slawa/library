module Library
class Book

	attr_accessor :title, :author

	def initialize(title, author)
		@title = title
		@author = author
	end

	def ==(other)
		if other.is_a? Book
			@title == other.title && @author == other.author
		else
			false
		end
	end

	def to_s
		"#{@title} #{@author}"
	end
end
end