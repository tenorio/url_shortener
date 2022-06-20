class Address < ApplicationRecord
  include Bijective

  after_create_commit :encode_url, :crawl_url_title

  validates :url, presence: true

  private

  def encode_url
    encoded_str = Address.bijective_encode(id)

    address = Address.find(id)
    address.url_shortened = encoded_str
    address.save!
  end

  def crawl_url_title
    HardJob.perform_async(id)
  end
end
