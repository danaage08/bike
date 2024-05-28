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
      # Находим все заказы, которые имеют незавершенный статус и пересекаются с заданным временным интервалом
    orders = Order.where("admin_status != 'completed' AND (
      (start_date <= :end_date AND end_date >= :start_date) OR
      (start_date <= :end_date AND end_date >= :start_date) OR
      (start_date >= :start_date AND start_date <= :end_date)
    )", start_date: start_date, end_date: end_date)

    # Получаем все идентификаторы велосипедов из найденных заказов
    booked_bike_ids = orders.map { |order| order.bike_ids.is_a?(Array) ? order.bike_ids : order.bike_ids.split(',') }.flatten.uniq

    # Находим все велосипеды, которые не были забронированы в указанный период
    available_bikes = Bike.where.not(id: booked_bike_ids)

    return available_bikes
  end

  def self.ransackable_attributes(auth_object = nil)
    super + %w(status)
  end

  def self.ransackable_associations(auth_object = nil)
    super + %w(orders)
  end
end
