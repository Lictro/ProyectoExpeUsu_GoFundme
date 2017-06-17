class Campaign < ApplicationRecord
  belongs_to :user
  before_save :default_values

  has_attached_file :avatar, styles: { medium: "100x100>", thumb: "50x50" }, default_url: "https://hipgive.org/wp-content/uploads/2016/07/Vector_Donate_Icon_3.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :donations, dependent: :destroy
  has_many :comments

  validates :title, presence: true
  validates :review, presence: true, length: {maximum: 20}
  validates :description, presence: true, length: {maximum: 30}
  validates :goal, presence: true,numericality: { greater_than_or_equal_to: 500 }
  validates :category, presence: true

  scope :ongoing, -> {where(["finalized_in >= ?", DateTime.now.to_date])}
  scope :popular, -> {ongoing.order(likes: :desc)}

  def default_values
    self.likes ||= 0
  end

  def like(id_cam)
    @campaign = Campaign.find(id_cam)
    @campaign.increment!(:likes, 1)
  end

  def collection(id_camp)
    @donation = Donation.where(:campaign_id => id_camp)
    total = 0
    @donation.each do |donation|
      total = donation.amount + total
    end
    return total
  end

  def progress(id_camp)
    @campaign = Campaign.find(id_camp)
    amout = @campaign.goal
    return collection(id_camp)/amout*100
  end

  CATEGORIES = ['EDUCATION','SPORTS','MEDICINE', 'FOOD','PETS']
end
