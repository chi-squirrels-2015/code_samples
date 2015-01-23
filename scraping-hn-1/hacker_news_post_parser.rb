require 'nokogiri'
require_relative 'comment.rb'
require_relative 'post.rb'

class HackerNewsPostParser
  def initialize(html, comments = [])
    @document = parse(html)
    @comments = comments
  end

  def create_post
    Post.new(
      { :author   => post_author,
        :points   => post_points,
        :url      => post_url,
        :title    => post_title,
        :comments => @comments }
    )
  end

  def post_author
    @document.css(".subtext > a").first.inner_text
  end

  def post_points
    @document.search('.subtext > span:first-child').first.inner_text
  end

  def post_title
    @document.search('.title > a:first-child').first.inner_text
  end

  def post_url
    @document.search('.title > a:first-child').map { |link| link['href']}.first
  end

  private
  def parse(html)
    Nokogiri::HTML(html)
  end
end
