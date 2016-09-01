class Processor
  attr_reader :processed_links

  def initialize(url)
    @processed_links = []
    @domain = url
    @unprocessed_links = []
    # @unprocessed_links << links[:links_array]
  end

  def create_links(links)
    (links[:links_array]).each{|el| @unprocessed_links << el}
    process_links
    @processed_links.map!{ |link| @domain + link }
  end

  private

  def process_links
    @unprocessed_links.each do |link|
        link.chomp!('/')
      if checker(link)
        @processed_links << link
      end
    end
  end

  def checker(link)
    (link.chars.first == "/") && (link.length > 1)
     #&& (!@processed_links.include? link)
  end
end
