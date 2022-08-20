class AddImageurlToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :imageurl, :string
  end
end
