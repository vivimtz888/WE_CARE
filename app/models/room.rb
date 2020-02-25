class Room < ApplicationRecord
    has_many :bookings
    has_many :users, through: :booking, dependent: :destroy
    validates :name, :price, presence: true

    def unavailable_dates
      bookings.pluck(:start_date, :end_date).map do |range|
        { from: range[0], to: range[1] }
      end
   end
end
