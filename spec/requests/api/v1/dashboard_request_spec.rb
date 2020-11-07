require 'rails_helper'
require 'request_helper'

RSpec.describe "Api::V1::Dashboards", type: :request do
  describe "GET /index" do
    it "should return dashboard dataset" do
      department = create(:department_with_products, products_count: 1)
      product_promotions = department.products.map { |product| create(:product_promotion, product: product) }

      get "/api/v1/dashboard"

      expect(response).to have_http_status(:success)
      expect(parsed_body["dashboard_products"].first["department_id"]).to eq department.id
      expect(parsed_body["dashboard_products"].first["department_name"]).to eq department.name
      expect(parsed_body["dashboard_products"].first["product_id"]).to eq product_promotions.first.product.id
      expect(parsed_body["dashboard_products"].first["name"]).to eq product_promotions.first.product.name
      expect(parsed_body["dashboard_products"].first["price"]).to eq product_promotions.first.product.price
      expect(parsed_body["dashboard_products"].first["promotion_id"]).to eq product_promotions.first.promotion.id
      expect(parsed_body["dashboard_products"].first["promotion"]).to eq product_promotions.first.promotion.code
      expect(parsed_body["dashboard_products"].first["is_active"]).to eq product_promotions.first.promotion.is_active
      expect(parsed_body["dashboard_products"].first["discount"]).to eq product_promotions.first.promotion.discount
    end

    it "should return dashboard dataset filtered by department name" do
      first_department = create(:department_with_products, products_count: 1)
      first_product_promotions = first_department.products.map { |product| create(:product_promotion, product: product) }

      second_department = create(:department_with_products, products_count: 1)
      second_product_promotions = second_department.products.map { |product| create(:product_promotion, product: product) }

      get "/api/v1/dashboard", params: { department: second_department.id }

      expect(response).to have_http_status(:success)
      expect(parsed_body["dashboard_products"].count).to eq 1
      expect(parsed_body["dashboard_products"].first["department_id"]).to eq second_department.id
      expect(parsed_body["dashboard_products"].first["department_name"]).to eq second_department.name
      expect(parsed_body["dashboard_products"].first["product_id"]).to eq second_product_promotions.first.product.id
      expect(parsed_body["dashboard_products"].first["name"]).to eq second_product_promotions.first.product.name
      expect(parsed_body["dashboard_products"].first["price"]).to eq second_product_promotions.first.product.price
      expect(parsed_body["dashboard_products"].first["promotion_id"]).to eq second_product_promotions.first.promotion.id
      expect(parsed_body["dashboard_products"].first["promotion"]).to eq second_product_promotions.first.promotion.code
      expect(parsed_body["dashboard_products"].first["is_active"]).to eq second_product_promotions.first.promotion.is_active
      expect(parsed_body["dashboard_products"].first["discount"]).to eq second_product_promotions.first.promotion.discount
    end

    it "should return dashboard dataset filtered by promotion code" do
      first_department = create(:department_with_products, products_count: 1)
      first_product_promotions = first_department.products.map { |product| create(:product_promotion, product: product) }

      second_department = create(:department_with_products, products_count: 1)
      second_product_promotions = second_department.products.map { |product| create(:product_promotion, product: product) }

      get "/api/v1/dashboard", params: { promotion: second_product_promotions.first.promotion.id }

      expect(response).to have_http_status(:success)
      expect(parsed_body["dashboard_products"].count).to eq 1
      expect(parsed_body["dashboard_products"].first["department_id"]).to eq second_department.id
      expect(parsed_body["dashboard_products"].first["department_name"]).to eq second_department.name
      expect(parsed_body["dashboard_products"].first["product_id"]).to eq second_product_promotions.first.product.id
      expect(parsed_body["dashboard_products"].first["name"]).to eq second_product_promotions.first.product.name
      expect(parsed_body["dashboard_products"].first["price"]).to eq second_product_promotions.first.product.price
      expect(parsed_body["dashboard_products"].first["promotion_id"]).to eq second_product_promotions.first.promotion.id
      expect(parsed_body["dashboard_products"].first["promotion"]).to eq second_product_promotions.first.promotion.code
      expect(parsed_body["dashboard_products"].first["is_active"]).to eq second_product_promotions.first.promotion.is_active
      expect(parsed_body["dashboard_products"].first["discount"]).to eq second_product_promotions.first.promotion.discount
    end

    it "should return dashboard dataset filtered by both department name and promotion code" do
      first_department = create(:department_with_products, products_count: 1)
      first_product_promotions = first_department.products.map { |product| create(:product_promotion, product: product) }

      second_department = create(:department_with_products, products_count: 2)
      second_product_promotions = second_department.products.map { |product| create(:product_promotion, product: product) }

      get "/api/v1/dashboard", params: { department: second_department.id, promotion: second_product_promotions[1].promotion.id }

      expect(response).to have_http_status(:success)
      expect(parsed_body["dashboard_products"].count).to eq 1
      expect(parsed_body["dashboard_products"].first["department_id"]).to eq second_department.id
      expect(parsed_body["dashboard_products"].first["department_name"]).to eq second_department.name
      expect(parsed_body["dashboard_products"].first["product_id"]).to eq second_product_promotions[1].product.id
      expect(parsed_body["dashboard_products"].first["name"]).to eq second_product_promotions[1].product.name
      expect(parsed_body["dashboard_products"].first["price"]).to eq second_product_promotions[1].product.price
      expect(parsed_body["dashboard_products"].first["promotion_id"]).to eq second_product_promotions[1].promotion.id
      expect(parsed_body["dashboard_products"].first["promotion"]).to eq second_product_promotions[1].promotion.code
      expect(parsed_body["dashboard_products"].first["is_active"]).to eq second_product_promotions[1].promotion.is_active
      expect(parsed_body["dashboard_products"].first["discount"]).to eq second_product_promotions[1].promotion.discount
    end
  end
end
