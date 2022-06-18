require 'rails_helper'

RSpec.describe "Addresses", type: :request do
  describe "GET /create" do
    xit "returns http success" do
      get "/address/create"
      expect(response).to have_http_status(:success)
    end
  end

  random_str = [*'a'..'z', *'A'..'Z'].sample(rand(10)).join

  describe "GET /#{ random_str }" do
    it "redirects to original URL" do
      get "/#{ random_str }"

      expect(response).to have_http_status(:redirect)
    end
  end
end
