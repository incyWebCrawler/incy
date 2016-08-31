class Crawler
  attr_reader :page
  
  def initialize(url)
    @url = url
  end

  def scrape
    @page = Nokogiri::HTML(open(@url)).css('a').map{|link| link.attribute('href').to_s}
    @title = Nokogiri::HTML(open(@url)).css('title').text
  end

  def return_hash
    {url: @url, title: @title, links_array: @page}
  end

end
