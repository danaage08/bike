class Bike < ApplicationRecord
  has_many :orders

  enum status: { free: "Свободен", busy: "Занят" }

  def update_status
    if orders.completed.exists?
      update(status: :free)
    else
      update(status: :busy)
    end
  end

  enum bike_type: {
    mountain: "горный",
    urban: "городской",
    urban_economy: "городской эконом",
    carbon: "карбон"
  }

  def self.ransackable_attributes(auth_object = nil)
    super + %w(status)
  end

  def self.ransackable_associations(auth_object = nil)
    super + %w(orders)
  end
end
