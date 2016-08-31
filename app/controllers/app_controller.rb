class AppController < ApplicationController
  def new
    @page = Page.new
    @link = Link.new
  end

  def create
    crawler = Crawler.new(params[:page][:url])
    results = crawler.return_hash
    @page = Page.create(url: results[:url], title: results[:title], links: results[:links_array])
    @processor = Processor.new(results)
    links = @processor.create_links
    links.each {|el| Link.create(url: el)}

  end
end
