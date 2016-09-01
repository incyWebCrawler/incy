class Crawler

  def initialize(url)
    @url = url
    @processor = Processor.new(url)
    @content = Content.new
    @limit = 10
    @count = 1
  end

  def return_hash
    {url: @url, title: scrape_title, links_array: scrape_links, words: scrape_words}
  end

  def run_crawler
    results = return_hash
    Page.find_or_create_by(url: results[:url], title: results[:title],
                           links: results[:links_array].length,
                           words: results[:words])

    links = @processor.create_links(results)
    links.each {|el| Link.find_or_create_by(url: el) }
    new_url
    @content.export_content
  end

  def new_url
    if @count < @limit
      @url = Link.find(@count)[:url]
      @count += 1
      run_crawler
    end
  end

  private

  def scrape_links
    Nokogiri::HTML(open(@url)).css('a').map{|link| link.attribute('href').to_s}
  end

  def scrape_title
    Nokogiri::HTML(open(@url)).css('title').text
  end

  def scrape_words
    Nokogiri::HTML(open(@url)).css('p').text
  end

end
