class Post
  attr_reader :author, :points, :url, :title, :comments

  def initialize(args)
    @author = args[:author]
    @points = args[:points]
    @url = args[:url]
    @title = args[:title]
    @comments = args[:comments]
  end

  def add_comment(new_comment)
    comments << new_comment
  end
end
