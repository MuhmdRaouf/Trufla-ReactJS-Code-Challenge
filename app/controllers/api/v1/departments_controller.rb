class Api::V1::DepartmentsController < ApplicationController
  def index
    render json: Department.active
  end

  def show
    render json: Department.find(params[:id])
  end
end
