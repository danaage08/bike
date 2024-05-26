class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true
      t.string :delivery_address
      t.string :return_address
      t.string :status

      t.timestamps
    end
  end
end
