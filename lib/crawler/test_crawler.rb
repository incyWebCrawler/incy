require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'

page = Nokogiri::HTML(open("http://www.makersacademy.com", :allow_redirections => :safe))
links_arr = []
links = page.css("a")
links.each{ |link| links_arr <<  link['href'] }

puts links_arr
puts links_arr.length
