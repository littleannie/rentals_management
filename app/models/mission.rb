class Mission < ApplicationRecord
  belongs_to :listing

  validates :mission_type, acceptance: { accept: %w[first_checkin last_checkout last_checkout] }
end
