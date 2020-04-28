require 'rails_helper'

RSpec.describe "VulnerableZones", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/vulnerable_zones/"
      expect(response).to have_http_status(:success)
    end
  end

end
