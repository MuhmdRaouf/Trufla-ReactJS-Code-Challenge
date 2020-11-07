class Api::V1::DashboardController < ApplicationController
  def index
    dashboard_products = []
    products_id = 0
    total_pages_count = 0

    departments = Department.active
    department_filter = params[:department]
    departments = departments.where(id: department_filter) if department_filter && !department_filter.empty?
    departments.each do |department|
      department.products.each do |product|
        promotions = product.promotions
        promotion_filter = params[:promotion]
        promotions = promotions.where(id: promotion_filter) if promotion_filter && !promotion_filter.empty?
        promotions.each do |promotion|
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

    page_number = params[:page]
    if page_number && !page_number.empty?
      total_pages_count = Kaminari.paginate_array(dashboard_products).page(page_number).total_pages
      dashboard_products = Kaminari.paginate_array(dashboard_products).page(page_number)
    end

    render json: { dashboard_products: dashboard_products , total_pages_count: total_pages_count }
  end
end
