class Post
  attr_accessor :title, :url, :points, :item_id, :author, :date_authored, :comments
  def initialize(title, url, points, item_id, author, date_authored)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @author = author
    @date_authored = date_authored
    @comments = []
  end
  def add_comment(comment)
    @comments << comment
  end
  def add_all_comments(arr_of_comments)
    @comments = arr_of_comments
  end

  def add_comments_to_post(post)
    post.add_all_comments(populate_comments)
  end

  def comments_by_author(post)
  comments = []
    post.comments.each do |comment|
      if comment.author_name == post.author
        comments << comment.statement
      end
    end
    comments
  end
end
