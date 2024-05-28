class Order < ApplicationRecord
  has_and_belongs_to_many :bikes
  belongs_to :user
  has_one :review

  enum admin_status: { in_processing: "В обработке", check: "Забронировано", in_progress: "Выполняется", delivering: "Доставляется", completed: "Завершено", cancel: "Отменено" }
  enum status: { pay: "Оплачено", no_pay: "Не оплачено" }

  validates :delivery_address, presence: true, length: { maximum: 255 }
  validates :return_address, presence: true, length: { maximum: 255 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
  validate :end_date_after_start_date
  validate :bikes_present

  after_create :update_bike_status

  def update_bike_status
    self.bikes.each do |bike|
      if self.completed? || self.in_processing? || self.check?
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
