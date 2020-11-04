class Promotion < ApplicationRecord
  has_many :product_promotions
  has_many :products, -> { where is_deleted: false }, dependent: :destroy, through: :product_promotions

  def self.active
    Promotion.where.not(is_deleted: true, active: false)
  end
end
