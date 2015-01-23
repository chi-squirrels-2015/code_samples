class PostViewer
  def self.render(post)
    output_base = <<POST
Hacker News Post:  #{post.title}
- author:  #{post.author}
- points:  #{post.points}
- url:     #{post.url}


- comments:
POST

    output = post.comments.each_with_object(output_base) do |comment, output|
               output << "\n#{comment.text}\n  - #{comment.author}\n\n"
             end

    puts output
  end
end
