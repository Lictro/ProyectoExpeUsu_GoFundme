class Campaign < ApplicationRecord
  belongs_to :user
  before_save :default_values

  def default_values
    self.likes ||= 0
  end

  CATEGORIES = ['EDUCATION','SPORTS','MEDICINE', 'FOOD','PETS']
end
