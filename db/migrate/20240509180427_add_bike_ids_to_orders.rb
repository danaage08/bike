class AddBikeIdsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :bike_ids, :string
  end
end
