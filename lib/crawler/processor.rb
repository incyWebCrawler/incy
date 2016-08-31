class Processor
  attr_reader :processed_links

  def initialize(links)
    @processed_links = []
    @domain = links[:url]
    @unprocessed_links = links[:links_array]
  end

  def process_links
    @unprocessed_links.each do |link|
      if checker(link)
        @processed_links << link
      end
    end
  end

  def create_links
    @processed_links.map!{ |link| @domain + link }
  end

  private

  def checker(link)
    (link.chars.first == "/") && (link.length > 1) && (!@processed_links.include? link)
  end
end
