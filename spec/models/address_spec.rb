require 'rails_helper'

RSpec.describe Address, type: :model do
  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.url = 'http://example.com'

    expect(subject).to be_valid
  end

  it "is not valid without a URL" do
    subject.url = nil

    expect(subject).to_not be_valid
  end

  it 'should create an address' do
    subject.url = 'http://www.example.com'
    subject.save!

    expect(subject.url).to eq('http://www.example.com')
  end

  it 'should create an address URL and encode it' do
    subject.url = 'http://www.example.com'
    subject.save!
    subject.reload
    subject.run_callbacks(:commit)

    expect(subject.url_shortened).not_to be_nil
  end
end
