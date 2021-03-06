class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :unbooked_date_range
  validate :start_date_after_today

  def booked_dates
    (start_date..end_date).to_a
  end

  private

  def unbooked_date_range
    return if room.available_between?(start_date, end_date)

    errors.add(:end_date, "room is not available for the given date range")
  end


  private

  def start_date_after_today
    return if end_date.blank? || start_date.blank?

    if start_date < Date.today
      errors.add(:start_date, "must be after today")
    end
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
