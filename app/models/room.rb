class Room < ApplicationRecord
    has_many :bookings
    validates :name, :price, :address, presence: true

    def unavailable_dates
      bookings.pluck(:start_date, :end_date).map do |range|
        { from: range[0], to: range[1] }
      end
   end
end
