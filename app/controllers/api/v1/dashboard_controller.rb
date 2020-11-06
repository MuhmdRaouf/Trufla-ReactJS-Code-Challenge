class Api::V1::DashboardController < ApplicationController
  def index
    dashboard_products = []
    products_id = 0
    departments = Department.active
    department_filter = params[:department]
    departments = departments.where(id: department_filter) if department_filter && !department_filter.empty?
    departments.each do |department|
      department.products.each do |product|
        promotions = product.promotions
        promotion_filter = params[:promotion]
        promotions = promotions.where(id: promotion_filter) if promotion_filter && !promotion_filter.empty?
        promotions.each_with_index do |promotion, index|
          products_id += 1
          dashboard_products.append(
            {
              id: products_id, # to avoid duplicate ids which cause crash while rendering in react.
              product_id: product.id,
              name: product.name,
              price: product.price,
              department_id: department.id,
              department_name: department.name,
              promotion_id: promotion.id,
              promotion: promotion.code,
              is_active: promotion.is_active,
              discount: promotion.discount
            }
          )
        end
      end
    end
    render json: dashboard_products
  end
end
