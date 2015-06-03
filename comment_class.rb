# You'll have to design the Comment object yourself. What attributes and methods should it support and why?
require 'nokogiri'
require './custom_exceptions.rb'

class Comment
	attr_reader :comment
	@@comment = []

	def initialize(comment, date)
		@comment = comment
		@date = date
		@@comment << @comment
	end

	def self.all_comments
		@@comment
	end
end