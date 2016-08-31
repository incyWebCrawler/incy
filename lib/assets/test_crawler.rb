require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'

page = Nokogiri::HTML(open("http://www.makersacademy.com", :allow_redirections => :safe))
links_arr = []
links = page.css("a")
links.each{ |link| links_arr <<  link['href'] }

puts links_arr
puts links_arr.length
# itr = 0
#   links_arr.each do |link|
#     itr += 1
#     if itr == 5
#       break
#     elsif !link.include?('http')
#       link = 'http://www.makersacademy.com' + link
#     end
#     page = Nokogiri::HTML(open(link, :allow_redirections => :safe))
#     links = page.css("a")
#
#
#     links.each do |link|
#       puts link['href']
#       links_arr <<  link['href']
#     end
#   end

# puts links_arr
# puts links_arr.length
