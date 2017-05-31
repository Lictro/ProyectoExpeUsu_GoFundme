class Campaign < ApplicationRecord
  belongs_to :user
  before_save :default_values

  has_many :comments
  has_many :donations

  def default_values
    self.likes ||= 0
  end

  CATEGORIES = ['EDUCATION','SPORTS','MEDICINE', 'FOOD','PETS']
end
