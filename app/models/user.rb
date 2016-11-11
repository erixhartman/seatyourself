class User < ApplicationRecord
  has_secure_password
  has_many :reservations
  has_many :restaurants, through: :reservations
  has_many :owned_restaurants, class_name: "Restaurant"
  has_many :reviews
  has_many :restaurants, through: :reviews

  def admin?
     admin
  end
end
