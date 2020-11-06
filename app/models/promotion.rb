class Promotion < ApplicationRecord
  has_many :product_promotions
  has_many :products, -> { where is_deleted: false }, dependent: :destroy, through: :product_promotions

  def self.active
    Promotion.where.not(is_deleted: true).where.not(is_active: false)
  end
end
