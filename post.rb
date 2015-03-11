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
end