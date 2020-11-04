class Department < ApplicationRecord
  has_many :products, -> { where is_deleted: false }, dependent: :destroy

  def self.active
    Department.where.not(is_deleted: true)
  end
end
