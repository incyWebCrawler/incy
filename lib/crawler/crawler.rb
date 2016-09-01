class Crawler
  LIMIT = 50
  def initialize(url, limit=Crawler::LIMIT)
    @url = url
    @processor = Processor.new(url)
    @limit = limit
    @arr = []
    @content = Content.new
  end

  def return_hash
    {url: @url, title: scrape_title, links_array: scrape_links, words: scrape_words}
  end

  def run_crawler
    create_page
    add_new_links
    new_url
    @content.export_content
  end

  def create_page
    @results = return_hash
    Page.find_or_create_by(url: @results[:url], title: @results[:title], links: @results[:links_array].length, words: @results[:words])
  end

  def add_new_links
    links = @processor.create_links(@results)
    links.each {|el|
        Link.create(url: el) if !@arr.include? el
        @arr << el
    }
    remove_duplicates
  end

  def remove_duplicates
    @arr.uniq!
  end

  def new_url
    @count ||= 1
    if @count <= @limit
      @url = Link.find(@count)[:url]
      @count += 1
      run_crawler
    end
  end

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
