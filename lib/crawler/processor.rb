class Processor
  attr_reader :processed_links

  def initialize(url)
    @domain = url
    @unprocessed_links = []
  end

  def create_links(links)
    raw_links = links[:links_array]
    raw_links.each{|el| @unprocessed_links << el}
    process_links
    @processed_links.map!{ |link| @domain + link }
  end

  private

  def process_links
    @processed_links = []
    @unprocessed_links.each do |link|
        link.chomp!('/')
        @processed_links << link if checker(link)
    end
  end

  def checker(link)
    (link.chars.first == "/") && (link.length > 1)
  end
end
