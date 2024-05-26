class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    unless table_exists?(:feedbacks)
      create_table :feedbacks do |t|
        t.string :name
        t.string :phone_number
        t.integer :status

        t.timestamps
      end
    end
  end
end
