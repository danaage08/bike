class AddTotalPriceToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :total_price, :decimal, precision: 10, scale: 2, default: 0.0
  end
end
