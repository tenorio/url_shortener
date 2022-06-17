require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it 'should have a 200 status code' do
      get root_path
      expect(response.status).to eq(200)
    end

    it 'should render the correct template' do
      get root_path
      expect(response).to render_template('index')
    end
  end
end
