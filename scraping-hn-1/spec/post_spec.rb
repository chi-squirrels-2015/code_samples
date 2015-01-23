require_relative "../post.rb"

describe Post do
  let(:post) do
    Post.new(
      { :author   => "Tom",
        :points   => 10,
        :url      => "my_url",
        :title    => "Cool Thing",
        :comments => ["comments"] }
    )
  end

  describe "attributes" do
    it "has an author" do
      expect(post.author).to eq "Tom"
    end

    it "has points" do
      expect(post.points).to eq 10
    end

    it "has a url" do
      expect(post.url).to eq "my_url"
    end

    it "has a title" do
      expect(post.title).to eq "Cool Thing"
    end

    it "has comments" do
      expect(post.comments).to match_array ["comments"]
    end
  end

  describe "#add_comment" do
    it "adds a comment to comments" do
      expect{ post.add_comment "new comment" }.to change{ post.comments.include? "new comment" }.from(false).to(true)
    end
  end
end
