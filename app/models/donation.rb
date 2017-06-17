class Donation < ApplicationRecord
  validates :autor, presence: true, length: {maximum: 15}
  validates :message, presence: true, length: {maximum: 30}
  validates :amount, presence: true,numericality: { greater_than_or_equal_to: 0}

end
