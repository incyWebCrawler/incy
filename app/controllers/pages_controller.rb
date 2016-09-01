class PagesController < ApplicationController

  def new
    @page = Page.new
    @link = Link.new
  end

  def create
    @page = Page.new
    url = params[:url]
    limit = params[:limit].to_i
    crawler = Crawler.new(url, limit)
    crawler.run_crawler
    @results = Link.all
    render :index
  end
end
