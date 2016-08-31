require 'rails_helper'

describe 'Crawler' do

  before(:each) do
    @crawler = Crawler.new('http://www.makersacademy.com')
  end

  describe '#return_hash' do
    it 'returns a hash with url, title and links_array keys' do
      expect(@crawler.return_hash.keys).to include(:url, :title, :links_array)
    end

    it 'scrapes links and returns an array' do
      expect(@crawler.return_hash[:links_array]).to be_an(Array)
    end
    
    it "scraped links include 'http'" do
      expect(@crawler.return_hash[:links_array].to_s).to include("http")
    end
  end
end
