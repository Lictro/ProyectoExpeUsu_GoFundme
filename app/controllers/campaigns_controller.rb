class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new]
  # GET /campaigns run -p port:2 -it my-py-app
  # GET /campaigns.json cd tarea && python main.py
  def index
    @campaigns = Campaign.all.order(created_at: :asc)
    @campaignsEdu = Campaign.popular.where(:category => "EDUCATION").order(created_at: :asc)
    @campaignsSpr = Campaign.popular.where(:category => "SPORTS").order(created_at: :asc)
    @campaignsMed = Campaign.popular.where(:category => "MEDICINE").order(created_at: :asc)
    @campaignsFoo = Campaign.popular.where(:category => "FOOD").order(created_at: :asc)
    @campaignsPet = Campaign.popular.where(:category => "PETS").order(created_at: :asc)
  end

  def show
    @campaign = Campaign.find(params[:id])
    @donation = Donation.new
    @comment = Comment.new
    @donations = @campaign.donations
    @comments = @campaign.comments
  end

  def like
     @campaign = Campaign.find(params[:id])
     @campaign.like(@campaign.id)
  end

  def new
    @campaign = Campaign.new
  end

  def edit
  end

  def create
    @campaign = current_user.campaigns.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @campaign.update(mod_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def campaign_params
      params.require(:campaign).permit(:title, :description, :review, :goal, :category,:finalized_in,:avatar)
    end

    def mod_params
      params.require(:campaign).permit(:title, :description, :review, :category,:avatar)
    end
end
