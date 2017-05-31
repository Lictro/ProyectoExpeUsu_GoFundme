class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  # GET /campaigns run -p port:2 -it my-py-app
  # GET /campaigns.json cd tarea && python main.py
  def index
    @campaigns = Campaign.all.order(created_at: :asc)
    @campaignsEdu = Campaign.where(:category => "EDUCATION").order(created_at: :asc)
    @campaignsSpr = Campaign.where(:category => "SPORTS").order(created_at: :asc)
    @campaignsMed = Campaign.where(:category => "MEDICINE").order(created_at: :asc)
    @campaignsFoo = Campaign.where(:category => "FOOD").order(created_at: :asc)
    @campaignsPet = Campaign.where(:category => "PETS").order(created_at: :asc)
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
    @donation = Donation.new
    @campaign = Campaign.find(params[:id])
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  # POST /campaigns.json
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

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
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

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
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
      params.require(:campaign).permit(:title, :description, :review, :goal, :category,:finalized_in)
    end

    def mod_params
      params.require(:campaign).permit(:title, :description, :review, :category)
    end
end
