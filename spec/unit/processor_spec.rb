require 'rails_helper'

describe Processor do
  before do
    @dummy_info = { url: "http://www.makersacademy.com",
                    title: "MakersAcademy",
                    links_array: ["https://www.mozilla.org/en-GB/firefox/new/", "http://www.google.com/chrome/", "/", "/graduates/", "/employers/", "/curriculum/", "/about-us/", "/", "/graduates/", "/employers/", "/curriculum/", "/about-us/", "/apply", "/graduates/", "/employers/", "/curriculum/", "/curriculum/", "http://blog.makersacademy.com/changingourprices/", "http://blog.makersacademy.com/changingourprices/", "/payment/", "/apply", "/about-us/", "http://www.github.com/makersacademy", "http://www.facebook.com/MakersAcademy", "http://twitter.com/makersacademy", "https://www.youtube.com/user/makersacademy", "http://blog.makersacademy.com/", "https://www.switchup.org/bootcamps/makers-academy", "https://www.quora.com/makers-academy", "https://www.coursereport.com/schools/makers-academy#/reviews", "mailto:contact@makersacademy.com", "tel:02038178870", "http://makers-academy.breezy.hr/p/20f2efaba8d1-coach--engineer", "/code-of-conduct/", "/terms/", "/remote-terms/", "/privacy/", "https://mixpanel.com/f/partner"] }
  end

  subject { described_class.new(@dummy_info) }

  describe '#class methods' do
    it { is_expected.to(respond_to(:process_links)) }
    it { is_expected.to(respond_to(:create_links)) }
  end

  describe '#process_links' do

    it 'removes links from other domains' do
      subject.process_links
      expect(subject.processed_links).not_to include("https://www.mozilla.org/en-GB/firefox/new/")
      expect(subject.processed_links).to include("/graduates/")
    end


    it 'appends domain to links' do
      subject.process_links
      subject.create_links
      expect(subject.processed_links).to include("http://www.makersacademy.com/graduates/")
    end
  end


end
