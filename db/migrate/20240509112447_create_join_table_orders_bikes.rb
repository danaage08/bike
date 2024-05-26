class CreateJoinTableOrdersBikes < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders, :bikes do |t|
      # t.index [:order_id, :bike_id]
      # t.index [:bike_id, :order_id]
    end
  end
end
