require_relative '../hacker_news_post_parser'

describe HackerNewsPostParser do
  let(:html)   { open('./spec/post.html') }
  let(:parser) { HackerNewsPostParser.new(html) }

  describe "parsing the html" do
    it "finds the post's author" do
      expect(parser.post_author).to eq "ankneo"
    end

    it "finds the post's points" do
      expect(parser.post_points).to eq "53 points"
    end

    it "finds the post's title" do
      expect(parser.post_title).to eq "A/B testing mistakes"
    end

    it "finds the post's url" do
      expect(parser.post_url).to eq "http://visualwebsiteoptimizer.com/split-testing-blog/seven-ab-testing-mistakes-to-stop-in-2013/"
    end
  end

  describe "makes posts from Hacker News HTML" do
    it "returns a Post object" do
      expect(parser.create_post).to be_an_instance_of Post
    end

    it "accurately assigns the author" do
      expect(parser.create_post.author).to eq "ankneo"
    end
  end


end
