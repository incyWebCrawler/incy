class Crawler
  def scrap_links(url, limit_links)
    page = Nokogiri::HTML(open(url)).css('a').map{|link| link.attribute('href').to_s}
    title = Nokogiri::HTML(open(url)).css('title').text
    {url: url, title: title, links_array: page}
  end
end
