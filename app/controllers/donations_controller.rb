class DonationsController < ApplicationController
  def create
    @campaign = Campaign.find(params[:campaign_id])
    @donation = @campaign.donations.create(donation_params)
    redirect_to @campaign
  end

  private
    def donation_params
      params.require(:donation).permit(:autor,:message,:amount)
    end
end
