class CreateHelpts < ActiveRecord::Migration[7.0]
  def change
    create_table :helpts do |t|
      t.string :name
      t.string :phone_number
      t.string :status

      t.timestamps
    end
  end
end
