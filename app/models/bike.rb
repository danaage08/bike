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
    mountain: "Горный",
    urban: "городской",
    urban_economy: "городской эконом",
    carbon: "Карбон"
  }

   def available?(start_date, end_date)
    overlapping_orders = Order.where("admin_status != 'completed' AND (
      start_date <= :end_date AND end_date >= :start_date
    )", start_date: start_date, end_date: end_date)

    overlapping_orders.none? { |order| order.bike_ids.include?(self.id.to_s) }
  end

  def self.ransackable_attributes(auth_object = nil)
    super + %w(status)
  end

  def self.ransackable_associations(auth_object = nil)
    super + %w(orders)
  end
end
