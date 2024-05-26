class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :title
      t.string :type
      t.string :img
      t.text :description

      t.timestamps
    end
  end
end
