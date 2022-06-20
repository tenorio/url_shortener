class HardJob
  include Sidekiq::Job

  def perform(address_id)
    a = Address.find(address_id) rescue nil

    if a
      url = check_http(a)
      doc = get_doc(url)
      update_address(a, doc) if doc
    end
  end

  # Idea for searching missing titles... there'd be a startup job running at X minutes.
  # def missing_titles
  #   Address.where(title: nil).each do |a|
  #     url = check_http(a)
  #     doc = get_doc(url)
  #     update_address(a, doc)
  #   end
  # end

  private

  def get_doc(url)
    Nokogiri::HTML(URI.open(url))
  end

  def check_http(address)
    if address.url.include? 'http'
      address.url
    else
      "http://#{address.url}"
    end
  end

  def update_address(a, doc)
    a.title = doc.at_css('title').children.to_s
    a.save!
  end
end
