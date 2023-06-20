class AddInCartToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :in_cart, :boolean
  end
end
