require "open-uri"
require "nokogiri"
require "pry"
require_relative "post"

begin
@doc = Nokogiri::HTML(File.open('post.html'))
rescue
  "No file provided"
end