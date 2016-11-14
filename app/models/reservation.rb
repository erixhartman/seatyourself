class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :date, :time, presence: true
  validate :available
  # validates :seats, numericality: {:less_than_or_equal_to => :available, message: "CUSTOM ERROR MESSAGE"}

 def available
   if self.seats <= 0
     errors.add(:seats, "You must reserve at least one seat")
   elsif self.restaurant.max_seats < self.seats
     errors.add(:seats, "There is not a reservation available for your party at this time")
   end
 end


 private
 def available_capacity
   max_seats - reservations_at(time).sum(:seats)
 end

 def reservations_at(time)
   reservations.where(time: time.beginning_of_hour..time.end_of_hour)
 end


end
