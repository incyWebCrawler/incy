class Processor
  attr_reader :processed_links

  def initialize
    @processed_links = []
    @domain = ""
  end

  def process_links(links = {})
    @domain = links["url"]
    unprocessed_links = links["links_arr"]

    unprocessed_links.each do |link|
      if link.chars.first == "/"
        if link.length > 1
          if !@processed_links.include? link
            @processed_links << link
          end
        end
      end
    end
  end

  def create_links
    @processed_links.map!{|link| @domain+link}
  end
end


dummy_info = { "url" => "http://www.makersacademy.com",
                "title" => "MakersAcademy",
                "links_arr" => ["https://www.mozilla.org/en-GB/firefox/new/", "http://www.google.com/chrome/", "/", "/graduates/", "/employers/", "/curriculum/", "/about-us/", "/", "/graduates/", "/employers/", "/curriculum/", "/about-us/", "/apply", "/graduates/", "/employers/", "/curriculum/", "/curriculum/", "http://blog.makersacademy.com/changingourprices/", "http://blog.makersacademy.com/changingourprices/", "/payment/", "/apply", "/about-us/", "http://www.github.com/makersacademy", "http://www.facebook.com/MakersAcademy", "http://twitter.com/makersacademy", "https://www.youtube.com/user/makersacademy", "http://blog.makersacademy.com/", "https://www.switchup.org/bootcamps/makers-academy", "https://www.quora.com/makers-academy", "https://www.coursereport.com/schools/makers-academy#/reviews", "mailto:contact@makersacademy.com", "tel:02038178870", "http://makers-academy.breezy.hr/p/20f2efaba8d1-coach--engineer", "/code-of-conduct/", "/terms/", "/remote-terms/", "/privacy/", "https://mixpanel.com/f/partner"] }

pro = Processor.new

# pro.process_links(dummy_info)
# pro.processed_links
# pro.create_links
# puts pro.processed_links
