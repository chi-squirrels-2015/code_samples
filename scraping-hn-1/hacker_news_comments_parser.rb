class HackerNewsCommentsParser

  def initialize(html)
    @document = parse(html)
  end

  def parse_comments
    raw_comments.map do |comment_data|
      comment_author = comment_data.css(".comhead > a:first-child").first.inner_text
      comment_text   = comment_data.css(".comment font").first.inner_text

      Comment.new(author: comment_author, text: comment_text )
    end
  end

  private
  def parse(html)
    Nokogiri::HTML(html)
  end

  def raw_comments
    @document.css(".default")
  end
end
