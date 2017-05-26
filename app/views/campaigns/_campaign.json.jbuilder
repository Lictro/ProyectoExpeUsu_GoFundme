json.extract! campaign, :id, :title, :description, :review, :goal, :category, :user_id, :likes, :finalized_in, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
