class PagesController < ApplicationController
  def new
    @page = Page.new
    @link = Link.new
  end

  def create
    @page = Page.new
    url = params[:page][:url]
    crawler = Crawler.new(url)
    crawler.run_crawler
    @results = Link.all
    render :new
  end
end
