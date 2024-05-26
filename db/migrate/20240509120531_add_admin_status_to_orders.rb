class AddAdminStatusToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :admin_status, :string
  end
end
