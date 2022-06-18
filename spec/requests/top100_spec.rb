require 'rails_helper'

RSpec.describe "Top100s", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/top100"
      expect(response).to have_http_status(:success)
    end
  end

end
