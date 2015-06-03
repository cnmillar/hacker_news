# You'll have to design the Comment object yourself. What attributes and methods should it support and why?
require 'nokogiri'
require './custom_exceptions.rb'

class Comment
	attr_reader :comment
	@@comment = []

	def initialize(comment, date)
		begin 
			raise ObjectTypeError if (comment == nil || date == nil)
		rescue ArgumentError
			puts "You should have two arguments."
		end
		# raise ObjectTypeError.new("Date argument should be an integer.") if !(date.is_a? Integer)
		@comment = comment
		@date = date
		@@comment << @comment
	end

	def self.all_comments
		@@comment
	end
end