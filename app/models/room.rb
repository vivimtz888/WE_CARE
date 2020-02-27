class Room < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, :price, :address, presence: true

  def booked_recent_dates
    bookings.where("end_date > '#{Date.today}'").map do |booking|
      booking.booked_dates
    end.flatten
  end

  def available_between?(start_date, end_date)
    bookings.where(
      ":picked_start_date < start_date AND end_date < :picked_end_date",
      picked_start_date: start_date,
      picked_end_date: end_date
    ).or(
      conflicting_bookings_on(start_date).or(conflicting_bookings_on(end_date))
    ).empty?
  end

  def conflicting_bookings_on(date)
    bookings.where("? BETWEEN start_date AND end_date ", date)
  end
end
