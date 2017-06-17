class PagesController < ApplicationController
  def index
    @campaigns = Campaign.ongoing.order(created_at: :desc)
  end

  def profile
  end

  def dashboard
    @campaigns = current_user.campaigns.ongoing.order(created_at: :desc)
  end
end
