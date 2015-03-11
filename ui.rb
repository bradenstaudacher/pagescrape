require_relative "scraper"

case

when ARGV[0] == nil

when !!(ARGV[0] =~ /https:\/\/news\.ycombinator\.com\/item\?id=[0-9]{7}/)
  p = make_post
  puts "Post title: #{p.title}"
  puts "Number of points: #{p.points}"
  puts "Author name: #{p.author}"
  puts "Number of comments #{p.comments.count}"
  puts "Comments by OP: #{comments_by_author(p)}"
else
  puts "Invalid URL"
end