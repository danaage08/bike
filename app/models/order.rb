class Order < ApplicationRecord
  has_and_belongs_to_many :bikes
  belongs_to :user
  has_one :review

  enum admin_status: { in_processing: "В обработке", in_progress: "Выполняется", delivering: "Доставляется", completed: "Завершено", cancel: "Отменено" }
  enum status: { pay: "Оплачено", no_pay: "Не оплачено" }

  after_create :update_bike_status

  def update_bike_status
    self.bikes.each do |bike|
      if self.completed?
        bike.update(status: :free)
      else
        bike.update(status: :busy)
      end
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "delivery_address", "end_date", "id", "return_address", "start_date", "status", "updated_at", "user_id", "admin_status", "total_price"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["bikes", "user"]
  end
end
