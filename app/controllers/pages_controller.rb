class PagesController < ApplicationController

  def new
    @page = Page.new
    @link = Link.new
  end

  def create
    @page = Page.new
    if Link.last
      @last_link = Link.last.id
      @next_link = @last_link + 1
    else
      @next_link = 1
    end
    Link.delete_all
    url = params[:url]
    limit = params[:limit].to_i
    crawler = Crawler.new(url, limit, @next_link)
    crawler.run_crawler
    @results = Link.all
    render :index
  end
end
