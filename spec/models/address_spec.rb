require 'rails_helper'

RSpec.describe Address, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.url = 'http://example.com'
  end

  it "is not valid without a URL" do
    address = Address.new(url: nil)

    expect(address).to_not be_valid
  end
end
