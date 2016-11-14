class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :date, :time, presence: true
  validate :available
  # validates :seats, numericality: {:less_than_or_equal_to => :available, message: "CUSTOM ERROR MESSAGE"}

 def available
   if self.seats <= 0
     errors.add(:seats, "You must reserve at least one seat")
   elsif available_capacity < self.seats
     errors.add(:seats, "There is not a reservation available for your party at this time")
   end
 end


 def available_capacity
   restaurant.max_seats - restaurant.reservations.sum(:seats)
 end
 #
 # def reservations_at(time)
 #   self.reservations.where(time: time.beginning_of_hour..time.end_of_hour)
 # end


end
