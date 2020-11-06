require 'rails_helper'
require 'request_helper'

RSpec.describe "Api::V1::Promotions", type: :request do

  describe "GET /index" do
    it "returns list of active promotions" do
      first_promotion  =  create(:promotion)
      second_promotion =  create(:promotion)
      deleted_promotion =  create(:promotion, is_deleted: true)
      inactive_promotion  =  create(:promotion, is_active: false)

      get "/api/v1/promotions"
      
      expect(response).to have_http_status(:success)
      expect(parsed_body.count).to eq 2
      expect(parsed_body[0]["id"]).to eq first_promotion.id
      expect(parsed_body[0]["code"]).to eq first_promotion.code
      expect(parsed_body[0]["discount"]).to eq first_promotion.discount
      expect(parsed_body[1]["id"]).to eq second_promotion.id
      expect(parsed_body[1]["code"]).to eq second_promotion.code
      expect(parsed_body[1]["discount"]).to eq second_promotion.discount
    end
  end

  describe "GET /show" do
    it "returns specific promotion" do
      first_promotion  =  create(:promotion)
      second_promotion =  create(:promotion)

      get "/api/v1/promotions/#{first_promotion.id}"
      expect(response).to have_http_status(:success)
      expect(parsed_body["id"]).to eq first_promotion.id
      expect(parsed_body["code"]).to eq first_promotion.code
      expect(parsed_body["discount"]).to eq first_promotion.discount

      get "/api/v1/promotions/#{second_promotion.id}"
      expect(response).to have_http_status(:success)
      expect(parsed_body["id"]).to eq second_promotion.id
      expect(parsed_body["code"]).to eq second_promotion.code
      expect(parsed_body["discount"]).to eq second_promotion.discount
    end
  end

end
