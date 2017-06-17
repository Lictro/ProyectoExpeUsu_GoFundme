class Comment < ApplicationRecord
  validates :autor, presence: true, length: {maximum: 15}
  validates :message, presence: true, length: {maximum: 30}

  belongs_to :campaign
end
