class AddPriceToBikes < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :price, :decimal
  end
end
