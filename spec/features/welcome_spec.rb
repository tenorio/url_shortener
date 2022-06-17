require 'rails_helper'

RSpec.feature "Welcomes", type: :feature do
  it 'should display app title in homepage' do
    visit('/')
    expect(page).to have_content('URL shortener')
  end
end
