class Crawler
  LIMIT = 10
  def initialize(url, limit=Crawler::LIMIT, count)
    @url = url
    @processor = Processor.new(url)
    @limit = count + limit
    @arr = []
    @content = Content.new
    @count = count
  end

  def return_hash
    # Scraping words
    # {url: @url, title: scrape_title, links_array: scrape_links, words: scrape_words}

    # Not scraping words
    {url: @url, title: scrape_title, links_array: scrape_links}
  end

  def run_crawler
    create_page
    add_new_links
    new_url
    # export_content # experimental feature, doesn't work
  end

  def create_page
    @results = return_hash
    # Scraping words
    # Page.find_or_create_by(url: @results[:url], title: @results[:title], links: @results[:links_array].length, words: @results[:words])

    # Not scraping words
    Page.find_or_create_by(url: @results[:url], title: @results[:title], links: @results[:links_array].length)
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
    if @count < @limit
      @url = Link.find(@count)[:url]
      @count += 1
      run_crawler
    end
  end

  def export_content
    @content.export_content
  end

  def scrape_links
    begin
      Nokogiri::HTML(open(@url)).css('a').map{|link| link.attribute('href').to_s}
    rescue
      []
    end
  end

  def scrape_title
    begin
      Nokogiri::HTML(open(@url)).css('title').text
    rescue
      "404"
    end
  end


  def scrape_words
    begin
      Nokogiri::HTML(open(@url)).css('p').text
    rescue
      '404 error'
    end
  end

end
