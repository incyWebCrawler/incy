class PagesController < ApplicationController
  def new
    @page = Page.new
    @link = Link.new
  end

  def create
    url = params[:page][:url]
    crawler = Crawler.new(url)
    crawler.run_crawler
    @result = Link.all
    render :new
  end



end
