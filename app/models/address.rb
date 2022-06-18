class Address < ApplicationRecord
  include Bijective

  after_create_commit :encode_url

  validates :url, presence: true

  private

  def encode_url
    encoded_str = Address.bijective_encode(id)

    address = Address.find(id)
    address.url_shortened = encoded_str
    address.save!
  end
end
