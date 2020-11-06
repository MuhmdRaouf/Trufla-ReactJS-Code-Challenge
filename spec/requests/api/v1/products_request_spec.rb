require 'rails_helper'
require 'request_helper'

RSpec.describe "Api::V1::Products", type: :request do

  describe "GET /index" do
    it "returns list of active products" do
      first_product  =  create(:product)
      second_product  =  create(:product)
      deleted_product =  create(:product, is_deleted: true)

      get "/api/v1/products"
      
      expect(response).to have_http_status(:success)
      expect(parsed_body.count).to eq 2
      expect(parsed_body[0]["id"]).to eq first_product.id
      expect(parsed_body[0]["name"]).to eq first_product.name
      expect(parsed_body[1]["id"]).to eq second_product.id
      expect(parsed_body[1]["name"]).to eq second_product.name
    end
  end

  describe "GET /show" do
    it "returns specific product" do
      first_product  =  create(:product)
      second_product =  create(:product)

      get "/api/v1/products/#{first_product.id}"
      expect(response).to have_http_status(:success)
      expect(parsed_body["id"]).to eq first_product.id
      expect(parsed_body["name"]).to eq first_product.name

      get "/api/v1/products/#{second_product.id}"
      expect(response).to have_http_status(:success)
      expect(parsed_body["id"]).to eq second_product.id
      expect(parsed_body["name"]).to eq second_product.name
    end
  end
end
