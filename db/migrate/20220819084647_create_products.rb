class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :quantity
      t.string :brands
      t.string :categories
      t.string :ingredients_text
      t.timestamps
    end
  end
end
