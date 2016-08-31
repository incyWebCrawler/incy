class Crawler

  def initialize(url)
    @url = url
    @processing = Process.new
  end

  def return_hash
    {url: @url, title: scrape_title, links_array: scrape_links}
  end

  private

  def scrape_links
    Nokogiri::HTML(open(@url)).css('a').map{|link| link.attribute('href').to_s}
  end

  def scrape_title
    Nokogiri::HTML(open(@url)).css('title').text
  end

end
