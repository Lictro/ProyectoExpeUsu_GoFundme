class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.text :review_camp
      t.string :category
      t.integer :user_id
      t.string :url
      t.integer :likes_count
      t.date :finalized_in

      t.timestamps
    end
  end
end
