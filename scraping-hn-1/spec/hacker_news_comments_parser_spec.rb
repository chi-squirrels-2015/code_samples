require_relative "../hacker_news_comments_parser"

describe HackerNewsCommentsParser do
  let(:html)   { open('./spec/post.html') }
  let(:parser) { HackerNewsCommentsParser.new(html) }

  describe "parsing comments" do
    it "creates a collection of comments" do
      parsed_comments = parser.parse_comments
      expect(parsed_comments.all? { |comment| comment.class == Comment}).to be true
    end

    it "creates the comments based on the html" do
      parsed_comments = parser.parse_comments
      expect(parsed_comments.find { |comment| comment.author == "Jasber" && comment.text =~ /\AI recently.*reliable\?\z/ }).to be_an_instance_of Comment
    end

    it "creates a comment object for each test on the page" do
      expect(parser.parse_comments.count).to eq 18
    end
  end
end
