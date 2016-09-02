require 'rails_helper'

describe 'Crawler' do

  before(:each) do
    @crawler = Crawler.new('http://www.makersacademy.com', 1)
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

  describe '#create_page' do

    before(:each) do
      @crawler = Crawler.new('https://www.gumtree.com/', 1)
    end

    it 'saves visited page to the database' do
      expect{@crawler.create_page}.to change{Page.count}.by (1)
    end
  end


  describe '#run_crawler' do

    context 'multiple passes' do

      before(:each) do
        @crawler = Crawler.new('http://www.makersacademy.com', 4)
      end

      it 'saves visited pages to the database' do
        expect{@crawler.run_crawler}.to change{Page.count}.by (11)
      end
    end
  end

  # describe '#add_new_links' do
  #
  #   before(:each) do
  #     @crawler = Crawler.new('https://www.gumtree.com/', 1)
  #   end
  #
  #   xit "adds links to the 'to visit' table" do
  #     processor = instance_double(@crawler.processor)
  #     allow(processor).to receive(:create_links).and_return([url:'https://www.gumtree.com/'])
  #     expect{@crawler.add_new_links}.to change{Link.count}.by (1)
  #   end
  #
  # end




end
