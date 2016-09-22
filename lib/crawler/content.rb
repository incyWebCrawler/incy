class Content

  def export_content
    process_content
    File.open("site_words.txt", 'w+') { |file| file.write(@words) }
  end

  # def create_magic_cloud
  #   MagicCloud::Cloud.new(export_content, rotate: :free, scale: :log, file: "site.png")
  # end


  private

  def process_content
    @words = Page.pluck(:words).to_s
    # @words.gsub!(/[A-z]\w/)
    @words.gsub!(/\d/, " ")
    @words.gsub!('\n', " ")
    @words.gsub!(/[^\w\s]/, "")
  end

end
