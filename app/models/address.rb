class Address < ApplicationRecord
  validates :url, presence: true
end
