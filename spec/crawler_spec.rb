require 'rails_helper'

describe 'Crawler' do

  before(:each) do
    @crawler = Crawler.new('http://www.makersacademy.com')
    @crawler.scrape
  end

  describe '#scrape' do

    it 'scrapes links and returns an array' do
      expect(@crawler.page).to be_an(Array)
    end
    it "scraped links include 'http'" do
      expect(@crawler.page.to_s).to include("http")
    end
  end
  describe '#return_hash' do
    it 'returns a hash with url, title and links_array keys' do
      expect(@crawler.return_hash.keys).to include(:url, :title, :links_array)
    end
  end
end
