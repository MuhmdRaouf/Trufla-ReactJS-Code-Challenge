class Init < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string   :name, unique: true
      t.boolean  :is_deleted, default: false

      t.timestamps
    end

    create_table :products do |t|
      t.string     :name, unique: true
      t.float      :price
      t.boolean    :is_deleted, default: false
      t.references :department, index: true, null: false, foreign_key: true

      t.timestamps
    end

    create_table :promotions do |t|
      t.string   :code, unique: true
      t.boolean  :active, default: false
      t.integer  :discount
      t.boolean  :is_deleted, default: false

      t.timestamps
    end

    create_table :product_promotions do |t|
      t.references :promotion, index: true, null: false, foreign_key: true
      t.references :product, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
