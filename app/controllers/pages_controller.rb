class PagesController < ApplicationController
  def new
    @page = Page.new
    @link = Link.new
    @limit = 100
  end

  def create
    crawler = Crawler.new(params[:page][:url])
    results = crawler.return_hash
    @page = Page.create(url: results[:url], title: results[:title], links: results[:links_array])
    @processor = Processor.new(results)
    links = @processor.create_links
    links.each {|el| Link.create(url: el)}
    loop
    @results = Link.all
    render :new
  end

  def loop
    i = 1
    while i < 5 do
      crawler = Crawler.new(Link.find(i)[:url])
      results = crawler.return_hash
      @page = Page.create(url: results[:url], title: results[:title], links: results[:links_array])
      @processor = Processor.new(results)
      links = @processor.create_links
      links.each {|el| Link.create(url: el)}
      i += 1
      puts i
    end
  end

end
