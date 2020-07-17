require 'rails_helper'

RSpec.describe "ZipCodes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/zip_codes"
      expect(response).to have_http_status(:success)
    end
  end

end
