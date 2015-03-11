require "open-uri"
require "nokogiri"
require "pry"
require_relative "comment"
require_relative "post"

website = ARGV[0]
@doc = Nokogiri::HTML(open(website))

##### ------- Scrap Helper Methods ------------- ######
def grab_text(arr)
array_of_blank = []
  arr.each do |content|
    array_of_blank << content.text()
  end
  return array_of_blank
end

def populate_comments
  commentarr = []
  get_comments.each do |comment|
    commentarr << Comment.new(comment[0],comment[1],comment[2])
  end
  return commentarr
end

#### ------- Comment Information Scrape ------------- ######
def get_statement
  statement = grab_text(@doc.xpath("//td/table[2]//span[contains(@class, 'comment')]"))
end
def get_names
  names = grab_text(@doc.xpath("//td/table[2]//span[contains(@class, 'comhead')]/a[1]"))
end
def get_dates
  dates = grab_text(@doc.xpath("//td/table[2]//span[contains(@class, 'comhead')]/a[2]"))
end
def get_comments
  all_comments = get_names.zip(get_statement,get_dates)
end

##### ------- Post Information Scrape ------------- ######
def get_title
  title = (@doc.xpath("//td/table[1]//td[contains(@class, 'title')]/a")).text()
end
def get_url
  url = "https://news.ycombinator.com/" + (@doc.xpath("//td/table[1]//td[contains(@class, 'subtext')]/a[2]/@href")).text()
end
def get_points
  score = (@doc.xpath("//td/table[1]//span[contains(@class, 'score')]")).text()
end
def get_author
  author = (@doc.xpath("//td/table[1]//td[contains(@class, 'subtext')]/a[1]")).text()
end
def get_date_authored
  date_authored = (@doc.xpath("//td/table[1]//td[contains(@class, 'subtext')]/a[2]")).text()
end
def get_item_id
  (@doc.xpath("//td/table[1]//td[contains(@class, 'subtext')]/a[2]/@href")).text().delete("^0-9").to_i
end
####### ---------------- Content Generation ------------------- ########
def make_post
  post = Post.new(get_title, get_url, get_points, get_item_id, get_author, get_date_authored)
  add_comments_to_post(post)
  return post
end

def add_comments_to_post(post)
  post.add_all_comments(populate_comments)
end

def comments_by_author(post)
  comments = []
  @comments.each do |comment|
    if comment.author_name == post.author
      comments << comment
    end
  end
  return comments
end
