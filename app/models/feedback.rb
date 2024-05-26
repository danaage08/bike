# app/models/feedback.rb
class Feedback < ApplicationRecord
  enum status: { unprocessed: 0, processed: 1 }

  before_validation :set_default_status, on: :create
  before_validation :set_user_info, on: :create, if: :user_signed_in?

  validates :name, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }

  private

  def set_default_status
    self.status ||= :unprocessed
  end

  def set_user_info
    self.name ||= current_user.name if current_user.name.present?
    self.phone_number ||= current_user.phone_number if current_user.phone_number.present?
  end
end
