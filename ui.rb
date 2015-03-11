require_relative "scraper"


def print_nicely(arr)
  arr.each do |element|
    puts element
    puts "----------------------------------------------"
    puts "----------------------------------------------"
  end
  return nil
end


case
  when ARGV[0] == nil

  when !!(ARGV[0] =~ /https:\/\/news\.ycombinator\.com\/item\?id=[0-9]{7}/)
    p = make_post
    puts "Post title: #{p.title}"
    puts "Number of points: #{p.points}"
    puts "Author name: #{p.author}"
    puts "Number of comments: #{p.comments.count}"
    puts "Number of comments by OP: #{comments_by_author(p).count}"
    puts print_nicely(comments_by_author(p))

end