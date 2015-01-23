require_relative "../comment"

describe Comment do
  let(:comment) { Comment.new({author: "Jim", text: "Comment text" }) }

  describe "attributes" do
    it "has an author" do
      expect(comment.author).to eq "Jim"
    end

    it "has text" do
      expect(comment.text).to eq "Comment text"
    end
  end
end
