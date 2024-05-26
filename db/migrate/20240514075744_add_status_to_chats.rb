class AddStatusToChats < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :status, :string
  end
end
