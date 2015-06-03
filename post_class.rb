require "./comment_class"
require "colorize"

class Post
	attr_reader :comments

	def initialize(title, url, points, item_id)
		@title = title
		@url = url
		@points = points
		@item_id = item_id
		@comments = []
	end

	def add_comment(comment_object)
		raise ObjectTypeError, "Please provide an object of class Comment." if !(comment_object.is_a? Comment)
		@comments << comment_object
	end
end