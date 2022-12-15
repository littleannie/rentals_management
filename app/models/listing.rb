class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :missions, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :num_rooms, presence: true
end
