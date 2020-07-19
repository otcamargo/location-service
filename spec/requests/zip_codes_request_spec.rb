require 'rails_helper'

RSpec.describe "ZipCodes", type: :request do
  let(:zip_codes_create_payload) { load_json('requests/zip_codes_create_payload.json') }
  let(:zip_codes_delete_payload) { load_json('requests/zip_codes_delete_payload.json') }

  before do
    stub_request(:get, "https://viacep.com.br/ws/04516012/json/").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Ruby'
           }).
           to_return(status: 200, body: "{ \"cep\": \"04516-012\", \"logradouro\": \"Avenida Pavão\", \"complemento\": \"de 521/522 ao fim\", \"bairro\": \"Indianópolis\", \"localidade\": \"São Paulo\", \"uf\": \"SP\", \"unidade\": \"\", \"ibge\": \"3550308\", \"gia\": \"1004\" }", headers: {})
  end

  describe "GET /" do
    it "returns http success" do
      get "/zip_codes"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /" do
    it "returns http success" do
      post "/zip_codes/", params: zip_codes_create_payload
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /" do
    it "returns http success" do
      delete "/zip_codes/", params: zip_codes_delete_payload
      expect(response).to have_http_status(:success)
    end
  end

end
