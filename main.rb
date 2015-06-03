require './post_class.rb'
require './comment_class.rb'
require 'nokogiri'
require 'pry'
require 'open-uri'
require 'colorize'
require 'date'

website = ARGV[0]
read_in_html = system 'curl #{website} > post.html'
html_file = open(website)
doc = Nokogiri::HTML(html_file)

# 1.  Instantiate a Post object
title = doc.search('.title > a:first-child').map { |link| link.inner_text}
url = 'https://news.ycombinator.com/item?id=7663775'
points = doc.search('.subtext > span:first-child').map { |span| span.inner_text}[0].split[0].to_i
item_id = doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }[0]
item_id.slice! "item?id="

new_post = Post.new(title, url, points, item_id)

# 2. Parses the Hacker News HTML
post_comments = doc.search('.comment > font:first-child').map { |font| font.inner_text}
days_ago = doc.search('.comhead > a:nth-child(2)').map { |days| days.inner_text}
days_ago.each {|days| days.slice! " days ago"}

# 3. Instantiate a Comment object for every comment in post.html
post_comments.each_with_index do |comment, index|
	post_date = Date.today - days_ago[index].to_i
	Comment.new(comment,post_date)
end
puts Comment.all_comments

# 4. Add comment to post

		begin 
			raise ObjectTypeError if (comment == nil || date == nil)
		rescue ArgumentError
			puts "You should have two arguments."
		end


comment = Comment.new(post_comments[0], 5)
new_post.add_comment(comment)
puts new_post.comments.inspect.colorize(:blue)

