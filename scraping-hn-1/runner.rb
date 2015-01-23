require_relative 'post'
require_relative 'hacker_news_post_parser'
require_relative 'hacker_news_comments_parser'
require_relative 'comment'
require_relative 'post_viewer'

require 'open-uri'


if ARGV.any?

  url = ARGV.first
  html = open(url).read


  comments_parser = HackerNewsCommentsParser.new(html)
  comments = comments_parser.parse_comments

  post_parser = HackerNewsPostParser.new(html, comments)
  post = post_parser.create_post

  PostViewer.render post
end
