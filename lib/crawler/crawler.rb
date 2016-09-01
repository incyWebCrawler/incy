class Crawler
  LIMIT = 10
  def initialize(url, limit=Crawler::LIMIT)
    @url = url
    @processor = Processor.new(url)
    @limit = limit
    @arr = []
  end

  def return_hash
    {url: @url, title: scrape_title, links_array: scrape_links}
  end

  def run_crawler
    @results = return_hash
    Page.find_or_create_by(url: @results[:url], title: @results[:title], links: @results[:links_array].length)
    links = @processor.create_links(@results)
    links.each {|el|
        Link.create(url: el) if !@arr.include? el
        @arr << el
    }
    @arr.uniq!
    new_url
  end

  def new_url
    @count ||= 1
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

end
