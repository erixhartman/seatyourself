class Restaurant < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :owner, class_name: "User"
end
