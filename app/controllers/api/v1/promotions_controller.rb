class Api::V1::PromotionsController < ApplicationController
  def index
    render json: Promotion.active
  end

  def show
    render json: Promotion.find(params[:id])
  end
end
