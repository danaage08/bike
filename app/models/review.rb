class Review < ApplicationRecord
  validates :review, presence: true, length: { maximum: 100 }
  belongs_to :user
  belongs_to :order

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "order_id", "review", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["order", "user"]
  end
end
