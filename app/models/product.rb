class Product < ApplicationRecord
  belongs_to :department
  has_many   :product_promotions
  has_many   :promotions, -> { where is_deleted: false }, dependent: :destroy, through: :product_promotions

  def self.active
    Product.where.not(is_deleted: true)
  end
end
