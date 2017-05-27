json.extract! donation, :id, :autor, :message, :amount, :campaign_id, :created_at, :updated_at
json.url donation_url(donation, format: :json)
