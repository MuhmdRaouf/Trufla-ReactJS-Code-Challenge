require 'rails_helper'
require 'request_helper'

RSpec.describe "Api::V1::Departments", type: :request do

  describe "GET /index" do
    it "returns list of active departments" do
      first_department   =  create(:department)
      second_departments   =  create(:department)
      deleted_department = create(:department, is_deleted: true)

      get "/api/v1/departments"

      expect(response).to have_http_status(:success)
      expect(parsed_body.count).to eq 2
      expect(parsed_body[0]["id"]).to eq first_department.id
      expect(parsed_body[0]["name"]).to eq first_department.name
      expect(parsed_body[1]["id"]).to eq second_departments.id
      expect(parsed_body[1]["name"]).to eq second_departments.name
    end
  end

  describe "GET /show" do
    it "returns specific department" do
      first_departments  =  create(:department)
      second_departments =  create(:department)

      get "/api/v1/departments/#{first_departments.id}"
      expect(response).to have_http_status(:success)
      expect(parsed_body["id"]).to eq first_departments.id
      expect(parsed_body["name"]).to eq first_departments.name

      get "/api/v1/departments/#{second_departments.id}"
      expect(response).to have_http_status(:success)
      expect(parsed_body["id"]).to eq second_departments.id
      expect(parsed_body["name"]).to eq second_departments.name
    end
  end
end
