class User < ApplicationRecord
  has_many :orders
  has_one :review
    validates :delivery_address, presence: true, length: { maximum: 255 }
  validates :return_address, presence: true, length: { maximum: 255 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
  validate :end_date_after_start_date
  validate :bikes_present
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
